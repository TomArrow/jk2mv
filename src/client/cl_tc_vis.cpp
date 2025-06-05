/*
* Huge thanks to breadsticks! Wouldn't have been able to do any of this
* without his patience nor guidance.
*/

/* kindly adapted from XPC32 and breadsticks */

// TA: Ported from TaystJK, thanks for the great work.

#include "client.h"
#include "../qcommon/cm_local.h"
#include "../qcommon/cm_patch.h"
#include <algorithm>
#include <cfloat>
#include <cmath>


// if you dare to exceed this...
#define MAX_FACE_VERTS 64

typedef enum {TRIGGER_BRUSH, CLIP_BRUSH, CLIP_SOLIDITY_BRUSH, SLICK_BRUSH} visBrushType_t;

typedef struct {
	int numVerts;
	polyVert_t *verts;
	vec3_t mins;
	vec3_t maxs;
} visFace_t;

typedef struct visBrushNode_s {
	int numFaces;
	visFace_t *faces;
	vec3_t center;
	float distance;

	// This is a linked list.
	// Why? I dont know.
	// Let me know if you do.
	struct visBrushNode_s *next;
} visBrushNode_t;


static void add_triggers(void);
static void add_clips(void);
static void add_slicks(void);
static void gen_visible_brush(int brushnum, const vec3_t origin, visBrushType_t type, vec4_t color);
static qboolean intersect_planes(cplane_t *p1, cplane_t *p2, cplane_t *p3, vec3_t p);
static qboolean point_in_brush(vec3_t point, cbrush_t *brush);
static int winding_cmp(const void *a, const void *b);
static void add_vert_to_face(visFace_t *face, vec3_t vert, vec4_t color, vec2_t tex_coords);
static float *get_uv_coords(vec2_t uv, vec3_t vert, vec3_t normal);
static void free_vis_brushes(visBrushNode_t *brushes);
static void draw(visBrushNode_t *brush, visBrushNode_t **sortList, int count, qhandle_t shader, visBrushType_t type);


static visBrushNode_t *trigger_head = NULL;
static visBrushNode_t *clip_head = NULL;
static visBrushNode_t *clip_solidity_head = NULL;
static visBrushNode_t *slick_head = NULL;

static int				trigger_count = 0;
static int				clip_count = 0;
static int				slick_count = 0;

static visBrushNode_t** trigger_sortlist;
static visBrushNode_t** clip_sortlist;
static visBrushNode_t** slick_sortlist;

/* needed for winding_cmp */
static vec3_t w_center, w_normal, w_ref_vec;
static float w_ref_vec_len;

cvar_t *triggers_draw;
cvar_t *clips_draw;
cvar_t *slicks_draw;

static cvar_t *draw_maxfaces;

extern cvar_t *r_nocull;
extern cvar_t *r_solidity;
extern cvar_t *r_solidityTexture;

static cvar_t *trigger_shader_setting;
static cvar_t *clip_shader_setting;
static cvar_t *slick_shader_setting;

static qhandle_t trigger_shader;
static qhandle_t clip_shader;
static qhandle_t slick_shader;
static qhandle_t clip_shader_solidity;

static vec4_t trigger_color = { 0, 128, 0, 255 };
static vec4_t clip_color = { 128, 0, 0, 255 };
static vec4_t clip_solidity_color = { 255, 255, 255, 255 };
static vec4_t slick_color = { 0, 64, 128, 255 };

static const cplane_t *frustum;

static void init_sortlist(visBrushNode_t* head, visBrushNode_t** sortlist) {
	visBrushNode_t* node = head;
	int index = 0;
	while (node) {
		sortlist[index] = node;
		index++;
		node = node->next;
	}
}

void tc_vis_init(void) {
	free_vis_brushes(trigger_head); trigger_count = 0; if (trigger_sortlist) { delete[] trigger_sortlist; }
	free_vis_brushes(clip_head); clip_count = 0; if (clip_sortlist) { delete[] clip_sortlist; }
	free_vis_brushes(slick_head); slick_count = 0; if (slick_sortlist) { delete[] slick_sortlist; }
	trigger_head = NULL;
	clip_head = NULL;
	slick_head = NULL; 
	trigger_sortlist = NULL;
	clip_sortlist = NULL;
	slick_sortlist = NULL;

	triggers_draw = Cvar_Get("r_renderTriggerBrushes", "0", CVAR_ARCHIVE);
	clips_draw = Cvar_Get("r_renderClipBrushes", "0", CVAR_ARCHIVE);
	slicks_draw = Cvar_Get("r_renderSlickSurfaces", "0", CVAR_ARCHIVE);
	draw_maxfaces = Cvar_Get("r_renderBrushesMaxFacesPerType", "100", CVAR_ARCHIVE);

	trigger_shader_setting = Cvar_Get("r_renderTriggerBrushesShader", "tcRenderShader", CVAR_LATCH | CVAR_ARCHIVE);
	clip_shader_setting = Cvar_Get("r_renderClipBrushesShader", "tcRenderShader", CVAR_LATCH | CVAR_ARCHIVE);
	slick_shader_setting = Cvar_Get("r_renderSlickSurfacesShader", "tcRenderShader", CVAR_LATCH | CVAR_ARCHIVE);

	trigger_shader = re.RegisterShader(trigger_shader_setting->string);
	clip_shader = re.RegisterShader(clip_shader_setting->string);
	clip_shader_solidity = re.ext.RegisterShader3D(r_solidityTexture->string);
	slick_shader = re.RegisterShader(slick_shader_setting->string);
	if (trigger_shader == 0) {
		trigger_shader = re.RegisterShader("white");
	}
	if (clip_shader == 0) {
		clip_shader = re.RegisterShader("white");
	}
	if (slick_shader == 0) {
		slick_shader = re.RegisterShader("white");
	}

	add_triggers();
	add_clips();
	add_slicks();

	if (trigger_count > 0) {
		trigger_sortlist = new visBrushNode_t*[trigger_count];
		init_sortlist(trigger_head, trigger_sortlist);
	}
	if (clip_count > 0) {
		clip_sortlist = new visBrushNode_t*[clip_count];
		init_sortlist(clip_head, clip_sortlist);
	}
	if (slick_count > 0) {
		slick_sortlist = new visBrushNode_t*[slick_count];
		init_sortlist(slick_head, slick_sortlist);
	}
}

/*
static vec3_t g_pvsLocation;
static int g_pvsArea;
static byte* g_pvsMask;
static void SetPVSLocation(const vec3_t p)
{
	int leafnum, cluster;

	VectorCopy(p, g_pvsLocation);
	leafnum = CM_PointLeafnum(p);
	cluster = CM_LeafCluster(leafnum);
	g_pvsArea = CM_LeafArea(leafnum);
	g_pvsMask = CM_ClusterPVS(cluster);
}

static qboolean InPVS(const vec3_t p)
{
	int leafnum = CM_PointLeafnum(p);
	int cluster = CM_LeafCluster(leafnum);
	int area = CM_LeafArea(leafnum);

	if (g_pvsMask && (!(g_pvsMask[cluster >> 3] & (1 << (cluster & 7)))))
		return qfalse;
	if (!CM_AreasConnected(g_pvsArea, area))
		return qfalse;
	return qtrue;
} */

void tc_vis_render(void) {
	//SetPVSLocation(re->ext.GetViewPosition());
	if (triggers_draw->integer) {
		draw(trigger_head, trigger_sortlist, trigger_count, trigger_shader, TRIGGER_BRUSH);
	}
	if (r_solidity->integer > 1) {
		draw(clip_solidity_head,clip_sortlist, clip_count, clip_shader_solidity, CLIP_SOLIDITY_BRUSH);
	}
	else if (clips_draw->integer) {
		draw(clip_head, clip_sortlist, clip_count, clip_shader, CLIP_BRUSH);
	}
	if (slicks_draw->integer) {
		draw(slick_head, slick_sortlist, slick_count, slick_shader, SLICK_BRUSH);
	}
}

// ripped from breadsticks
static void add_triggers(void) {

	const char *entities = cm.entityString;
	for (;; ) {
		bool is_trigger = false;
		int model = -1;
		vec3_t origin;
		VectorCopy(vec3_origin, origin);

		char *token = COM_Parse(&entities);
		if (!entities)
			break;

		if (token[0] != '{')
			Com_Error(ERR_DROP, "mape is borked\n");

		for (;; ) {
			token = COM_Parse(&entities);

			if (token[0] == '}')
				break;

			if (!Q_stricmp(token, "model")) {
				token = COM_Parse(&entities);
				if (token[0] == '*')
					model = atoi(token + 1);
			}

			if (!Q_stricmp(token, "classname")) {
				token = COM_Parse(&entities);
				is_trigger = !!Q_stristr(token, "trigger");
			}

			if (!Q_stricmp(token, "origin")) {
				token = COM_Parse(&entities);
				sscanf(token, "%f %f %f", &origin[0], &origin[1], &origin[2]);
			}
		}

		

		if (is_trigger && model > 0) {
			cLeaf_t *leaf = &cm.cmodels[model].leaf;
			for (int i = 0; i < leaf->numLeafBrushes; i++) {
				gen_visible_brush(cm.leafbrushes[leaf->firstLeafBrush + i], origin, TRIGGER_BRUSH, trigger_color);
			}
		}
	}
}

static void add_clips(void) {
	for (int i = 0; i < cm.numBrushes; i++) {
		cbrush_t *brush = &cm.brushes[i];
		if (brush->contents & CONTENTS_PLAYERCLIP) {
			gen_visible_brush(i, vec3_origin, CLIP_BRUSH, clip_color);
			gen_visible_brush(i, vec3_origin, CLIP_SOLIDITY_BRUSH, clip_solidity_color);
		}
	}
}

static inline bool walkable(cplane_t const *plane) {
	return plane->normal[2] >= 0.7 /*MIN_WALK_NORMAL*/;
}

static void add_slicks(void) {
	for (int i = 0; i < cm.numBrushes; i++) {
		cbrush_t *brush = &cm.brushes[i];
		for (int s = 0; s < brush->numsides; s++) {
			cbrushside_t* side = &brush->sides[s];
			int surfaceFlags = cm.shaders[side->shaderNum].surfaceFlags;
			if (surfaceFlags & SURF_SLICK && walkable(side->plane)) {
				gen_visible_brush(i, vec3_origin, SLICK_BRUSH, slick_color);
				break;
			}
		}
	}
}

static void gen_visible_brush(int brushnum, const vec3_t origin, visBrushType_t type, vec4_t color) {
	cbrush_t *brush = &cm.brushes[brushnum];
	visBrushNode_t *node = (visBrushNode_t*)malloc(sizeof(visBrushNode_t));
	int	verts = 0;
	vec3_t center = { 0,0,0 };
	node->numFaces = brush->numsides;
	node->faces = (visFace_t*)malloc(node->numFaces * sizeof(visFace_t));
	for (int i = 0; i < node->numFaces; i++) {
		node->faces[i].numVerts = 0;
		node->faces[i].verts = (polyVert_t*)malloc(MAX_FACE_VERTS * sizeof(polyVert_t));
	}

	for (int i = 0; i < brush->numsides; i++) {
		cplane_t *p1 = brush->sides[i].plane;
		for (int j = i+1; j < brush->numsides; j++) {
			cplane_t *p2 = brush->sides[j].plane;
			for (int k = j+1; k < brush->numsides; k++) {
				cplane_t *p3 = brush->sides[k].plane;

				vec3_t p;
				if (!intersect_planes(p1, p2, p3, p))
					continue;

				if (!point_in_brush(p, brush))
					continue;

				// translate point to be relative to provided origin
				// looking at you FM
				VectorAdd(p, origin, p);

				// fix z-fighting by slightly moving vertices outwards
				vec3_t v1;
				vec3_t v2;
				vec3_t v3;
				VectorScale(p1->normal, .0625, v1);
				VectorScale(p2->normal, .0625, v2);
				VectorScale(p3->normal, .0625, v3);
				VectorAdd(p, v1, v1);
				VectorAdd(p, v2, v2);
				VectorAdd(p, v3, v3);

				VectorAdd(center,v1,center);
				verts++;
				VectorAdd(center,v2,center);
				verts++;
				VectorAdd(center,v3,center);
				verts++;

				vec2_t uv;
				if (type != SLICK_BRUSH || walkable(p1))
					add_vert_to_face(&node->faces[i], v1, color, get_uv_coords(uv, p, p1->normal));
				if (type != SLICK_BRUSH || walkable(p2))
					add_vert_to_face(&node->faces[j], v2, color, get_uv_coords(uv, p, p2->normal));
				if (type != SLICK_BRUSH || walkable(p3))
					add_vert_to_face(&node->faces[k], v3, color, get_uv_coords(uv, p, p3->normal));
			}
		}
	}

	// winding
	for (int i = 0; i < brush->numsides; i++) {
		visFace_t *face = &node->faces[i];
		VectorCopy(brush->sides[i].plane->normal, w_normal);
		VectorClear(w_center);
		ClearBounds(face->mins, face->maxs);
		for (int j = 0; j < face->numVerts; j++) {
			VectorAdd(w_center, face->verts[j].xyz, w_center);
			AddPointToBounds(face->verts[j].xyz, face->mins, face->maxs);
		}
		VectorScale(w_center, 1.0f / face->numVerts, w_center);
		VectorSubtract(face->verts[0].xyz, w_center, w_ref_vec);
		w_ref_vec_len = VectorLength(w_ref_vec);
		qsort(face->verts, face->numVerts, sizeof(face->verts[0]), winding_cmp);
	}

	if (verts > 0) {
		VectorScale(center, 1.0f / (float)verts, center);
		VectorCopy(center,node->center);
	}

	visBrushNode_t **head = NULL;
	switch (type)
	{
	case TRIGGER_BRUSH:
		head = &trigger_head;
		trigger_count++;
		break;
	case CLIP_BRUSH:
		head = &clip_head;
		clip_count++;
		break;
	case CLIP_SOLIDITY_BRUSH:
		head = &clip_solidity_head;
		break;
	case SLICK_BRUSH:
		head = &slick_head;
		slick_count++;
		break;
	};

	//
	
	assert(head);
	node->next = *head;
	*head = node;
}

static qboolean intersect_planes(cplane_t *p1, cplane_t *p2, cplane_t *p3, vec3_t p) {
	// thanks Real-Time Collision Detection
	vec3_t u, v;
	CrossProduct(p2->normal, p3->normal, u);
	float denom = DotProduct(p1->normal, u);
	// brushes with non-AA planes + AA bevel planes create invalid intersections
	// EPSILON 1e-5 too small => 1e-3
	if (fabs(denom) < 1e-3)
		return qfalse;

	for (int i = 0; i < 3; i++)
		p[i] = p3->dist * p2->normal[i] - p2->dist * p3->normal[i];

	CrossProduct(p1->normal, p, v);
	VectorMA(v, p1->dist, u, p);
	VectorScale(p, 1.0f / denom, p);
	return qtrue;
}

static qboolean point_in_brush(vec3_t point, cbrush_t *brush) {
	for (int i = 0; i < brush->numsides; i++) {
		float d = DotProduct(point, brush->sides[i].plane->normal);
		// brushes with non-AA planes + AA bevel planes create too much intersections
		// EPSILON 1e-1 too big => 1e-3
		if (d - brush->sides[i].plane->dist > 1e-3)
			return qfalse;
	}
	return qtrue;
}

// This function was initially supposed to obtain the ccw angle from w_ref_vec
// for ac and bc and compare them. However, we don't really need the exact angle.
// We just need to know which point lies further ccw relative to the ref.
// So a linear substitute is instead used to preserve the monotone decrease of acos.
static int winding_cmp(const void *a, const void *b) {
	vec3_t ac, bc, n1, n2;

	VectorSubtract(((polyVert_t *)a)->xyz, w_center, ac);
	VectorSubtract(((polyVert_t *)b)->xyz, w_center, bc);

	float proj_ac = DotProduct(ac, w_ref_vec) / VectorLength(ac);
	float proj_bc = DotProduct(bc, w_ref_vec) / VectorLength(bc);

	float a_diff = w_ref_vec_len - proj_ac;
	float b_diff  = w_ref_vec_len - proj_bc;

	// todo: get rid of cross products
	CrossProduct(ac, w_ref_vec, n1);
	CrossProduct(bc, w_ref_vec, n2);

	if (DotProduct(n1, w_normal) < 0)
		a_diff = 4.f * w_ref_vec_len - a_diff;
	if (DotProduct(n2, w_normal) < 0)
		b_diff = 4.f * w_ref_vec_len - b_diff;

	if (a_diff < b_diff)
		return -1;
	if (a_diff > b_diff)
		return 1;

	return 0;
}

static void add_vert_to_face(visFace_t *face, vec3_t vert, vec4_t color, vec2_t tex_coords) {
	if (face->numVerts >= MAX_FACE_VERTS)
		return;

	VectorCopy(vert, face->verts[face->numVerts].xyz);
	face->verts[face->numVerts].modulate[0] = color[0];
	face->verts[face->numVerts].modulate[1] = color[1];
	face->verts[face->numVerts].modulate[2] = color[2];
	face->verts[face->numVerts].modulate[3] = color[3];
	face->verts[face->numVerts].st[0] = tex_coords[0];
	face->verts[face->numVerts].st[1] = tex_coords[1];
	face->numVerts++;
}

static float *get_uv_coords(vec2_t uv, vec3_t vert, vec3_t normal) {
	float x = fabsf(normal[0]), y = fabsf(normal[1]), z = fabsf(normal[2]);
	if (x >= y && x >= z) {
		uv[0] = -vert[1] / 32.f;
		uv[1] = -vert[2] / 32.f;
	}
	else if (y > x && y >= z) {
		uv[0] = -vert[0] / 32.f;
		uv[1] = -vert[2] / 32.f;
	}
	else {
		uv[0] = -vert[0] / 32.f;
		uv[1] = -vert[1] / 32.f;
	}

	return uv;
}

static void free_vis_brushes(visBrushNode_t *brushes) {
	while (brushes != NULL)
	{
		visBrushNode_t *next = brushes->next;
		for (int i = 0; i < brushes->numFaces; i++)
			free(brushes->faces[i].verts);
		free(brushes->faces);
		free(brushes);
		brushes = next;
	}
}

struct
{
	bool operator()(visBrushNode_t* a, visBrushNode_t* b) const { return a->distance < b->distance; }
}
compareBrushDistance;

static void draw(visBrushNode_t *brush, visBrushNode_t** sortList, int count, qhandle_t shader, visBrushType_t type) {
	//frustum = re.ext.GetFrustum();
	//vec3_t viewPos;
	//VectorCopy(re.ext.GetViewPosition(), viewPos);
	const orientation_t* ori = re.ext.GetViewOrientation();
	qboolean behind;
	vec3_t vecToVert;
	qboolean cull = (qboolean)!(r_nocull && r_nocull->integer);
	int i;
	int countDrawn = 0;

	// todo view axis culling
	if (!count || !sortList) return;

	while (brush) {
		//brush->distance = DistanceSquared(ori->origin, brush->faces[0].verts[0].xyz);
		brush->distance = DistanceSquared(ori->origin, brush->center);
		if (fpclassify(brush->distance) == FP_NAN) {
			brush->distance = std::numeric_limits<float>::infinity(); // make sure sorting doesn't break in case anything truly strange happens.
		}
		brush = brush->next;
	}
	std::sort(sortList,sortList+count, compareBrushDistance);

	for (i = 0; i < count && countDrawn < draw_maxfaces->integer; i++) {
		brush = sortList[i];
		//don't do pvs optimization just check distance as well this gives better performance and results since pvs is expensive and oftentimes the edges are within structural brushes making it not reliable
		//if (!cull || DistanceSquared(ori->origin, brush->faces[0].verts[0].xyz) < 8192 * 8192)
		{
			for (int i = 0; i < brush->numFaces; ++i) {
				behind = cull ? qtrue : qfalse;

				// check if any points are in front of us
				for (int j = 0; j < brush->faces[i].numVerts && behind; j++)
				{
					VectorSubtract(brush->faces[i].verts[j].xyz, ori->origin, vecToVert);
					if (DotProduct(vecToVert, ori->axis[0]) >= 0.0f) {
						behind = qfalse;
						break;
					}
				}

				if (behind) {
					continue;
				}
				
				// TODO shade by angle with r_solidity 3 (like in tr_world.cpp)
				if (type == SLICK_BRUSH) { // walk slightly along normal to make more visible
					static polyVert_t extruded[800];
					memcpy(extruded, brush->faces[i].verts, MIN(sizeof(polyVert_t) * 800, sizeof(polyVert_t) * brush->faces[i].numVerts));
					for (int j = 0; j < brush->faces[i].numVerts && j < 800; j++)
					{
						extruded[j].xyz[2] += 3.0f;
					}
					re.AddPolyToScene(shader, brush->faces[i].numVerts, extruded, 1);
				}
				else {
					re.AddPolyToScene(shader, brush->faces[i].numVerts, brush->faces[i].verts, 1);
				}
				countDrawn++;
			}
		}
		brush = brush->next;
	}
}

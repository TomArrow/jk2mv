
#include "cm_local.h"

#include <map>
#include <algorithm>
#include <float.h>

#define SIGN(a) ((a > 0) - (a < 0))

typedef enum shadertype_s {
	SHADERTYPE_NORMAL,
	SHADERTYPE_SYSTEM,
	SHADERTYPE_SKY,
} shadertype_t;

typedef struct minimapData_s {
	int			checksum;

	int			numShaders;
	CCMShader*	shaders;
	shadertype_t* shaderTypes;
} minimapData_t;

qboolean mmLoaded = qfalse;

byte* minimap_base;

minimapData_t	mm; 
void* minimapBspCache = NULL;

#define	MAX_FACE_POINTS		64

typedef enum {
	SF_BAD,
	SF_SKIP,				// ignore
	SF_FACE,
	SF_GRID,
	SF_TRIANGLES,
	SF_POLY,
	SF_MD3,
	SF_MD4,
	/*
	Ghoul2 Insert Start
	*/

	SF_MDX,
	/*
	Ghoul2 Insert End
	*/
	SF_FLARE,
	SF_ENTITY,				// beams, rails, lightning, etc that can be determined by entity
	SF_DISPLAY_LIST,

	SF_NUM_SURFACE_TYPES,
	SF_MAX = 0xffffffff			// ensures that sizeof( surfaceType_t ) == sizeof( int )
} surfaceType_t;
typedef struct msurface_s {
	int					viewCount;		// if == tr.viewCount, already added
	struct shader_s* shader;
	int					fogIndex;
	int					contents;		// so we can determine whether to draw a particular surface based on content flags
	int					flags;		// surfaceflags (might come in handy?)
	qboolean			trisoupMapSurf;

	surfaceType_t* data;			// any of srf*_t
} msurface_t;


typedef struct vertXYZ_s {
	vec3_t	xyz;
	vec2_t	lightmapSt;
	uint16_t	lightmapNum;
} vertXYZ_t;
typedef struct triangle_s {
	vertXYZ_t	xyz[3];
	vec3_t		normal;
	int			shadernum;
} triangle_t;
#define	LIGHTMAP_SIZE	128
typedef struct lightmap_s {
	byte	data[LIGHTMAP_SIZE * LIGHTMAP_SIZE * 3];
} lightmap_t;


std::vector<int> indices;
std::vector<int> surfaceViewCount;
std::map<int, std::vector<int>> surfaceIndices; // same as indices but suvdivided by surfacenum.
std::vector<triangle_t> faceTriangles;
std::vector<vertXYZ_t> faceVerts;
std::vector<lightmap_t> lightmaps;
std::vector<int> visFilteredIndices;

/*
=================
CMod_LoadShaders
=================
*/
void MiniMap_LoadShaders(lump_t* l)
{
	dshader_t* in;
	int			i, count;
	CCMShader* out;
	shadertype_t* outType;

	in = (dshader_t*)(minimap_base + l->fileofs);
	if (l->filelen % sizeof(*in)) {
		Com_Error(ERR_DROP, "CMod_LoadShaders: funny lump size");
	}
	count = l->filelen / sizeof(*in);

	if (count < 1) {
		Com_Error(ERR_DROP, "Map with no shaders");
	}
	mm.shaders = (CCMShader*)malloc(count * sizeof(*mm.shaders));
	mm.shaderTypes = (shadertype_t*)malloc(count * sizeof(*mm.shaderTypes));
	mm.numShaders = count;

	out = mm.shaders;
	outType = mm.shaderTypes;
	for (i = 0; i < count; i++, in++, out++, outType++)
	{
		Q_strncpyz(out->shader, in->shader, MAX_QPATH);
		out->contentFlags = LittleLong(in->contentFlags);
		out->surfaceFlags = LittleLong(in->surfaceFlags);
		if (!Q_stricmpn(out->shader, "textures/system/", 17)) {
			*outType = SHADERTYPE_SYSTEM;
		} else if (!Q_stricmpn(out->shader, "textures/skies/", 16)) {
			*outType = SHADERTYPE_SYSTEM;
		}
		else {
			*outType = SHADERTYPE_NORMAL;
		}
	}
}


void MiniMap_LoadLightmaps(lump_t* l) {
	const byte* buf, * buf_p;
	int			len;
	byte		image[LIGHTMAP_SIZE * LIGHTMAP_SIZE * 3];
	int			i, j;
	float maxIntensity = 0;
	double sumIntensity = 0;

	len = l->filelen;
	if (!len) {
		return;
	}
	buf = minimap_base + l->fileofs;

	// create all the lightmaps
	int numLightmaps = len / (LIGHTMAP_SIZE * LIGHTMAP_SIZE * 3);


	for (i = 0; i < numLightmaps; i++) {
		buf_p = buf + i * LIGHTMAP_SIZE * LIGHTMAP_SIZE * 3;
		lightmap_t lm;
		memcpy(lm.data, buf_p, sizeof(lm.data));
		lightmaps.push_back(lm);
	}

}

void ParseFace(dsurface_t* ds, mapVert_t* verts, int* indexes, int surfaceNum) {
	int					i, j, k;
	//srfSurfaceFace_t* cv;
	int					numPoints, numIndexes;
	int					lightmapNum[MAXLIGHTMAPS];
	int					atlasLightmapNum[MAXLIGHTMAPS]; // lightmap index inside of the atlas
	//size_t				sfaceSize;
	//int				 ofsIndexes;

	for (i = 0; i < MAXLIGHTMAPS; i++)
	{
		lightmapNum[i] = LittleLong(ds->lightmapNum[i]);
	}

	// get fog volume
	//surf->fogIndex = LittleLong(ds->fogNum) + 1;

	// get shader value
	//surf->shader = ShaderForShaderNum(ds->shaderNum, lightmapNum, ds->lightmapStyles, ds->vertexStyles);
	//if (r_singleShader->integer && !surf->shader->isSky) {
	//	surf->shader = tr.defaultShader;
	//}

	//SetFlagsForShaderForSurface(surf, ds->shaderNum);

	numPoints = LittleLong(ds->numVerts);
	if (numPoints > MAX_FACE_POINTS) {
		//ri.Printf(PRINT_WARNING, "WARNING: MAX_FACE_POINTS exceeded: %i\n", numPoints);
		numPoints = MAX_FACE_POINTS;
		//surf->shader = tr.defaultShader;
	}

	numIndexes = LittleLong(ds->numIndexes);

	// create the srfSurfaceFace_t
	//sfaceSize = (size_t) & ((srfSurfaceFace_t*)0)->points[numPoints];
	//ofsIndexes = (int)sfaceSize;
	//sfaceSize += sizeof(int) * numIndexes;

	//cv = (srfSurfaceFace_t*)ri.Hunk_Alloc((int)sfaceSize, h_low);
	//cv->surfaceType = SF_FACE;
	//cv->numPoints = numPoints;
	//cv->numIndices = numIndexes;
	//cv->ofsIndices = ofsIndexes;
	//cv->flags = surf->flags;
	//cv->contents = surf->contents;


	int surfaceCount = ds->numIndexes;
	if (ds->surfaceType != 2 && (surfaceCount % 3) > 0)
	{
		return;
	}


	verts += LittleLong(ds->firstVert);
	for (i = 0; i < numPoints; i++) {
		for (j = 0; j < 3; j++) {
			//cv->points[i][j] = LittleFloat(verts[i].xyz[j]);
		}
		for (j = 0; j < 2; j++) {
			//cv->points[i][3 + j] = LittleFloat(verts[i].st[j]);
			//for (k = 0; k < MAXLIGHTMAPS; k++)
			//{
				//cv->points[i][VERTEX_LM + j + (k * 2)] = LittleFloat(verts[i].lightmap[k][j]);
			//}
		}
		for (k = 0; k < MAXLIGHTMAPS; k++)
		{
			//if (tr.lightmapAtlasActive) {
			//	R_AtlasPackUV(verts[i].lightmap[k], atlasLightmapNum[k], &cv->points[i][VERTEX_LM + (k * 2)]);
			//}
			//R_ColorShiftLightingBytes(verts[i].color[k], (byte*)&cv->points[i][VERTEX_COLOR + k]);
		}
	}

	indexes += LittleLong(ds->firstIndex);
	for (i = 0; i < numIndexes; i++) {
		//((int*)((byte*)cv + cv->ofsIndices))[i] = LittleLong(indexes[i]);

	}
	int triindexes[3];
	for (i = 0; i < numIndexes; i += 3) {
		//((int*)((byte*)cv + cv->ofsIndices))[i] = LittleLong(indexes[i]);
		triindexes[0] = LittleLong(indexes[i]);
		triindexes[1] = LittleLong(indexes[i + 1]);
		triindexes[2] = LittleLong(indexes[i + 2]);
		//vertXYZ_t tri[3];
		triangle_t tri;
		for (j = 0; j < 3; j++) {
			//cv->points[i][j] = LittleFloat(verts[i].xyz[j]);
			tri.xyz[0].xyz[j] = LittleFloat(verts[triindexes[0]].xyz[j]);
			tri.xyz[1].xyz[j] = LittleFloat(verts[triindexes[1]].xyz[j]);
			tri.xyz[2].xyz[j] = LittleFloat(verts[triindexes[2]].xyz[j]);
		}
		for (j = 0; j < 2; j++) {
			//cv->points[i][j] = LittleFloat(verts[i].xyz[j]);
			tri.xyz[0].lightmapSt[j] = LittleFloat(verts[triindexes[0]].lightmap[0][j]);
			tri.xyz[1].lightmapSt[j] = LittleFloat(verts[triindexes[1]].lightmap[0][j]);
			tri.xyz[2].lightmapSt[j] = LittleFloat(verts[triindexes[2]].lightmap[0][j]);
		}
		tri.xyz[0].lightmapNum = lightmapNum[0];
		tri.xyz[1].lightmapNum = lightmapNum[0];
		tri.xyz[2].lightmapNum = lightmapNum[0];
		// take the plane information from the lightmap vector
		for (j = 0; j < 3; j++) {
			tri.normal[j] = LittleFloat(ds->lightmapVecs[2][j]);
		}
		tri.shadernum = LittleLong(ds->shaderNum);
		faceTriangles.push_back(tri);
		//std::vector<int>* surfaceIndexVector = &surfaceIndices[surfaceNum];
		//indices.push_back((int)faceVerts.size());
		//surfaceIndexVector->push_back((int)faceVerts.size());
		//faceVerts.push_back(tri.xyz[0]);
		//indices.push_back((int)faceVerts.size());
		//surfaceIndexVector->push_back((int)faceVerts.size());
		//faceVerts.push_back(tri.xyz[1]);
		//indices.push_back((int)faceVerts.size());
		//surfaceIndexVector->push_back((int)faceVerts.size());
		//faceVerts.push_back(tri.xyz[2]);
	}

	for (i = 0; i < 3; i++) {
		//cv->plane.normal[i] = LittleFloat(ds->lightmapVecs[2][i]);
	}
	//cv->plane.dist = DotProduct(cv->points[0], cv->plane.normal);
	//SetPlaneSignbits(&cv->plane);
	//cv->plane.type = PlaneTypeForNormal(cv->plane.normal);

	//surf->data = (surfaceType_t*)cv;
}


/*
===============
MiniMap_LoadSurfaces
===============
*/
void MiniMap_LoadSurfaces(lump_t* surfs, lump_t* verts, lump_t* indexLump) {
	dsurface_t* in;
	msurface_t* out;
	mapVert_t* dv;
	int* indexes;
	int			count;
	int			numFaces, numMeshes, numTriSurfs, numFlares;
	int			i;

	numFaces = 0;
	numMeshes = 0;
	numTriSurfs = 0;
	numFlares = 0;

	in = (dsurface_t*)(minimap_base + surfs->fileofs);
	if (surfs->filelen % sizeof(*in))
		return;
	//ri.Error(ERR_DROP, "LoadMap: funny lump size in %s", s_worldData.name);
	count = surfs->filelen / sizeof(*in);

	dv = (mapVert_t*)(minimap_base + verts->fileofs);
	if (verts->filelen % sizeof(*dv))
		return;
	// ri.Error(ERR_DROP, "LoadMap: funny lump size in %s", s_worldData.name);

	indexes = (int*)(minimap_base + indexLump->fileofs);
	if (indexLump->filelen % sizeof(*indexes))
		return;
	//ri.Error(ERR_DROP, "LoadMap: funny lump size in %s", s_worldData.name);

	surfaceViewCount.resize(count, -1);

	//out = (struct msurface_s*)ri.Hunk_Alloc(count * sizeof(*out), h_low);

	//s_worldData.surfaces = out;
	//s_worldData.numsurfaces = count;

	for (i = 0; i < count; i++, in++) {
		switch (LittleLong(in->surfaceType)) {
		case MST_PATCH:
			//ParseMesh(in, dv, out);
			numMeshes++;
			break;
		case MST_TRIANGLE_SOUP:
			//ParseTriSurf(in, dv, out, indexes);
			numTriSurfs++;
			break;
		case MST_PLANAR:
			ParseFace(in, dv, indexes, i);
			numFaces++;
			break;
		case MST_FLARE:
			//ParseFlare(in, dv, out, indexes);
			numFlares++;
			break;
		default:
			return;
			//ri.Error(ERR_DROP, "Bad surfaceType");
		}
	}

#ifdef PATCH_STITCHING
	//R_StitchAllPatches();
#endif

	//R_FixSharedVertexLodError();

#ifdef PATCH_STITCHING
	//R_MovePatchSurfacesToHunk();
#endif

	//ri.Printf(PRINT_DEVELOPER, "...loaded %d faces, %i meshes, %i trisurfs, %i flares\n",
	//	numFaces, numMeshes, numTriSurfs, numFlares);
}




void MiniMap_ClearMap(void)
{

	faceTriangles.clear();
	lightmaps.clear();
	faceVerts.clear();
	indices.clear();
	surfaceViewCount.clear();
	visFilteredIndices.clear();
	surfaceIndices.clear();
	if (mmLoaded) {
		if (mm.shaders) {
			free(mm.shaders);
		}
		if (mm.shaderTypes) {
			free(mm.shaderTypes);
		}
	}
	Com_Memset(&mm, 0, sizeof(mm));
	if(minimapBspCache)
	{
		free(minimapBspCache);
		minimapBspCache = NULL;
	}
	mmLoaded = qfalse;
}

qboolean MiniMap_Load(const char* name) {
	int* buf;
	dheader_t		header;
	static unsigned	last_checksum;

	if (!name || !name[0]) {
		return qfalse;
	}

	Com_DPrintf("MiniMap_Load( %s )\n", name);

	// free old stuff
	MiniMap_ClearMap();

	if (!name[0]) {
		return qfalse;
	}

	//
	// load the file
	//

	//
	// load the file into a buffer that we either discard as usual at the bottom, or if we've got enough memory
	//	then keep it long enough to save the renderer re-loading it (if not dedicated server),
	//	then discard it after that...
	//
	buf = NULL;
	fileHandle_t h;
	const int iBSPLen = FS_FOpenFileRead(name, &h, qfalse);
	if (h)
	{
		minimapBspCache = malloc(iBSPLen);
		FS_Read(minimapBspCache, iBSPLen, h);

		int pakChecksum = FS_WhichPack_f(h);
		Cvar_Set("cm_checksumPak", va("%d", pakChecksum));

		FS_FCloseFile(h);

		buf = (int*)minimapBspCache;	// so the rest of the code works as normal

		// carry on as before...
		//
	}

	if (!buf) {
		return qfalse;
	}

	last_checksum = LittleLong(Com_BlockChecksum(buf, iBSPLen));
	mm.checksum = last_checksum;


	header = *(dheader_t*)buf;
	for (size_t i = 0; i < sizeof(dheader_t) / 4; i++) {
		((int*)&header)[i] = LittleLong(((int*)&header)[i]);
	}

	if (header.version != BSP_VERSION) {
		free(minimapBspCache);
		minimapBspCache = NULL;

		Com_Error(ERR_DROP, "CM_LoadMap: %s has wrong version number (%i should be %i)"
			, name, header.version, BSP_VERSION);
	}

	minimap_base = (byte*)buf;

	// load into heap
	MiniMap_LoadShaders(&header.lumps[LUMP_SHADERS]); 
	MiniMap_LoadLightmaps(&header.lumps[LUMP_LIGHTMAPS]);
	MiniMap_LoadSurfaces(&header.lumps[LUMP_SURFACES], &header.lumps[LUMP_DRAWVERTS], &header.lumps[LUMP_DRAWINDEXES]);

	mmLoaded = qtrue;
	return qtrue;

}

void MiniMap_Draw(int imageWidth, int imageHeight) {


	// figure out total map dimensions
	float minX = FLT_MAX, maxX = -FLT_MAX;
	float minY = FLT_MAX, maxY = -FLT_MAX;
	float minZ = FLT_MAX, maxZ = -FLT_MAX;
	for (int i = 0; i < faceTriangles.size(); i++) {
		if (mm.shaderTypes[faceTriangles[i].shadernum] != SHADERTYPE_NORMAL || faceTriangles[i].normal[2] > 0.99f) {
			continue;
		}
		for (int j = 0; j < 3;j++) {
			vertXYZ_t* vert = &faceTriangles[i].xyz[j];
			minX = MIN(-vert->xyz[0], minX);
			maxX = MAX(-vert->xyz[0], maxX);
			minY = MIN(vert->xyz[1], minY);
			maxY = MAX(vert->xyz[1], maxY);
			minZ = MIN(vert->xyz[2], minZ);
			maxZ = MAX(vert->xyz[2], maxZ);
		}
	}


	float xRange = maxX - minX, yRange = maxY - minY;
	float x, y, x2, y2;
	int imageX = 0, imageY = 0, imageXEnd = 0, imageYEnd = 0;
	int xFrom, xTo, yFrom, yTo, pixY, yStep, yPixRange, xPixRange, yState, yStart;
	float XYRatio = 1.0f, XYRatioHere;


	vec3_t color;
	// we'll be drawing the normals onto the "image"
	qboolean rotated = qfalse;
	if ((xRange > yRange) != (imageWidth > imageHeight)) {
		int tmp = imageWidth;
		imageWidth = imageHeight;
		imageHeight = tmp;
		rotated = qtrue;
	}
	int stride = imageWidth * 3;
	int dataSize = stride * sizeof(float) * imageHeight;
	float* imgData = (float*)calloc(1, dataSize);

	if (!imgData) {
		return;
	}

	for (int i = 0; i < faceTriangles.size(); i++) {
		if (mm.shaderTypes[faceTriangles[i].shadernum] != SHADERTYPE_NORMAL || faceTriangles[i].normal[2] > 0.99f) {
			continue;
		}
		for (int j = 0; j < 3; j++) {
			vertXYZ_t* vert1 = &faceTriangles[i].xyz[j];
			vertXYZ_t* vert2 = &faceTriangles[i].xyz[(j+1)%3];
			x = -vert1->xyz[0];
			y = vert1->xyz[1];
			x2 = -vert2->xyz[0];
			y2 = vert2->xyz[1];

			imageX = std::clamp((int)((x - minX) / xRange * (float)(imageWidth - 1.0f)), 0, imageWidth - 1);
			imageY = std::clamp((int)((y - minY) / yRange * (float)(imageHeight - 1.0f)), 0, imageHeight - 1);
			imageXEnd = std::clamp((int)((x2 - minX) / xRange * (float)(imageWidth - 1.0f)), 0, imageWidth - 1);
			imageYEnd = std::clamp((int)((y2 - minY) / yRange * (float)(imageHeight - 1.0f)), 0, imageHeight - 1);

			VectorCopy(faceTriangles[i].normal, color);

#define ADDFUNC(oldval,newval) (newval)

			xFrom = MIN(imageX, imageXEnd);
			xTo = MAX(imageX, imageXEnd);
			yFrom = MIN(imageY, imageYEnd);
			yTo = MAX(imageY, imageYEnd);
			xPixRange = xTo - xFrom;
			yPixRange = yTo - yFrom;
			yState = 0;
			pixY = yFrom;
			XYRatio = xTo == xFrom ? 1.0f : std::abs((float)yPixRange / (float)xPixRange); // the ?: is just to avoid division by zero
			yStep = SIGN(imageXEnd - imageX) * SIGN(imageYEnd - imageY);
			yStep = yStep == 0 ? 1 : yStep;
			yStart = yStep < 0 ? yTo : yFrom;
			for (int pixX = xFrom; pixX <= xTo; pixX++)
			{
				if (pixX == xTo)
				{
					while (yState <= yPixRange)
					{
						pixY = yStart + yStep * yState;
						imgData[pixY * stride + pixX * 3] += ADDFUNC(imgData[pixY * stride + pixX * 3], color[0]);
						imgData[pixY * stride + pixX * 3 + 1] += ADDFUNC(imgData[pixY * stride + pixX * 3 + 1], color[1]);
						imgData[pixY * stride + pixX * 3 + 2] += ADDFUNC(imgData[pixY * stride + pixX * 3 + 2], color[2]);
						yState++;
					}
				}
				else if (yState < yPixRange && pixX > xFrom)
				{
					while (((float)yState / (float)(pixX - xFrom)) < XYRatio && yState <= yPixRange)
					{
						pixY = yStart + yStep * yState;
						imgData[pixY * stride + pixX * 3] += ADDFUNC(imgData[pixY * stride + pixX * 3], color[0]);
						imgData[pixY * stride + pixX * 3 + 1] += ADDFUNC(imgData[pixY * stride + pixX * 3 + 1], color[1]);
						imgData[pixY * stride + pixX * 3 + 2] += ADDFUNC(imgData[pixY * stride + pixX * 3 + 2], color[2]);
						yState++;
					}
				}
				if (yState <= yPixRange)
				{
					pixY = yStart + yStep * yState;
					imgData[pixY * stride + pixX * 3] += ADDFUNC(imgData[pixY * stride + pixX * 3], color[0]);
					imgData[pixY * stride + pixX * 3 + 1] += ADDFUNC(imgData[pixY * stride + pixX * 3 + 1], color[1]);
					imgData[pixY * stride + pixX * 3 + 2] += ADDFUNC(imgData[pixY * stride + pixX * 3 + 2], color[2]);
				}
			}
		}
	}

	if (rotated) {
		// turn it back around;

		float* rotatedImgData = (float*)malloc(dataSize);

		if (rotatedImgData) { // if that doesnt allocate, the result will be awkward...
			int tmp = imageWidth;
			imageWidth = imageHeight;
			imageHeight = tmp;
			int strideOld = stride;
			stride = imageWidth * 3;

			memcpy(rotatedImgData, imgData, dataSize);
			for (int y = 0; y < imageHeight; y++) {
				for (int x = 0; x < imageWidth; x++) {
					float* valueHere = &imgData[y * stride + x * 3];
					float* valueRotated = &rotatedImgData[x * strideOld + (imageHeight-y-1) * 3];
					valueHere[0] = -valueRotated[1];
					valueHere[1] = valueRotated[0];
					valueHere[2] = valueRotated[2];
				}
			}
			free(rotatedImgData);
		}
	}

	int textStride = (imageWidth + 1);
	int textSize = textStride * imageHeight + 1;
	char* asText = (char*)malloc(textSize);
	if (!asText) {
		free(imgData);
		return;
	}
	asText[textSize - 1] = '\0';
	for (int y = 0; y < imageHeight; y++) {
		for (int x = 0; x < imageWidth; x++) {
			float* valueHere = &imgData[y * stride + x * 3];
			char* theText = &asText[y * textStride + x];
			vec2_t normalized = { -valueHere[0],valueHere[1] };
			float normalTotal = VectorLength(valueHere);
			float relevantTotal = Vector2Normalize(normalized);
			float xabs = std::abs(normalized[0]);
			if (!normalTotal || !relevantTotal) {
				*theText = ' ';
			}
			else if (xabs > 0.966f) {
				*theText = '|';
			} else if (xabs < 0.259f) {
				*theText = '-';
			}
			else if (normalized[0] < 0 == normalized[1] > 0) {
				*theText = '\\';
			}
			else {
				*theText = '/';
			}
		}
		asText[y * textStride + imageWidth] = '\n';
	}

	FS_WriteFile("debugdumps/minimap.raw",imgData, dataSize);
	Com_Printf("%s", asText);
	free(imgData);
	free(asText);

	return;
}

qboolean MiniMap_MakeMinimap(const char* name) {
	if (!MiniMap_Load(name)) {
		return qfalse;
	}
	MiniMap_Draw(90, 25);
	MiniMap_ClearMap();
	return qtrue;
}


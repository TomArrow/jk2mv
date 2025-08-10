models/map_objects/mp/flag3
{
	q3map_nolightmap
	q3map_onlyvertexlighting
	cull	disable
    {
        map models/map_objects/mp/flag3
        blendFunc GL_ONE GL_ZERO
        rgbGen lightingDiffuse
    }
}

sprites/team_yellow
{
	surfaceparm	metalsteps
	nopicmip
	nomipmaps
    {
        map gfx/2d/mp_yteam_symbol
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    }
}

gfx/misc/yellow_portashield
{
	surfaceparm	noimpact
	surfaceparm	trans
	nopicmip
	q3map_nolightmap
	cull	disable
    {
        map gfx/effects/mp_y_forcefield
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.65 0.35 0 0.2
        tcMod scroll -1 2
    }
    {
        map gfx/effects/mp_y_forcefield
        blendFunc GL_ONE GL_ONE
        tcMod scroll 2 1
    }
}

gfx/misc/yellow_dmgshield
{
	qer_editorimage	gfx/effects/mp_y_forcefield_d
	surfaceparm	noimpact
	surfaceparm	trans
	nopicmip
	q3map_nolightmap
	cull	disable
    {
        map gfx/effects/mp_y_forcefield_d
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.65 0.35 0 0.2
        tcMod scroll -1 2
    }
    {
        map gfx/effects/mp_y_forcefield_d1
        blendFunc GL_ONE GL_ONE
        tcMod scroll 2 1
    }
    {
        map gfx/misc/yellowstatic
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.5 0 1
        tcMod scale 2.5 2.5
        tcMod scroll 1729.3 737.7
    }
}

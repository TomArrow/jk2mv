
gfx/hud/hudleft_static
{
	nopicmip
    {
        map gfx/hud/static5
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1.5 1.4 1
        tcMod scroll 0 1
    }
    {
        map gfx/hud/static8
        blendFunc GL_ONE GL_ONE
        rgbGen vertex
    }
}

gfx/hud/hudrightframe_static
{
	nopicmip
    {
        map gfx/hud/static5
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1.5 1.4 1
        tcMod scroll 0 1
    }
    {
        map gfx/hud/static9
        blendFunc GL_ONE GL_ONE
        rgbGen vertex
    }
}

gfx/hud/hudleft_256
{
	nopicmip
    {
        map gfx/hud/hudleft_256
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
    }
}

gfx/hud/hudrightframe_256
{
	nopicmip
    {
        map gfx/hud/hudrightframe_256
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
    }
}

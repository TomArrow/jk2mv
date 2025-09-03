// unlagged's bbox shaders adapated
tcRenderShader
{
	polygonOffset
	entityMergable
	nopicmip
	{
		map gfx/misc/tcRenderShader.jpg
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}

tcRenderShader_nocull
{
	nopicmip
	entityMergable
	cull none
	{
		map gfx/misc/tcRenderShader.jpg
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}

tcRenderShaderWater
{
	polygonOffset
	nopicmip
	entityMergable
	{
		map $whiteimage
		blendFunc GL_ONE GL_ONE
		rgbGen const ( 0.1 0.1 0.05 )
	}
}

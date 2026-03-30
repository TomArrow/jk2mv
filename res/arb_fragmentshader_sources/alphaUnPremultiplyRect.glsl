#version 400 compatibility

uniform sampler2D text_in;

void main(void)
{
	vec4 rgba = texture2D(text_in, gl_TexCoord[0].st);
	if(rgba.w > 0){
		rgba.xyz /= rgba.w;
	}
	gl_FragColor = rgba; 
}
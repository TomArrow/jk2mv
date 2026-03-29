# Requires NVIDIA CG Toolkit for the cgc shader compiler
# To quickly convert to C string variant used in jk2mv, do regex replace in notepad++ or other tool: \r?\n -> " "\\n"\n\t", and remove # comments spam
# and in the TEX instruction, replace 2D with RECT
cgc -oglsl -strict -profile arbfp1 hdrPixelShaderRect.glsl > hdrPixelShaderRect_arb.txt
#cgc -oglsl -strict -profile arbvp1 someVertexShader.glsl > arb_vertexshader.txt
read -n1 -r
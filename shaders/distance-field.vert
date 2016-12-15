/* This shader differs from freetype-gl's original distance-field.vert
 * In that it uses the same uniform names as its text.vert shader.
 * It's intended for use with freetype-gl's distance-field.frag
 */
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

attribute vec3 vertex;
attribute vec2 tex_coord;
attribute vec4 color;

void main(void)
{
    gl_TexCoord[0].xy = tex_coord.xy;
    gl_FrontColor     = color;
    gl_Position       = projection*(view*(model*vec4(vertex,1.0)));
}
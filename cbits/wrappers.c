#include <text-buffer.h>
#include <mat4.h>

void wrapper__text_buffer_get_bounds(vec4 *out, text_buffer_t * self, vec2 * pen)
{
    *out = text_buffer_get_bounds(self, pen);
}

void wrapper__texture_atlas_get_region( ivec4 *out, texture_atlas_t * self,
                                        const size_t width,
                                        const size_t height )
{
    *out = texture_atlas_get_region(self, width, height);
}

/* Bind the uniforms of the provided text.{vert,frag} shader */
void wrapper__bind_text_shader_uniforms(
    GLuint shader,
    mat4 *model, mat4 *view, mat4 *projection)
{
    glUseProgram( shader );
    glUniformMatrix4fv( glGetUniformLocation( shader, "model" ),
                        1, 0, model->data);
    glUniformMatrix4fv( glGetUniformLocation( shader, "view" ),
                        1, 0, view->data);
    glUniformMatrix4fv( glGetUniformLocation( shader, "projection" ),
                        1, 0, projection->data);
}

/* Bind the uniforms of the provided distanceField.{vert,frag} shader */
void wrapper__bind_distance_field_shader_uniforms(
    GLuint shader, vec4 *color,
    mat4 *model, mat4 *view, mat4 *projection)
{
    glUseProgram( shader );
    glUniform4f( glGetUniformLocation( shader, "u_color" ),
                 color->r, color->g, color->b, color->a );
    glUniformMatrix4fv( glGetUniformLocation( shader, "u_model" ),
                        1, 0, model->data);
    glUniformMatrix4fv( glGetUniformLocation( shader, "u_view" ),
                        1, 0, view->data);
    glUniformMatrix4fv( glGetUniformLocation( shader, "u_projection" ),
                        1, 0, projection->data);
}

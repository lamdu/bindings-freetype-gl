#include <text-buffer.h>

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

-- | bindings to text-buffer.h

#include <bindings.dsl.h>
#include <text-buffer.h>

module Bindings.FreetypeGL.TextBuffer where

import Bindings.FreetypeGL.Markup
import Bindings.FreetypeGL.Vec234
import Bindings.FreetypeGL.Vector
import Bindings.FreetypeGL.VertexBuffer
import Foreign.C.String (CString)
import Foreign.C.Types (CChar, CSize(..), CFloat(..), CUInt(..))
import Foreign.Ptr (FunPtr, Ptr, plusPtr)
import Foreign.Storable (Storable(..))

#num LCD_FILTERING_ON
#num LCD_FILTERING_OFF

#integral_t GLuint

#starttype text_buffer_t
#field buffer        , Ptr <vertex_buffer_t>
#field base_color    , <vec4>
#field origin        , <vec2>
#field last_pen_y    , CFloat
#field bounds        , <vec4>
#field line_start    , CSize
#field line_left     , CFloat
#field lines         , Ptr <vector_t>
#field line_ascender , CFloat
#field line_descender, CFloat
#stoptype

#starttype glyph_vertex_t
#field x , CFloat
#field y , CFloat
#field z , CFloat
#field u , CFloat
#field v , CFloat
#field r , CFloat
#field g , CFloat
#field b , CFloat
#field a , CFloat
#field shift , CFloat
#field gamma , CFloat
#stoptype

#starttype line_info_t
#field line_start, CSize
#field bounds, <vec4>
#stoptype

#integral_t Align
#num ALIGN_LEFT
#num ALIGN_CENTER
#num ALIGN_RIGHT

#ccall text_buffer_new              , IO (Ptr <text_buffer_t>)
#ccall text_buffer_delete           , Ptr <text_buffer_t> -> IO ()
#ccall text_buffer_add_text         , Ptr <text_buffer_t> -> Ptr <vec2> -> Ptr <markup_t> -> CString -> CSize -> IO ()
#ccall text_buffer_add_char         , Ptr <text_buffer_t> -> Ptr <vec2> -> Ptr <markup_t> -> Ptr CChar -> Ptr CChar -> IO ()
#ccall text_buffer_align            , Ptr <text_buffer_t> -> Ptr <vec2> -> <Align> -> IO ()
#ccall text_buffer_clear            , Ptr <text_buffer_t> -> IO ()

#ccall wrapper__text_buffer_get_bounds , Ptr <vec4> -> Ptr <text_buffer_t> -> Ptr <vec2> -> IO ()

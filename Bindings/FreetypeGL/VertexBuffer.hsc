-- | bindings to text-buffer.h

#include <bindings.dsl.h>
#include <vertex-buffer.h>

module Bindings.FreetypeGL.VertexBuffer where

import Foreign.C.Types (CUInt(..))
import Foreign.Ptr (FunPtr, Ptr)

#integral_t GLenum
#opaque_t vertex_buffer_t

#ccall vertex_buffer_render     , Ptr <vertex_buffer_t> -> <GLenum> -> IO ()
#ccall vertex_buffer_print      , Ptr <vertex_buffer_t> -> IO ()
#ccall vertex_buffer_clear      , Ptr <vertex_buffer_t> -> IO ()

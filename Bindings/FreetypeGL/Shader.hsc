-- | bindings to shader.h

#include <bindings.dsl.h>
#include <shader.h>

module Bindings.FreetypeGL.Shader where

import Bindings.FreetypeGL.Vec234
import Bindings.FreetypeGL.Mat4
import Foreign.C.String (CString)
import Foreign.C.Types (CUInt(..))
import Foreign.Ptr (Ptr, FunPtr)

#integral_t GLuint

-- NOTE: This could be redundant to existing Haskell bindings, perhaps
-- remove if there's a canonical Haskell way to do it
#ccall shader_load, CString -> CString -> IO <GLuint>

#ccall wrapper__bind_text_shader_uniforms, <GLuint> -> Ptr <mat4> -> Ptr <mat4> -> Ptr <mat4> -> IO ()

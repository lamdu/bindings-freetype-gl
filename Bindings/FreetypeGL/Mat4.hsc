-- | bindings to mat4.h

#include <bindings.dsl.h>
#include <mat4.h>

module Bindings.FreetypeGL.Mat4 where

import Foreign.C.Types (CFloat(..))
import Foreign.Ptr (FunPtr, Ptr, plusPtr)
import Foreign.Storable (Storable(..))

-- These are unions with many aliases for each field. bindings-DSL
-- generates bad Haskell types for them that way, so we use just a
-- primary alias for each field here:
#starttype mat4
#field m00 , CFloat
#field m01 , CFloat
#field m02 , CFloat
#field m03 , CFloat
#field m10 , CFloat
#field m11 , CFloat
#field m12 , CFloat
#field m13 , CFloat
#field m20 , CFloat
#field m21 , CFloat
#field m22 , CFloat
#field m23 , CFloat
#field m30 , CFloat
#field m31 , CFloat
#field m32 , CFloat
#field m33 , CFloat
#stoptype

#ccall mat4_new , IO (Ptr <mat4>)
#ccall mat4_set_identity , Ptr <mat4> -> IO ()
#ccall mat4_set_zero , Ptr <mat4> -> IO ()
#ccall mat4_multiply , Ptr <mat4> -> Ptr <mat4> -> IO ()
#ccall mat4_set_orthographic , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_set_perspective , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_set_frustum , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_set_rotation , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_set_translation , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_set_scaling , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_rotate , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_translate , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> IO ()
#ccall mat4_scale , Ptr <mat4> -> CFloat -> CFloat -> CFloat -> IO ()

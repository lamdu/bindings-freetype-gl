-- | Small binding for glewInit() which is needed to use freetype-gl

#include <bindings.dsl.h>
#include <GL/glew.h>

module Bindings.GLEW.Init where

import Foreign.C.Types (CUChar, CUInt(..))
import Foreign.Ptr (FunPtr, Ptr)

#integral_t GLboolean
#num GL_TRUE
#num GL_FALSE

#integral_t GLenum
#num GLEW_OK

#globalvar glewExperimental , <GLboolean>

#ccall glewInit , IO <GLenum>

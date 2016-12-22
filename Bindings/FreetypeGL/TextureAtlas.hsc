-- | Bindings to texture-atlas.h

#include <bindings.dsl.h>
#include <texture-atlas.h>

module Bindings.FreetypeGL.TextureAtlas where

import Foreign.C.Types (CUInt(..), CSize(..), CChar(..))
import Foreign.Ptr (FunPtr, Ptr, plusPtr)
import Foreign.Storable (Storable(..))
import Bindings.FreetypeGL.Vec234

#starttype texture_atlas_t

#field width , CSize
#field height , CSize
#field depth , CSize
#field used , CSize
#field id , CUInt
#field data , Ptr CChar

#stoptype

#ccall texture_atlas_new , CSize -> CSize -> CSize -> IO (Ptr <texture_atlas_t>)
#ccall texture_atlas_delete , Ptr <texture_atlas_t> -> IO ()
#ccall wrapper__texture_atlas_get_region , Ptr <ivec4> -> Ptr <texture_atlas_t> -> CSize -> CSize -> IO ()
#ccall texture_atlas_set_region , Ptr <texture_atlas_t> -> CSize -> CSize -> CSize -> CSize -> Ptr CChar -> CSize -> IO ()
#ccall texture_atlas_clear , Ptr <texture_atlas_t> -> IO ()

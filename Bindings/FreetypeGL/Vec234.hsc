-- | bindings to vec234.h

#include <bindings.dsl.h>
#include <vec234.h>

module Bindings.FreetypeGL.Vec234 where

import Foreign.C.Types (CFloat(..), CInt(..))
import Foreign.Ptr (Ptr, plusPtr)
import Foreign.Storable (Storable(..))

-- These are unions with many aliases for each field. bindings-DSL
-- generates bad Haskell types for them that way, so we use just a
-- primary alias for each field here:
#starttype vec2
#field x , CFloat
#field y , CFloat
-- x,y == s,t
#stoptype

#starttype ivec4
#field x , CInt
#field y , CInt
#field z , CInt
#field w , CInt
-- x,y,z,w == r,g,b,a == vstart,vcount,istart,icount = x_,y_,width,height
#stoptype

#starttype vec4
#field x , CFloat
#field y , CFloat
#field z , CFloat
#field w , CFloat
-- x,y,z,w == r,g,b,a == left,top,width,height
#stoptype

-- | bindings to markup.h

#include <bindings.dsl.h>
#include <markup.h>

module Bindings.FreetypeGL.Markup where

import Foreign.C.String (CString)
import Foreign.C.Types (CFloat(..), CInt)
import Foreign.Ptr (Ptr, plusPtr)
import Foreign.Storable (Storable(..))
import Bindings.FreetypeGL.Vec234
import Bindings.FreetypeGL.TextureFont

#starttype markup_t
#field family , CString
#field size , CFloat
#field bold , CInt
#field italic , CInt
#field spacing , CFloat
#field gamma , CFloat
#field foreground_color , <vec4>
#field background_color , <vec4>
#field outline , CInt
#field outline_color , <vec4>
#field underline , CInt
#field underline_color , <vec4>
#field overline , CInt
#field overline_color , <vec4>
#field strikethrough , CInt
#field strikethrough_color , <vec4>
#field font , Ptr <texture_font_t>
#stoptype

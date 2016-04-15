-- | Bindings to font-manager.h

#include <bindings.dsl.h>
#include <font-manager.h>

module Bindings.FreetypeGL.FontManager where

import Bindings.FreetypeGL.Vector
import Bindings.FreetypeGL.Markup
import Bindings.FreetypeGL.TextureAtlas
import Bindings.FreetypeGL.TextureFont
import Foreign.C.String (CString)
import Foreign.C.Types (CInt(..), CSize(..), CFloat(..))
import Foreign.Ptr (FunPtr, Ptr, plusPtr)
import Foreign.Storable (Storable(..))

#starttype font_manager_t
#field atlas         , Ptr <texture_atlas_t>
#field fonts         , Ptr <vector_t>
#field cache         , CString
#stoptype

#ccall font_manager_new                  , CSize -> CSize -> CSize -> IO (Ptr <font_manager_t>)
#ccall font_manager_delete               , Ptr <font_manager_t> -> IO ()
#ccall font_manager_delete_font          , Ptr <font_manager_t> -> Ptr <texture_font_t> -> IO ()
#ccall font_manager_get_from_filename    , Ptr <font_manager_t> -> CString -> CFloat -> IO (Ptr <texture_font_t>)
#ccall font_manager_get_from_description , Ptr <font_manager_t> -> CString -> CFloat -> CInt -> CInt -> IO (Ptr <texture_font_t>)
#ccall font_manager_get_from_markup      , Ptr <font_manager_t> -> Ptr <markup_t> -> IO (Ptr <texture_font_t>)
#ccall font_manager_match_description    , Ptr <font_manager_t> -> CString -> CFloat -> CInt -> CInt -> IO CString

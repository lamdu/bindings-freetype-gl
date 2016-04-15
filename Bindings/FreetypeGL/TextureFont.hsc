-- | Bindings to texture-font.h

#include <bindings.dsl.h>
#include <texture-font.h>

module Bindings.FreetypeGL.TextureFont where

import Bindings.FreetypeGL.TextureAtlas
import Bindings.FreetypeGL.Vector
import Data.Word
import Foreign.C.String (CString)
import Foreign.C.Types (CChar, CSize(..), CFloat(..), CInt(..))
import Foreign.Marshal.Array (peekArray, pokeArray)
import Foreign.Ptr (FunPtr, Ptr, plusPtr)
import Foreign.Storable (Storable(..))

#starttype kerning_t

#field codepoint , Word32
#field kerning   , CFloat

#stoptype

#starttype texture_glyph_t

#field codepoint         , Word32
#field width             , CSize
#field height            , CSize
#field offset_x          , CInt
#field offset_y          , CInt
#field advance_x         , CFloat
#field advance_y         , CFloat
#field s0                , CFloat
#field t0                , CFloat
#field s1                , CFloat
#field t1                , CFloat
#field kerning           , Ptr <vector_t>
-- Glyph outline type (0 = None, 1 = line, 2 = inner, 3 = outer):
#field outline_type      , CInt
#field outline_thickness , CFloat

#stoptype

#num TEXTURE_FONT_FILE
#num TEXTURE_FONT_MEMORY

#starttype texture_font_t

#field glyphs , Ptr <vector_t>
#field atlas , Ptr <texture_atlas_t>

-- TEXTURE_FONT_FILE | TEXTURE_FONT_MEMORY
#field location , CInt

-- union: {
#field filename , CString
--   struct memory {
#field memory.base , Ptr ()
#field memory.size , CSize
--   }
-- }

#field size , CFloat

-- Whether to use autohint when rendering font
#field hinting , CInt

-- Outline type (0 = None, 1 = line, 2 = inner, 3 = outer)
#field outline_type , CInt

#field outline_thickness , CFloat

-- Enable freetype's LCD filtering
#field filtering , CInt
#array_field lcd_weights , Word8

#field kerning , CInt

#field height , CFloat

#field linegap , CFloat

#field ascender , CFloat
#field descender , CFloat
#field underline_position , CFloat
#field underline_thickness , CFloat

#stoptype

#ccall texture_font_new_from_file , Ptr <texture_atlas_t> -> CFloat -> CString -> IO (Ptr <texture_font_t>)

#ccall texture_font_new_from_memory , Ptr <texture_atlas_t> -> CFloat -> Ptr () -> CSize -> IO (Ptr <texture_font_t>)

#ccall texture_font_delete , Ptr <texture_font_t> -> IO ()

#ccall texture_font_get_glyph , Ptr <texture_font_t> -> Ptr CChar -> IO (Ptr <texture_glyph_t>)

#ccall texture_font_load_glyphs , Ptr <texture_font_t> -> CString -> IO CSize

#ccall texture_glyph_get_kerning , Ptr <texture_glyph_t> -> Ptr CChar -> IO CFloat

#ccall texture_glyph_new , IO (Ptr <texture_glyph_t>)

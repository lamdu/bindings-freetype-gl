module Bindings.FreetypeGL.Paths
    ( textShaderFragPath
    , textShaderVertPath
    ) where

import Paths_bindings_freetype_gl (getDataFileName)

textShaderVertPath :: IO FilePath
textShaderVertPath = getDataFileName "freetype-gl/shaders/text.vert"

textShaderFragPath :: IO FilePath
textShaderFragPath = getDataFileName "freetype-gl/shaders/text.frag"

module Bindings.FreetypeGL.Paths
    ( textShaderFrag
    , textShaderVert
    , textDistanceFieldShaderFrag
    , textDistanceFieldShaderVert
    ) where

import Paths_bindings_freetype_gl (getDataFileName)

textShaderVert :: IO FilePath
textShaderVert = getDataFileName "freetype-gl/shaders/text.vert"

textShaderFrag :: IO FilePath
textShaderFrag = getDataFileName "freetype-gl/shaders/text.frag"

textDistanceFieldShaderVert :: IO FilePath
textDistanceFieldShaderVert = getDataFileName "shaders/text-distance-field.vert"

textDistanceFieldShaderFrag :: IO FilePath
textDistanceFieldShaderFrag = getDataFileName "freetype-gl/shaders/text-distance-field.frag"

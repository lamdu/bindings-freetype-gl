module Bindings.FreetypeGL.Paths
    ( textShaderFrag
    , textShaderVert
    , textDistanceFieldShaderFrag
    , textDistanceFieldShaderVert
    , textTwoPassAFrag, textTwoPassBFrag
    ) where

import Paths_bindings_freetype_gl (getDataFileName)

textShaderVert :: IO FilePath
textShaderVert = getDataFileName "freetype-gl/shaders/text.vert"

textShaderFrag :: IO FilePath
textShaderFrag = getDataFileName "freetype-gl/shaders/text.frag"

textDistanceFieldShaderVert :: IO FilePath
textDistanceFieldShaderVert = getDataFileName "freetype-gl/shaders/distance-field.vert"

textDistanceFieldShaderFrag :: IO FilePath
textDistanceFieldShaderFrag = getDataFileName "freetype-gl/shaders/distance-field.frag"

textTwoPassAFrag :: IO FilePath
textTwoPassAFrag = getDataFileName "freetype-gl/shaders/twopass-a.frag"

textTwoPassBFrag :: IO FilePath
textTwoPassBFrag = getDataFileName "freetype-gl/shaders/twopass-b.frag"

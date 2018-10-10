{-# LANGUAGE TemplateHaskell #-}

module Bindings.FreetypeGL.Shaders
    ( textShaderFrag
    , textShaderVert
    , textDistanceFieldShaderFrag
    , textDistanceFieldShaderVert
    , textTwoPassAFrag, textTwoPassBFrag
    ) where

import Data.ByteString (ByteString)
import Data.FileEmbed (embedFile)

textShaderVert :: ByteString
textShaderVert = $(embedFile "freetype-gl/shaders/text.vert")

textShaderFrag :: ByteString
textShaderFrag = $(embedFile "freetype-gl/shaders/text.frag")

textDistanceFieldShaderVert :: ByteString
textDistanceFieldShaderVert = $(embedFile "freetype-gl/shaders/distance-field.vert")

textDistanceFieldShaderFrag :: ByteString
textDistanceFieldShaderFrag = $(embedFile "freetype-gl/shaders/distance-field.frag")

textTwoPassAFrag :: ByteString
textTwoPassAFrag = $(embedFile "freetype-gl/shaders/twopass-a.frag")

textTwoPassBFrag :: ByteString
textTwoPassBFrag = $(embedFile "freetype-gl/shaders/twopass-b.frag")
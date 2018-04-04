module Facet.Scenegraph.SVG.Path exposing (Path, toString)

{-|
@docs Path, toString
-}

import Facet.Scenegraph.SVG.Command as Command exposing (Command)


{-| SVG Paths
-}
type alias Path =
    List Command


{-| String encoding of an SVG path
-}
toString : Path -> String
toString =
    List.map Command.toString >> String.join ","

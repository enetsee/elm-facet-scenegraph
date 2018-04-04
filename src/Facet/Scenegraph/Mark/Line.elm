module Facet.Scenegraph.Mark.Line exposing (Line)

{-|
@docs Line
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorPointer))
import Facet.Scenegraph.Interpolate exposing (Interpolate)
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)


{-| Stroked lines
-}
type alias Line =
    { x : List Float
    , y : List Float
    , interpolate : Interpolate
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

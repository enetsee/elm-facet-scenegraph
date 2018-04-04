module Facet.Scenegraph.Mark.Path exposing (Path)

{-|
@docs Path
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorDefault))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Position exposing (Position(Primary))
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)
import Facet.Scenegraph.SVG.Path as SVG


{-| Arbitrary paths or polygons, defined using SVG path syntax
-}
type alias Path =
    { path : SVG.Path
    , x : Position
    , y : Position
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

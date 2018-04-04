module Facet.Scenegraph.Mark.Arc exposing (Arc)

{-|
@docs Arc
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorPointer))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Position exposing (Position(Primary))
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)


{-| Circular arc
-}
type alias Arc =
    { startAngle : Float
    , endAngle : Float
    , padAngle : Float
    , innerRadius : Float
    , outerRadius : Float
    , cornerRadius : Float
    , x : Position
    , y : Position
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

module Facet.Scenegraph.Mark.Area exposing (Area)

{-|
@docs Area
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorPointer))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Interpolate exposing (Interpolate)
import Facet.Scenegraph.Position exposing (Position(Primary), PositionOrExtent(Position, Extent))
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)


{-| Filled area with horizontal alignment
-}
type alias Area =
    { x : List Float
    , y : List Position
    , interpolate : Interpolate
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

module Facet.Scenegraph.Mark.Rect exposing (Rect)

{-|
@docs Rect
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorPointer))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Position exposing (Position(PrimarySecondary), PositionOrExtent(Position, Extent))
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)


{-| Rectangles
-}
type alias Rect =
    { cornerRadius : Float
    , x : Position
    , y : Position
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

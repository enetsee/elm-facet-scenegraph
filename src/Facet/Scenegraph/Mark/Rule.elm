module Facet.Scenegraph.Mark.Rule exposing (Rule)

{-|
@docs Rule
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorPointer))
import Facet.Scenegraph.Position exposing (Position(PrimarySecondary), PositionOrExtent(Position))
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)


{-| Line segments
-}
type alias Rule =
    { x : Position
    , y : Position
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

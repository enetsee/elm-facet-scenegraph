module Facet.Scenegraph.Mark.Group exposing (Group)

{-|
@docs Group
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorPointer))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Position exposing (Position(Primary))
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)


{-| Container for other marks
-}
type alias Group =
    { clip : Bool
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

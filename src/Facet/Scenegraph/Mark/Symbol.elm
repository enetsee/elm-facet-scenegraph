module Facet.Scenegraph.Mark.Symbol exposing (Symbol)

{-|
@docs Symbol
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorPointer))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Position exposing (Position(Primary))
import Facet.Scenegraph.Shape as Shape exposing (Shape)
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)


{-| Plotting symbols, including circles, squares and other shapes
-}
type alias Symbol =
    { shape : Shape
    , size : Float
    , angle : Float
    , x : Position
    , y : Position
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

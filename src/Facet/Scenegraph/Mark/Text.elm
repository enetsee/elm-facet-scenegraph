module Facet.Scenegraph.Mark.Text exposing (Text, Direction(..), Baseline(..), Align(..))

{-|
@docs Text, Direction, Baseline, Align
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorDefault))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Position exposing (Position(Primary))
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)
import Facet.Scenegraph.Font as Font exposing (Font)


{-| Text labels with configurable fonts, alignment and angle
-}
type alias Text =
    { text : String
    , align : Align
    , baseline : Baseline
    , direction : Direction
    , dx : Float
    , dy : Float
    , elipsis : Maybe String
    , font : Font
    , angle : Float
    , radius : Float
    , theta : Float
    , x : Position
    , y : Position
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| Horizontal alignment
-}
type Align
    = Left
    | Center
    | Right


{-| Vertical alignment
-}
type Baseline
    = Top
    | Middle
    | Bottom
    | Alphabetic


{-| Flow direction
-}
type Direction
    = LeftToRight
    | RightToLeft

module Facet.Scenegraph.Mark.Trail exposing (Trail)

{-|
@docs Trail
-}

import Facet.Scenegraph.Cursor exposing (Cursor(CursorDefault))
import Facet.Scenegraph.Fill as Fill exposing (Fill)


{-| Filled lines with varying width
-}
type alias Trail =
    { x : List Float
    , y : List Float
    , width : List Float
    , fill : Fill
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }

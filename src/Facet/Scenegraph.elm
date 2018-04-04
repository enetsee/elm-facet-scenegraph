module Facet.Scenegraph exposing (Scenegraph(..), ViewBox)

{-|
@docs Scenegraph, ViewBox
-}

import Facet.Scenegraph.Mark.Arc exposing (Arc)
import Facet.Scenegraph.Mark.Area exposing (Area)
import Facet.Scenegraph.Mark.Group exposing (Group)
import Facet.Scenegraph.Mark.Line exposing (Line)
import Facet.Scenegraph.Mark.Path exposing (Path)
import Facet.Scenegraph.Mark.Rect exposing (Rect)
import Facet.Scenegraph.Mark.Rule exposing (Rule)
import Facet.Scenegraph.Mark.Symbol exposing (Symbol)
import Facet.Scenegraph.Mark.Text exposing (Text)
import Facet.Scenegraph.Mark.Trail exposing (Trail)


{-| A data structure representing a set of visual marks
-}
type Scenegraph
    = Arc (List Arc)
    | Area (List Area)
    | Group (List ( Group, List Scenegraph ))
    | Line (List Line)
    | Path (List Path)
    | Rect (List Rect)
    | Rule (List Rule)
    | Symbol (List Symbol)
    | Text (List Text)
    | Trail (List Trail)


{-| Control how a scenegraph is displayed once rendered
-}
type alias ViewBox =
    { x : Float
    , y : Float
    , width : Float
    , height : Float
    }

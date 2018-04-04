module Facet.Scenegraph.Shape exposing (Shape(..))

{-|
@docs Shape
-}

import Facet.Scenegraph.SVG.Path as SVG


{-| A set of predefined shapes and custom SVG paths
-}
type Shape
    = Circle
    | Square
    | Cross
    | Diamond
    | TriangleUp
    | TriangleDown
    | TriangleRight
    | TriangleLeft
    | Custom SVG.Path

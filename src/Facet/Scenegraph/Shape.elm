module Facet.Scenegraph.Shape exposing (Shape(..))

{-|
@docs Shape
-}

import Path.LowLevel exposing (SubPath)


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
    | Custom SubPath

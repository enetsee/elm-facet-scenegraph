module Facet.Scenegraph.Fill exposing (Fill, empty)

{-|
@docs Fill,empty
-}

import Color exposing (Color)


{-| -}
type alias Fill =
    { fill : Maybe Color
    , fillOpacity : Maybe Float
    }


{-| -}
empty : Fill
empty =
    Fill Nothing Nothing

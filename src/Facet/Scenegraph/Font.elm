module Facet.Scenegraph.Font exposing (Font, default, FontStyle(..), FontWeight(..), fontStyleToString, fontWeightToString)

{-|
@docs Font,  FontWeight, FontStyle
@docs fontStyleToString, fontWeightToString
-}


{-| Font styling
-}
type alias Font =
    { font : String
    , fontSize : Float
    , fontWeight : FontWeight
    , fontStyle : FontStyle
    }


{-| -}
type FontWeight
    = WeightNormal
    | WeightBold


{-| -}
type FontStyle
    = StyleNormal
    | StyleItalic


default : Font
default =
    Font "Helvetica" 12 WeightNormal StyleNormal


{-| -}
fontWeightToString : FontWeight -> String
fontWeightToString weight =
    case weight of
        WeightNormal ->
            "normal"

        WeightBold ->
            "bold"


{-| -}
fontStyleToString : FontStyle -> String
fontStyleToString style =
    case style of
        StyleNormal ->
            "normal"

        StyleItalic ->
            "italic"

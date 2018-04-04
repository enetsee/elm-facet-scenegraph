module Facet.Scenegraph.Stroke
    exposing
        ( Stroke
        , StrokeCap(..)
        , StrokeJoin(..)
        , empty
        , strokeCapToString
        , strokeJoinToString
        , strokeDashToString
        )

{-|
@docs Stroke, StrokeCap, StrokeJoin,empty
@docs strokeCapToString, strokeJoinToString, strokeDashToString
-}

import Color exposing (Color)


{-| Stroke styling
-}
type alias Stroke =
    { stroke : Maybe Color
    , strokeOpacity : Maybe Float
    , strokeWidth : Maybe Float
    , strokeCap : Maybe StrokeCap
    , strokeDash : Maybe (List Float)
    , strokeDashOffset : Maybe Float
    , strokeJoin : Maybe StrokeJoin
    , strokeMiterLimit : Maybe Float
    }


type StrokeCap
    = CapButt
    | CapRound
    | CapSquare


type StrokeJoin
    = JoinMiter
    | JoinRound
    | JoinBevel


empty : Stroke
empty =
    { stroke = Nothing
    , strokeOpacity = Nothing
    , strokeWidth = Nothing
    , strokeCap = Nothing
    , strokeDash = Nothing
    , strokeDashOffset = Nothing
    , strokeJoin = Nothing
    , strokeMiterLimit = Nothing
    }


{-| -}
strokeCapToString : StrokeCap -> String
strokeCapToString strokeCap =
    case strokeCap of
        CapButt ->
            "butt"

        CapRound ->
            "round"

        CapSquare ->
            "square"


{-| -}
strokeJoinToString : StrokeJoin -> String
strokeJoinToString strokeJoin =
    case strokeJoin of
        JoinMiter ->
            "miter"

        JoinRound ->
            "round"

        JoinBevel ->
            "bevel"


{-| -}
strokeDashToString : List a -> String
strokeDashToString strokeDash =
    strokeDash |> List.map toString |> String.join ","

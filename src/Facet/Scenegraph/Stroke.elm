module Facet.Scenegraph.Stroke
    exposing
        ( Stroke
        , StrokeDash(..)
        , StrokeCap(..)
        , StrokeJoin(..)
        , empty
        , strokeDashToString
        , strokeCapToString
        , strokeJoinToString
        )

{-|
@docs Stroke, StrokeDash, StrokeCap, StrokeJoin,empty
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


{-|
-}
type StrokeDash
    = StrokeDash1
    | StrokeDash2
    | StrokeDash3
    | StrokeDash4
    | StrokeDash5
    | StrokeDash6
    | StrokeDash7
    | StrokeDash8
    | StrokeDash9
    | StrokeDash10
    | StrokeDashCustom (List Float)


{-| -}
type StrokeCap
    = CapButt
    | CapRound
    | CapSquare


{-| -}
type StrokeJoin
    = JoinMiter
    | JoinRound
    | JoinBevel


{-| The empty stroke
-}
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
strokeDashToString : StrokeDash -> String
strokeDashToString strokeDash =
    case strokeDash of
        StrokeDash1 ->
            "5, 5"

        StrokeDash2 ->
            "5, 10"

        StrokeDash3 ->
            "10, 5"

        StrokeDash4 ->
            "5, 1"

        StrokeDash5 ->
            "1, 5"

        StrokeDash6 ->
            "0.9"

        StrokeDash7 ->
            "15, 10, 5"

        StrokeDash8 ->
            "15, 10, 5, 10"

        StrokeDash9 ->
            "15, 10, 5, 10, 15"

        StrokeDash10 ->
            "5, 5, 1, 5"

        StrokeDashCustom xs ->
            case xs of
                [] ->
                    "none"

                _ ->
                    xs |> List.map toString |> String.join ", "

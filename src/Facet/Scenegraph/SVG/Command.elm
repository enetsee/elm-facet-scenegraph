module Facet.Scenegraph.SVG.Command exposing (Command(..), toString)

{-|
@docs Command, toString
-}

import Facet.Scenegraph.SVG.Point exposing (Point)


{-| SVG path commands
-}
type Command
    = MoveTo { endpoint : Point }
    | LineTo { endpoint : Point }
    | HorizontalLineTo { endx : Float }
    | VerticalLineTo { endy : Float }
    | CubicBezierTo { controlStart : Point, controlEnd : Point, endpoint : Point }
    | CubicBezierToShort { controlEnd : Point, endpoint : Point }
    | QuadraticBezierTo { control : Point, endpoint : Point }
    | QuadraticBezierToShort { endpoint : Point }
    | ArcTo { xRadius : Float, yRadius : Float, xAxisRotation : Float, largeArc : Bool, sweep : Bool, endpoint : Point }
    | ClosePath


{-| String encoding of an SVG path command
-}
toString : Command -> String
toString command =
    case command of
        MoveTo { endpoint } ->
            "M" ++ Basics.toString endpoint.x ++ " " ++ Basics.toString endpoint.y

        LineTo { endpoint } ->
            "L" ++ Basics.toString endpoint.x ++ " " ++ Basics.toString endpoint.y

        HorizontalLineTo { endx } ->
            "H" ++ Basics.toString endx

        VerticalLineTo { endy } ->
            "V" ++ Basics.toString endy

        CubicBezierTo { controlStart, controlEnd, endpoint } ->
            "C "
                ++ Basics.toString controlStart.x
                ++ " "
                ++ Basics.toString controlStart.y
                ++ ","
                ++ Basics.toString controlEnd.x
                ++ " "
                ++ Basics.toString controlEnd.y
                ++ ","
                ++ Basics.toString endpoint.x
                ++ " "
                ++ Basics.toString endpoint.y

        CubicBezierToShort { controlEnd, endpoint } ->
            "S "
                ++ Basics.toString controlEnd.x
                ++ " "
                ++ Basics.toString controlEnd.y
                ++ ","
                ++ Basics.toString endpoint.x
                ++ " "
                ++ Basics.toString endpoint.y

        QuadraticBezierTo { control, endpoint } ->
            "Q "
                ++ Basics.toString control.x
                ++ " "
                ++ Basics.toString control.y
                ++ ","
                ++ Basics.toString endpoint.x
                ++ " "
                ++ Basics.toString endpoint.y

        QuadraticBezierToShort { endpoint } ->
            "T "
                ++ Basics.toString endpoint.x
                ++ " "
                ++ Basics.toString endpoint.y

        ArcTo { xRadius, yRadius, xAxisRotation, largeArc, sweep, endpoint } ->
            "A "
                ++ Basics.toString xRadius
                ++ " "
                ++ Basics.toString yRadius
                ++ " "
                ++ Basics.toString xAxisRotation
                ++ " "
                ++ (if largeArc then
                        "1"
                    else
                        "0"
                   )
                ++ " "
                ++ (if sweep then
                        "1"
                    else
                        "0"
                   )
                ++ " "
                ++ Basics.toString endpoint.x
                ++ " "
                ++ Basics.toString endpoint.y

        ClosePath ->
            "Z"

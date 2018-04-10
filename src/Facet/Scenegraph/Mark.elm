module Facet.Scenegraph.Mark
    exposing
        ( Arc
        , arc
        , startAngle
        , endAngle
        , padAngle
        , innerRadius
        , outerRadius
        , Area
        , Orientation(..)
        , hArea
        , vArea
        , Group
        , group
        , clip
        , Line
        , line
        , Path
        , path
        , Rect
        , rect
        , Rule
        , rule
        , Symbol
        , symbol
        , shape
        , Text
        , Direction(..)
        , Baseline(..)
        , Align(..)
        , text
        , relativePosition
        , align
        , baseline
        , direction
        , font
        , fontName
        , fontWeight
        , fontWeightBold
        , fontWeightNormal
        , fontStyle
        , fontStyleItalic
        , fontStyleNormal
        , Trail
        , trail
        , FilledMark
        , fill
        , fillColor
        , fillOpacity
        , StrokedMark
        , stroke
        , strokeColor
        , strokeWidth
        , strokeOpacity
        , strokeDashArray
        , strokeDashOffset
        , strokeCap
        , strokeCapButt
        , strokeCapRound
        , strokeCapSquare
        , strokeJoin
        , strokeJoinMiter
        , strokeJoinRound
        , strokeJoinBevel
        , strokeMiterLimit
        , angle
        , cornerRadius
        , LineLike
        , Behaviour(..)
        , interpolate
        , behaviour
        , Mark
        , href
        , tooltip
        , zIndex
        )

{-|
# Static encodings of visual marks

## Arc
@docs  Arc, arc, startAngle , endAngle , padAngle , innerRadius , outerRadius

## Area
@docs Area,Orientation, hArea, vArea

## Group
@docs Group, group, clip

##Line
@docs Line, line

##Line-like
@docs Behaviour, LineLike, interpolate, behaviour

##Path
@docs Path, path

##Rect
@docs Rect , rect

##Rule
@docs Rule, rule

##Symbol
@docs Symbol, symbol, shape

##Text
@docs Text, Direction, Align, Baseline, text, relativePosition, align, baseline, direction, font , fontName , fontWeight, fontWeightBold, fontWeightNormal, fontStyle, fontStyleItalic, fontStyleNormal

##Trail
@docs Trail , trail

##Fill
@docs FilledMark, fill, fillColor, fillOpacity

##Stroke
@docs StrokedMark, stroke, strokeColor, strokeWidth, strokeOpacity, strokeDashArray, strokeDashOffset, strokeCap, strokeCapButt, strokeCapRound, strokeCapSquare, strokeJoin, strokeJoinBevel, strokeJoinMiter, strokeJoinRound, strokeMiterLimit

##Miscellaneous
@docs angle, cornerRadius

##General
@docs Mark, href, tooltip, zIndex
-}

import Color exposing (Color)
import Facet.Scenegraph.Cursor exposing (Cursor(CursorDefault))
import Facet.Scenegraph.Fill as Fill exposing (Fill)
import Facet.Scenegraph.Font as Font exposing (Font)
import Facet.Scenegraph.Interpolate exposing (Interpolate)
import Facet.Scenegraph.Position exposing (Position(..))
import Facet.Scenegraph.Shape as Shape exposing (Shape)
import Facet.Scenegraph.Stroke as Stroke exposing (Stroke)
import Path.LowLevel exposing (SubPath)


-- import Facet.Scenegraph.SVG.Path as SVG
-- Arcs ------------------------------------------------------------------------


{-| Circular arc
-}
type alias Arc =
    { startAngle : Float
    , endAngle : Float
    , padAngle : Float
    , innerRadius : Float
    , outerRadius : Float
    , cornerRadius : Float
    , x : Float
    , y : Float
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
arc : Float -> Float -> Float -> Float -> Arc
arc x y startAngle endAngle =
    Arc startAngle endAngle 0 0 0 0 x y Fill.empty Stroke.empty CursorDefault Nothing Nothing 0


{-| -}
startAngle : Float -> Arc -> Arc
startAngle angle arc =
    { arc | startAngle = angle }


{-| -}
endAngle : Float -> Arc -> Arc
endAngle angle arc =
    { arc | endAngle = angle }


{-| -}
padAngle : Float -> Arc -> Arc
padAngle angle arc =
    { arc | padAngle = angle }


{-| -}
innerRadius : Float -> Arc -> Arc
innerRadius radius arc =
    { arc | innerRadius = radius }


{-| -}
outerRadius : Float -> Arc -> Arc
outerRadius radius arc =
    { arc | outerRadius = radius }



-- Area ------------------------------------------------------------------------


{-| What to when a point is not defined
-}
type Behaviour
    = SkipMissing
    | Split


{-| -}
type Orientation
    = Vertical
    | Horizontal


{-| Filled area with either vertical or horizontal orientation
-}
type alias Area =
    { x : List (Maybe Float)
    , y : List (Maybe Position)
    , interpolate : Interpolate
    , behaviour : Behaviour
    , alignment : Orientation
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
hArea : List Float -> List Float -> List Float -> Interpolate -> Behaviour -> Area
hArea xs ys ys2 interpolate behaviour =
    Area (List.map Just xs)
        (List.map2 (\x x2 -> PrimarySecondary x x2 |> Just) ys ys2)
        interpolate
        behaviour
        Horizontal
        Fill.empty
        Stroke.empty
        CursorDefault
        Nothing
        Nothing
        0


{-| -}
vArea : List Float -> List Float -> List Float -> Interpolate -> Behaviour -> Area
vArea xs ys ys2 interpolate behaviour =
    Area (List.map Just xs)
        (List.map2 (\x x2 -> PrimarySecondary x x2 |> Just) ys ys2)
        interpolate
        behaviour
        Vertical
        Fill.empty
        Stroke.empty
        CursorDefault
        Nothing
        Nothing
        0



-- Group -----------------------------------------------------------------------


{-| Container for other marks
-}
type alias Group =
    { clip : Bool
    , cornerRadius : Float
    , x : Float
    , y : Float
    , width : Float
    , height : Float
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
group : Float -> Float -> Float -> Float -> Bool -> Group
group x width y height clip =
    Group clip 0 x y width height Fill.empty Stroke.empty CursorDefault Nothing Nothing 0


{-| -}
clip : Bool -> Group -> Group
clip clip group =
    { group | clip = clip }



-- Line ------------------------------------------------------------------------


{-| Stroked lines
-}
type alias Line =
    { x : List (Maybe Float)
    , y : List (Maybe Float)
    , interpolate : Interpolate
    , behaviour : Behaviour
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
line : List Float -> List Float -> Interpolate -> Behaviour -> Line
line xs ys interpolate behaviour =
    Line
        (List.map Just xs)
        (List.map Just ys)
        interpolate
        behaviour
        Stroke.empty
        CursorDefault
        Nothing
        Nothing
        0



-- Line-like -------------------------------------------------------------------


{-| -}
type alias LineLike a =
    { a | interpolate : Interpolate, behaviour : Behaviour }


{-| -}
interpolate : Interpolate -> LineLike a -> LineLike a
interpolate method mark =
    { mark | interpolate = method }


{-| -}
behaviour : Behaviour -> LineLike a -> LineLike a
behaviour behaviour mark =
    { mark | behaviour = behaviour }



-- Path ------------------------------------------------------------------------


{-| Arbitrary paths or polygons, defined using SVG path syntax
-}
type alias Path =
    { path : SubPath
    , x : Float
    , y : Float
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
path : Float -> Float -> SubPath -> Path
path x y path =
    Path path x y Fill.empty Stroke.empty CursorDefault Nothing Nothing 0



-- Rect ------------------------------------------------------------------------


{-| Rectangles
-}
type alias Rect =
    { cornerRadius : Float
    , x : Position
    , y : Position
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
rect : Float -> Float -> Float -> Float -> Rect
rect x x2 y y2 =
    Rect 0
        (PrimarySecondary x x2)
        (PrimarySecondary y y2)
        Fill.empty
        Stroke.empty
        CursorDefault
        Nothing
        Nothing
        0



-- Rule ------------------------------------------------------------------------


{-| Line segments
-}
type alias Rule =
    { x : Position
    , y : Position
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
rule : Float -> Float -> Float -> Float -> Rule
rule x x2 y y2 =
    Rule
        (PrimarySecondary x x2)
        (PrimarySecondary y y2)
        Stroke.empty
        CursorDefault
        Nothing
        Nothing
        0



-- Symbol ----------------------------------------------------------------------


{-| Plotting symbols, including circles, squares and other shapes
-}
type alias Symbol =
    { shape : Shape
    , size : Float
    , angle : Float
    , x : Float
    , y : Float
    , fill : Fill
    , stroke : Stroke
    , cursor : Cursor
    , href : Maybe String
    , tooltip : Maybe String
    , zIndex : Int
    }


{-| -}
symbol : Float -> Float -> Float -> Shape -> Symbol
symbol x y size shape =
    Symbol shape size 0 x y Fill.empty Stroke.empty CursorDefault Nothing Nothing 0


{-| -}
shape : Shape -> Symbol -> Symbol
shape shape symbol =
    { symbol | shape = shape }



-- Text ------------------------------------------------------------------------


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
    , x : Float
    , y : Float
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


{-| -}
text : Float -> Float -> String -> Text
text x y text =
    Text text
        Center
        Middle
        LeftToRight
        0
        0
        Nothing
        Font.default
        0
        0
        0
        x
        y
        Fill.empty
        Stroke.empty
        CursorDefault
        Nothing
        Nothing
        0


{-| -}
relativePosition : Float -> Float -> Text -> Text
relativePosition dx dy text =
    { text | dx = dx, dy = dy }


{-| -}
align : Align -> Text -> Text
align align text =
    { text | align = align }


{-| -}
baseline : Baseline -> Text -> Text
baseline baseline text =
    { text | baseline = baseline }


{-| -}
direction : Direction -> Text -> Text
direction direction text =
    { text | direction = direction }


{-| -}
font : Font -> Text -> Text
font font text =
    { text | font = font }


{-| -}
fontName : String -> Text -> Text
fontName name mark =
    let
        currentFont =
            mark.font

        newFont =
            { currentFont | font = name }
    in
        font newFont mark


{-| -}
fontSize : Float -> Text -> Text
fontSize size mark =
    let
        currentFont =
            mark.font

        newFont =
            { currentFont | fontSize = size }
    in
        font newFont mark


{-| -}
fontWeight : Font.FontWeight -> Text -> Text
fontWeight weight mark =
    let
        currentFont =
            mark.font

        newFont =
            { currentFont | fontWeight = weight }
    in
        font newFont mark


{-| -}
fontWeightBold : Text -> Text
fontWeightBold =
    fontWeight Font.WeightBold


{-| -}
fontWeightNormal : Text -> Text
fontWeightNormal =
    fontWeight Font.WeightNormal


{-| -}
fontStyle : Font.FontStyle -> Text -> Text
fontStyle style mark =
    let
        currentFont =
            mark.font

        newFont =
            { currentFont | fontStyle = style }
    in
        font newFont mark


{-| -}
fontStyleItalic : Text -> Text
fontStyleItalic =
    fontStyle Font.StyleItalic


{-| -}
fontStyleNormal : Text -> Text
fontStyleNormal =
    fontStyle Font.StyleNormal



-- Trail -----------------------------------------------------------------------


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


{-| -}
trail : List Float -> List Float -> List Float -> Trail
trail xs ys widths =
    Trail xs ys widths Fill.empty CursorDefault Nothing Nothing 0



-- Fill ------------------------------------------------------------------------


{-| -}
type alias FilledMark a =
    { a | fill : Fill }


{-| -}
fill : Fill -> FilledMark a -> FilledMark a
fill fill mark =
    { mark | fill = fill }


{-| -}
fillColor : Color -> FilledMark a -> FilledMark a
fillColor color mark =
    let
        currentFill =
            mark.fill

        newFill =
            { currentFill | fill = Just color }
    in
        fill newFill mark


{-| -}
fillOpacity : Float -> FilledMark a -> FilledMark a
fillOpacity opacity mark =
    let
        currentFill =
            mark.fill

        newFill =
            { currentFill | fillOpacity = Just opacity }
    in
        fill newFill mark



-- Stroke  ---------------------------------------------------------------------


{-| -}
type alias StrokedMark a =
    { a | stroke : Stroke }


{-| -}
stroke : Stroke -> StrokedMark a -> StrokedMark a
stroke stroke mark =
    { mark | stroke = stroke }


{-| -}
strokeColor : Color -> StrokedMark a -> StrokedMark a
strokeColor color mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | stroke = Just color }
    in
        stroke newStroke mark


{-| -}
strokeWidth : Float -> StrokedMark a -> StrokedMark a
strokeWidth width mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | strokeWidth = Just width }
    in
        stroke newStroke mark


{-| -}
strokeOpacity : Float -> StrokedMark a -> StrokedMark a
strokeOpacity opacity mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | strokeOpacity = Just opacity }
    in
        stroke newStroke mark


{-| -}
strokeDashArray : List Float -> StrokedMark a -> StrokedMark a
strokeDashArray dashArray mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | strokeDash = Just dashArray }
    in
        stroke newStroke mark


{-| -}
strokeDashOffset : Float -> StrokedMark a -> StrokedMark a
strokeDashOffset offset mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | strokeDashOffset = Just offset }
    in
        stroke newStroke mark


{-| -}
strokeCap : Stroke.StrokeCap -> StrokedMark a -> StrokedMark a
strokeCap cap mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | strokeCap = Just cap }
    in
        stroke newStroke mark


{-| -}
strokeCapButt : StrokedMark a -> StrokedMark a
strokeCapButt =
    strokeCap Stroke.CapButt


{-| -}
strokeCapRound : StrokedMark a -> StrokedMark a
strokeCapRound =
    strokeCap Stroke.CapRound


{-| -}
strokeCapSquare : StrokedMark a -> StrokedMark a
strokeCapSquare =
    strokeCap Stroke.CapSquare


{-| -}
strokeJoin : Stroke.StrokeJoin -> StrokedMark a -> StrokedMark a
strokeJoin join mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | strokeJoin = Just join }
    in
        stroke newStroke mark


{-| -}
strokeJoinMiter : StrokedMark a -> StrokedMark a
strokeJoinMiter =
    strokeJoin Stroke.JoinMiter


{-| -}
strokeJoinRound : StrokedMark a -> StrokedMark a
strokeJoinRound =
    strokeJoin Stroke.JoinRound


{-| -}
strokeJoinBevel : StrokedMark a -> StrokedMark a
strokeJoinBevel =
    strokeJoin Stroke.JoinBevel


{-| -}
strokeMiterLimit : Float -> StrokedMark a -> StrokedMark a
strokeMiterLimit limit mark =
    let
        currentStroke =
            mark.stroke

        newStroke =
            { currentStroke | strokeMiterLimit = Just limit }
    in
        stroke newStroke mark



-- Miscellaneous ---------------------------------------------------------------


{-| -}
angle : Float -> { c | angle : Float } -> { c | angle : Float }
angle angle mark =
    { mark | angle = angle }


{-| -}
cornerRadius : Float -> { c | cornerRadius : Float } -> { c | cornerRadius : Float }
cornerRadius radius mark =
    { mark | cornerRadius = radius }



-- Common ----------------------------------------------------------------------


{-| -}
type alias Mark a =
    { a | href : Maybe String, tooltip : Maybe String, zIndex : Int }


{-| -}
href : String -> Mark a -> Mark a
href href mark =
    { mark | href = Just href }


{-| -}
tooltip : String -> Mark a -> Mark a
tooltip text mark =
    { mark | tooltip = Just text }


{-| -}
zIndex : Int -> Mark a -> Mark a
zIndex z mark =
    { mark | zIndex = z }

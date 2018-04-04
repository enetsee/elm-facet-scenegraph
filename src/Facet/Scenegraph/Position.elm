module Facet.Scenegraph.Position exposing (map, Position(..), PositionOrExtent(..))

{-|
@docs Position, PositionOrExtent
@docs map
-}


{-| Varying encodings of position
    TODO: `Primary` is probably not required and `PrimarySecondary` should
    be expanded into `PrimarySecondary` and `PrimaryExtent`
-}
type Position
    = Primary Float
    | PrimarySecondary Float PositionOrExtent
    | SecondaryExtent Float Float
    | CenterExtent Float Float


{-| -}
map : (Float -> Float) -> Position -> Position
map f position =
    case position of
        Primary val ->
            Primary <| f val

        PrimarySecondary x positionOrExtent ->
            PrimarySecondary (f x) (mapPositionOrExtent f positionOrExtent)

        SecondaryExtent x extent ->
            SecondaryExtent (f x) extent

        CenterExtent x extent ->
            CenterExtent (f x) extent


{-| A position or an extent
-}
type PositionOrExtent
    = Position Float
    | Extent Float


mapPositionOrExtent : (Float -> Float) -> PositionOrExtent -> PositionOrExtent
mapPositionOrExtent f positionOrExtent =
    case positionOrExtent of
        Position x ->
            Position <| f x

        _ ->
            positionOrExtent

module Facet.Scenegraph.Interpolate exposing (Interpolate(..))

{-|
@docs Interpolate
-}


{-| Interpolation methods
-}
type Interpolate
    = Linear
    | Basis
    | Bundle Float
    | Cardinal Float
    | CatmullRom Float
    | InterpolateLinear
    | Monotone
    | Natural
    | Step
    | StepAfter
    | StepBefore

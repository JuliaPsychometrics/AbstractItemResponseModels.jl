# Traits

Implementations of [`ItemResponseModel`](@ref) define four traits that represent certain characteristics of the item response model.

## Dimensionality
```@docs; canonical=false
Dimensionality
```

Possible values are [`Univariate`](@ref) or [`Multivariate`](@ref).

```@docs; canonical=false
Univariate
Multivariate
```

### Item dimensionality
The item dimensionality defines whether a model has one- or multidimensional item parameters.

```@docs; canonical=false
item_dimensionality
```

### Person dimensionality
The person dimensionality defines whether a model has one- or multidimensional person parameters. 

```@docs; canonical=false
person_dimensionality
```

## Estimation type
The estimation type of a model reflects how the model was estimated. 

```@docs; canonical=false
EstimationType
```

If an optimization procedure was carried out, resulting in a point estimate of the parameters, then the model has estimation type [`PointEstimate`](@ref)

```@docs; canonical=false
PointEstimate
```

For sampling based estimation procedures (e.g. Markov Chain Monte Carlo methods), models carry the [`SamplingEstimate`](@ref) trait.

```@docs; canonical=false
SamplingEstimate
```

Certain methods, such as variational inference, return probability distributions. Such models require the [`DistributionEstimate`](@ref) trait.

```@docs; canonical=false
DistributionEstimate
```

## Response type
The response type of a model defines the allowed responses to items. 

```@docs; canonical=false
ResponseType
```

AbstractItemResponseModels.jl differentiates between dichotomous, nominal, ordinal, and continuous responses. 

[`Dichotomous`](@ref) response allow the values `0` and `1`, representing an incorrect and correct response respectively. 

```@docs; canonical=false
Dichotomous
```

The [`Nominal`](@ref) response type represents an unordered categorical response. Allowed values are the natural numbers (excluding zero), e.g. `1`, `2`, or `10`. 

```@docs; canonical=false
Nominal
```

The [`Ordinal`](@ref) response type is an ordered categorical response type. Much like the [`Nominal`](@ref) models, [`Ordinal`](@ref) models allow response values in the natural numbers (excluding zero) with an order relation, e.g. `1`, `2`, `3` such that `1 < 2 < 3`.

```@docs; canonical=false
Ordinal
```

Finally, the [`Continuous`](@ref) response type allows real-valued responses such as `0.5`, `1/3`, or `-2.33`.

```@docs; canonical=false
Continuous
```

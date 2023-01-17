# AbstractItemResponseModels.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaPsychometrics.github.io/AbstractItemResponseModels.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaPsychometrics.github.io/AbstractItemResponseModels.jl/dev/)
[![Build Status](https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/JuliaPsychometrics/AbstractItemResponseModels.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/JuliaPsychometrics/AbstractItemResponseModels.jl)

This package provides a generic interface for item response models in Julia. It is targeted 
at developers of item response model packages. Packages sucessfully implementing the 
`AbstractItemResponseModels.jl` interface will profit from features within `JuliaPsychometrics` 
such as plotting for their item response models (e.g. via [`ItemResponseRecipes.jl`](https://github.com/JuliaPsychometrics/ItemResponseRecipes.jl)).

## Interface
Creating a package using `AbstractItemResponseModels.jl` requires that

1. `AbstractItemResponseModels.jl` is added as a package dependency
2. the `AbstractItemResponseModels.jl` interface is implemented as described below
3. [optional] the interface tested (also described below)

### Types
`AbstractItemResponseModels.jl` offers a single abstract type defining an item response model. 

```julia
abstract type ItemResponseModel end
```

All concrete implementations of item response models must inherit from this abstract type, e.g.

```julia
struct MyFancyIRTModel <: ItemResponseModel end
```

### Traits
Item response models have traits attached to them allowing for flexible dispatch. 
`AbstractItemResponseModels.jl` defines a total of 4 such traits.

#### `ResponseType`
Each item response model must define its response type.
The response type sets the plausible values that the response data can take.

The available response types are:

```julia
abstract type Dichotomous <: ResponseType end
abstract type Nominal <: ResponseType end
abstract type Ordinal <: ResponseType end
abstract type Continuous <: ResponseType end
```

To define a response type for an item response model, implement the `response_type` function 
for your model such as

```julia
response_type(::Type{MyFancyIRTModel}) = Dichotomous
```

#### Dimensionality
An item response model defines the dimensionality of both item and person parameters. 
The dimensionality can be univariate or multivariate.

```julia
abstract type Univariate <: Dimensionality end
abstract type Multivariate <: Dimensionality end
```

Define the person and item dimensionality of your model by specifying the `person_dimensionality` 
and `item_dimensionality` function respectively.

```julia
person_dimensionality(::Type{MyFancyIRTModel}) = Multivariate
item_dimensionality(::Type{MyFancyIRTModel}) = Univariate
```

#### EstimationType
Defining an estimation type allows dispatching based on the type of parameter estimation in 
an item response model. `AbstractItemResponseModels.jl` differentiates between point estimation 
(e.g. Maximum Likelihood Estimation) and sampling based estimation such as Markov Chain Monte 
Carlo Methods).

```julia
abstract type PointEstimate <: EstimationType end
abstract type SamplingEstimate <: EstimationType end
```

The estimation type can be defined for a model via the `estimation_type` function.

```julia
estimation_type(::Type{MyFancyIRTModel}) = PointEstimate
```

### Functions
Implementing the `AbstractItemResponseModels.jl` interface requires defining methods for the 
generic functions provided in this package.

First a item response function must be provided by extending the `irf` generic function.

```julia
irf(model::ItemResponseModel, theta, i, y)
```

Further an item information function must be defined,

```julia
iif(model::ItemResponseModel, theta, i, y)
```

An item response model is fitted to data by a `fit` function,

```julia
fit(::Type{<:ItemResponseModel}, data, args...; kwargs...)
```

If applicable, an expected score function and an information function must be provided.

```julia
expected_score(model::ItemResponseModel, theta[, is, weights])
information(model::ItemResponseModel, theta[, is, weights])
```

## Interface Tests
`AbstractItemResponseModels.jl` provides standardized testing of the interface in a separate 
module `Tests`. 

To test if your implementation of the interface is correct, add the `test_interface` function 
to your `test/runtests.jl` file as in the example below.

```julia
using MyFancyIRTPackage
using Test
using AbstractItemResponseModels.Tests

@testset "MyFancyIRTPackage" begin
    test_interface(MyFancyIRTModel, args...; kwargs...) 
    # additional unit tests...
end
```

If you implement multiple models in your package, make sure to call `test_interface` for all
model types. An example of this can be seen in the [`RaschModels.jl`](https://github.com/JuliaPsychometrics/RaschModels.jl/blob/main/test/test_interface.jl) package.

Only item response theory packages that successfully pass the interface test for all models will be considered for `JuliaPsychometrics`.

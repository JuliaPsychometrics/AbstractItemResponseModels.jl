module AbstractItemResponseModels

import StatsAPI: fit, predict

export ItemResponseModel

export irf, iif
export expected_score, information
export fit, predict

export ResponseType, Dichotomous, Nominal, Ordinal, Continuous, response_type, checkresponsetype
export Dimensionality, Univariate, Multivariate, item_dimensionality, person_dimensionality
export EstimationType, PointEstimate, SamplingEstimate, estimation_type

"""
    ItemResponseModel

An abstract type representing an item response theory model.

Each implementation `T <: ItemResponseModel` must define the following traits:
- [`response_type`](@ref): A valid [`ResponseType`](@ref)
- [`person_dimensionality`](@ref): A valid [`Dimensionality`](@ref)
- [`item_dimensionality`](@ref): A valid [`Dimensionality`](@ref)
- [`estimation_type`](@ref): A valid [`EstimationType`](@ref)

Additionally `T <: ItemResponseModel` must implement the following interface:
- [`irf`](@ref): An item response function returning the probability that a person with
  given ability estimate will answer an item with a particular response.
- [`iif`](@ref): An item information function returning the information of answering with
  a particular response on an item given an ability estimate.
- [`fit`](@ref): A function fitting an item response model of type `T` to observed data.
- [`predict`](@ref): A function predicting future responses
"""
abstract type ItemResponseModel end

"""
    irf(model::ItemResponseModel, theta, i, y) -> Float64
    irf(model::ItemResponseModel, theta, i, y) -> Vector{Float64}

Evaluate the item response function of an [`ItemResponseModel`](@ref).

## Argument
- `model`: An [`ItemResponseModel`](@ref)
- `theta`: The person parameter value(s)
- `i`: A unique item identifier
- `y`: Response value(s)

## Return values
If `estimation_type(model) == PointEstimate` then the item response function must return
a scalar value.

If `estimation_type(model) == SamplingEstimate` then the item response function must return
a vector of values with the length equal to the number of samples.
"""
function irf end

"""
    iif(model::ItemResponseModel, theta, i, y) -> Float64
    iif(model::ItemResponseModel, theta, i, y) -> Vector{Float64}

## Argument
- `model`: An [`ItemResponseModel`](@ref)
- `theta`: The person parameter value(s)
- `i`: A unique item identifier
- `y`: Response value(s)

## Return values
If `estimation_type(model) == PointEstimate` then the item information function must return
a scalar value.

If `estimation_type(model) == SamplingEstimate` then the item information function must
return a vector of values with the length equal to the number of samples drawn.
"""
function iif end

"""
    expected_score(model::ItemResponseModel, theta; scoring_function) -> Float64
    expected_score(model::ItemResponseModel, theta; scoring_function) -> Vector{Float64}
    expected_score(model::ItemResponseModel, theta, is; scoring_function) -> Float64
    expected_score(model::ItemResponseModel, theta, is; scoring_function) -> Vector{Float64}

Calculate the expected score of an [`ItemResponseModel`](@ref).

## Arguments
- `model`: An [`ItemResponseModel`](@ref)
- `theta`: The person parameter value(s)
- `is`: One or multiple item identifiers. If `is` is omitted, the expected score for the
  whole test is returned.

## Keyword arguments
- `scoring_function`: A function mapping all possible response values `y` to arbitrary values.
  Must default to `identity`.

## Return values
If `estimation_type(model) == PointEstimate` then `expected_score` must return a single
scalar value.

If `estimation_type(model) == SamplingEstimate` then `expected_score` must return a vector
of values with the length equal to the number of samples drawn.
"""
function expected_score end

"""
    information(model::ItemResponseModel, theta; scoring_function) -> Float64
    information(model::ItemResponseModel, theta; scoring_function) -> Vector{Float64}
    information(model::ItemResponseModel, theta, is; scoring_function) -> Float64
    information(model::ItemResponseModel, theta, is; scoring_function) -> Vector{Float64}

Calculate the information of an [`ItemResponseModel`](@ref).

## Arguments
- `theta`: The person parameter value(s)
- `is`: One or multiple item identifiers. If `is` is omitted, the information of the whole
  test (test information) is returned.

## Keyword arguments
- `scoring_function`: A function mapping all possible response values `y` to arbitrary values.
  Must default to `identity`.

## Return values
If `estimatione_type(model) == PointEstimate` then `information` must return a single
scalar value.

If `estimation_type(model) == SamplingEstimate` then `information` musst return a vector
of values with the length equal to the number of samples drawn.
"""
function information end

"""
    fit(::Type{T}, data::AbstractMatrix, args...; kwargs...) where {T<:ItemResponseModel} -> T

Fit an item response model to response data.

## Arguments
- `data`: Observed data. If `data` is a response matrix, the columns must describe items and
  rows describe persons.
- `args...`: Additional arguments required to fit the [`ItemResponseModel`](@ref)

## Keyword arguments
- `kwargs...`: Additional keyword arguments required to fit the [`ItemResponseModel`](@ref)

## Return values
A fitted [`ItemResponseModel`](@ref).
"""
function fit end

"""
    predict(model::ItemResponseModel, args...; kwargs...)
"""
function predict end

include("traits.jl")
include("tests.jl")

end
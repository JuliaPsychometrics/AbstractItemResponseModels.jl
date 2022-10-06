module AbstractItemResponseModels

export ItemResponseModel

export irf, iif
export expected_score, information
export ResponseType, Dichotomous, Nominal, Ordinal, Continuous, checkresponsetype
export Dimensionality, Univariate, Multivariate
export EstimationType, PointEstimate, SamplingEstimate
export response_type, item_dimensionality, person_dimensionality, estimation_type

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

Evaluate the item response function of an [`ItemResponseModel`](@ref) given person parameter(s)
`theta` for response `y`.

The item is specified by an unique item identitfier `i`.

If `estimation_type(model) == PointEstimate` then the item response function must return
a scalar value.

If `estimation_type(model) == SamplingEstimate` then the item response function must return
a vector of values with the length equal to the number of samples.
"""
function irf end

"""
    iif(model::ItemResponseModel, theta, i, y) -> Float64
    iif(model::ItemResponseModel, theta, i, y) -> Vector{Float64}

Evaluate the item information function of an [`ItemResponseModel`](@ref) given person parameters(s)
`theta` for response `y`.

The item is specified by an unique item identifier `i`.

If `estimation_type(model) == PointEstimate` then the item information function must return
a scalar value.

If `estimation_type(model) == SamplingEstimate` then the item information function must
return a vector of values with the length equal to the number of samples drawn.
"""
function iif end

"""
    expected_score(model::ItemResponseModel, theta) -> Float64
    expected_score(model::ItemResponseModel, theta) -> Vector{Float64}
    expected_score(model::ItemResponseModel, theta, is) -> Float64
    expected_score(model::ItemResponseModel, theta, is) -> Vector{Float64}

Calculate the expected score of an [`ItemResponseModel`](@ref) given person parameter(s)
`theta` and optionally one or multiple item identifiers `is`.  If `is` is omitted, the
expected score of the whole test is returned.

If `estimation_type(model) == PointEstimate` then `expected_score` must return a single
scalar value.

If `estimation_type(model) == SamplingEstimate` then `expected_score` must return a vector
of values with the length equal to the number of samples drawn.
"""
function expected_score end
function information end

"""
    fit(::Type{<:ItemResponseModel}, data::AbstractMatrix[, alg])

Fit an item response model to response data.

If `data` is a response matrix, the columns must describe items and rows describe persons.
"""
function fit end

"""
    predict(model::ItemResponseModel, )
"""
function predict end

include("traits.jl")
include("tests.jl")

end

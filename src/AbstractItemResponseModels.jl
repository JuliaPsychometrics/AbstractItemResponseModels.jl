module AbstractItemResponseModels

export ItemResponseModel

export irf, iif
export expected_score, information
export ResponseType, Dichotomous, Nominal, Ordinal, Continuous, checkresponsetype
export Dimensionality, Univariate, Multivariate
export EstimationType, PointEstimate, SamplingEstimate
export response_type, item_dimensionality, person_dimensionality, estimation_type

"""

"""
abstract type ItemResponseModel end

"""
    irf(model::ItemResponseModel, theta, i, y)

Evaluate the item response function of an [`ItemResponseModel`](@ref) given person parameter(s)
`theta` for response `y`.
"""
function irf end
function iif end

"""
    expected_score(model::ItemResponseModel, theta) -> Float64
    expected_score(model::ItemResponseModel, theta, is) -> Float64

Calculate the expected score of an [`ItemResponseModel`](@ref) given person parameter(s)
`theta`.

If `isfitted(model) == false` then the expected score can only be calculated given expilict
item parameter(s) `beta`.

If `isfitted(model) == true` then expected scores can also be calculated for one or multiple
items by specifying one or multiple unique item indices `is`.
For models where `item_dimensionality(model) == Univariate`, `is` is either an `Int` (for
a single item) or `Vector{Int}` (for multiple items).
For models where `item_dimensionality(model) == Multivariate`, `is` is either a `Vector{Int}`
(for a single item) or `Vector{Vector{Int}}` (for multiple items).

In either case `expected_score` returns a single value.
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
"""
function predict end

include("traits.jl")
include("tests.jl")

end

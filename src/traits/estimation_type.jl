"""
    EstimationType

The `EstimationType` of an [`ItemResponseModel`](@ref) describes the type of parameter
estimation for the model.
"""
abstract type EstimationType end

"""
    PointEstimate <: EstimationType

Defines that the parameters of an [`ItemResponseModel`](@ref) are estimated by a single
point estimate. Thus, parameters for a model with `estimation_type(model) == PointEstimate`
are single real-valued numbers.
"""
abstract type PointEstimate <: EstimationType end

"""
    SamplingEstimate <: EstimationType

Defines that the parameters of an [`ItemResponseModel`](@ref) are estimated by a sampling
procedure. Thus, parameters for a model with `estimation_type(model) == SamplingEstimate`
are vectors of real-valued numbers where the length of the parameter vector is equal to the
number of samples drawn.
"""
abstract type SamplingEstimate <: EstimationType end

"""
    DistributionEstimate <: EstimationType

Defines that the parameters of an [`ItemResponseModel`](@ref) are estimated by a distribution.
Thus, parameters for a model with `estimation_type(model) == DistributionEstimate` are
probability distributions that implement common interface functions for distributions, e.g.
`rand`, `mean`, or `quantile`.
"""
abstract type DistributionEstimate <: EstimationType end

"""
    estimation_type(model::ItemResponseModel)

Return the [`EstimationType`](@ref) of an [`ItemResponseModel`].
"""
estimation_type(::T) where {T} = estimation_type(T)
estimation_type(T::Type) = throw(MethodError(estimation_type, (T,)))

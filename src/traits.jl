"""
    ResponseType

The `ResponseType` defines the scale level of item responses for a given [`ItemResponseModel`](@ref).
"""
abstract type ResponseType end

"""
    response_type(::T) -> ResponseType

Return the [`ResponseType`](@ref) of the [`ItemResponseModel`](@ref).
"""
response_type(::T) where {T} = response_type(T)
response_type(T::Type) = throw(MethodError(response_type, (T,)))

"""
    checkresponsetype(::T, arr) where {T<:ResponseType}

Check if the responses in `arr` are valid for [`ResponseType`](@ref) `T`.

If all responses are valid, `nothing` is returned.

If any invalid responses are found, a `DomainError` is thrown.
"""
checkresponsetype(::T, arr) where {T<:ResponseType} = checkresponsetype(T, arr)

"""
    Dichotomous <: ResponseType

Defines that an `ItemResponseModel` has a binary response variable.
"""
abstract type Dichotomous <: ResponseType end

function checkresponsetype(::Type{Dichotomous}, arr)
    for y in arr
        y in 0:1 || throw(DomainError(y, "Dichotomous response type only allows zero or one responses."))
    end
    return nothing
end

"""
    Nominal <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has an unordered categorical response variable.
"""
abstract type Nominal <: ResponseType end

checkresponsetype(T::Type{Nominal}, arr) = _checkcategorical(T, arr)

"""
    Ordinal <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has an ordered categorical response variable.
"""
abstract type Ordinal <: ResponseType end

checkresponsetype(T::Type{Ordinal}, arr) = _checkcategorical(T, arr)

function _checkcategorical(T, arr)
    for y in arr
        (y > 0 && rem(y, 1) == 0) || throw(DomainError(y, "$T response type only allows integer responses > 0."))
    end
    return nothing
end

"""
    Continous <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has a continous response variable.
"""
abstract type Continuous <: ResponseType end

function checkresponsetype(::Type{Continuous}, arr)
    for y in arr
        y isa Real || throw(DomainError(y, "Continous response scale only allows for real valued responses."))
    end
    return nothing
end

"""
    Dimensionality

The `Dimensionality` of an [`ItemResponseModel`](@ref) defines whether or not the person
and/or item parameters of the model are unidimensional or multidimensional.
"""
abstract type Dimensionality end

"""
    item_dimensionality(::T) -> Dimensionality

Return the [`Dimensionality`](@ref) of the item parameters of an [`ItemResponseModel`](@ref).
"""
item_dimensionality(::T) where {T} = item_dimensionality(T)
item_dimensionality(T::Type) = throw(MethodError(item_dimensionality, (T,)))

"""
    item_dimensionality(::T) -> Dimensionality

Return the [`Dimensionality`](@ref) of the person parameters of an [`ItemResponseModel`](@ref).
"""
person_dimensionality(::T) where {T} = person_dimensionality(T)
person_dimensionality(T::Type) = throw(MethodError(person_dimensionality, (T,)))

"""
    Univariate <: Dimensionality

Defines that an [`ItemResponseModel`](@ref) has scalar valued parameters.
"""
abstract type Univariate <: Dimensionality end

"""
    Multivariate <: Dimensionality

Defines that an [`ItemResponseModel`](@ref) has vector valued parameters.
"""
abstract type Multivariate <: Dimensionality end

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
    estimation_type(::T) -> EstimationType

Return the [`EstimationType`](@ref) of an [`ItemResponseModel`].
"""
estimation_type(::T) where {T} = estimation_type(T)
estimation_type(T::Type) = throw(MethodError(estimation_type, (T,)))

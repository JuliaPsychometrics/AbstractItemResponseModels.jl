"""
    ResponseType

The `ResponseType` defines the scale level of item responses for a given [`ItemResponseModel`](@ref).
"""
abstract type ResponseType end

"""
    response_type(::T)::ResponseType

Return the [`ResponseType`](@ref) of an [`ItemResponseModel`](@ref).
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

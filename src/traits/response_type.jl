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
    check_response_type(::T, itr) where {T<:ResponseType}

Check if the responses in `itr` are valid for [`ResponseType`](@ref) `T`.

If all responses are valid, `nothing` is returned.

If any invalid responses are found, a `DomainError` is thrown.
"""
check_response_type(::T, itr) where {T<:ResponseType} = check_response_type(T, itr)
check_response_type(model::Type{<:ItemResponseModel}, itr) = check_response_type(response_type(model), itr)

"""
    Dichotomous <: ResponseType

Defines that an `ItemResponseModel` has a binary response variable.
"""
abstract type Dichotomous <: ResponseType end

function check_response_type(::Type{Dichotomous}, itr)
    for y in itr
        y in 0:1 || throw(DomainError(y, "Dichotomous response type only allows zero or one responses."))
    end
    return nothing
end

"""
    Nominal <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has an unordered categorical response variable.
"""
abstract type Nominal <: ResponseType end

check_response_type(T::Type{Nominal}, itr) = _checkcategorical(T, itr)

"""
    Ordinal <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has an ordered categorical response variable.
"""
abstract type Ordinal <: ResponseType end

check_response_type(T::Type{Ordinal}, itr) = _checkcategorical(T, itr)

function _checkcategorical(T, itr)
    for y in itr
        (y > 0 && rem(y, 1) == 0) || throw(DomainError(y, "$T response type only allows integer responses > 0."))
    end
    return nothing
end

"""
    Continous <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has a continous response variable.
"""
abstract type Continuous <: ResponseType end

function check_response_type(::Type{Continuous}, itr)
    for y in itr
        y isa Real || throw(DomainError(y, "Continous response scale only allows for real valued responses."))
    end
    return nothing
end

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
function check_response_type(::T, itr) where {T<:ResponseType}
    for y in itr
        check_response_type(T, y)
    end
    return nothing
end

function check_response_type(model::Type{<:ItemResponseModel}, itr)
    return check_response_type(response_type(model), itr)
end

"""
    Dichotomous <: ResponseType

Defines that an `ItemResponseModel` has a binary response variable.
"""
abstract type Dichotomous <: ResponseType end

function check_response_type(::Type{Dichotomous}, y::Number)
    err = DomainError(y, "Dichotomous response type only allows zero or one responses.")
    y in 0:1 || throw(err)
    return nothing
end

"""
    Nominal <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has an unordered categorical response variable.
"""
abstract type Nominal <: ResponseType end

check_response_type(T::Type{Nominal}, y::Number) = check_categorical(T, y)

"""
    Ordinal <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has an ordered categorical response variable.
"""
abstract type Ordinal <: ResponseType end

check_response_type(T::Type{Ordinal}, y::Number) = check_categorical(T, y)

function check_categorical(T, y::Number)
    err = DomainError(y, "$T response type only allows integer responses > 0.")
    (y > 0 && rem(y, 1) == 0) || throw(err)
    return nothing
end

"""
    Continous <: ResponseType

Defines that an [`ItemResponseModel`](@ref) has a continous response variable.
"""
abstract type Continuous <: ResponseType end

function check_response_type(::Type{Continuous}, y::Number)
    err = DomainError(y, "Continous response scale only allows for real valued responses.")
    y isa Real || throw(err)
    return nothing
end

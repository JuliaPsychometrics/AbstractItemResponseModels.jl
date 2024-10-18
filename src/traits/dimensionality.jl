"""
    Dimensionality

The `Dimensionality` of an [`ItemResponseModel`](@ref) defines whether or not the person
and/or item parameters of the model are unidimensional or multidimensional.
"""
abstract type Dimensionality end

"""
    item_dimensionality(model::ItemResponseModel)

Return the [`Dimensionality`](@ref) of the item parameters of an [`ItemResponseModel`](@ref).
"""
item_dimensionality(::T) where {T} = item_dimensionality(T)
item_dimensionality(T::Type) = throw(MethodError(item_dimensionality, (T,)))

"""
    person_dimensionality(model::ItemResponseModel)

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

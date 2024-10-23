"""
    Dimensionality

The `Dimensionality` of an [`ItemResponseModel`](@ref) defines whether or not the person
and/or item parameters of the model are unidimensional or multidimensional.
"""
abstract type Dimensionality end

"""
    item_dimensionality(::T)::Int

Return the [`Dimensionality`](@ref) of the item parameters of an [`ItemResponseModel`](@ref).
"""
item_dimensionality(::T) where {T} = item_dimensionality(T)
item_dimensionality(T::Type) = throw(MethodError(item_dimensionality, (T,)))

"""
    item_dimensionality(::T)::Int

Return the [`Dimensionality`](@ref) of the person parameters of an [`ItemResponseModel`](@ref).
"""
person_dimensionality(::T) where {T} = person_dimensionality(T)
person_dimensionality(T::Type) = throw(MethodError(person_dimensionality, (T,)))

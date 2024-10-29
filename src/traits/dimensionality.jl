"""
    dimensionality

Return a tuple of the dimensions for an [`ItemResponseModel`](@ref) where the first element
corresponds to the person dimensionality and the second element to the item dimensionality.
"""
dimensionality(::T) where {T} = dimensionality(T)
dimensionality(T::Type) = (person_dimensionality(T), item_dimensionality(T))

"""
    item_dimensionality(model::ItemResponseModel)

Return the number of dimensions for the item parameters of an [`ItemResponseModel`](@ref) as
an integer.
"""
item_dimensionality(::T) where {T} = item_dimensionality(T)
item_dimensionality(T::Type) = throw(MethodError(item_dimensionality, (T,)))

"""
    person_dimensionality(model::ItemResponseModel)

Return the number of dimensions for the person parameters of an [`ItemResponseModel`](@ref)
as an integer.
"""
person_dimensionality(::T) where {T} = person_dimensionality(T)
person_dimensionality(T::Type) = throw(MethodError(person_dimensionality, (T,)))

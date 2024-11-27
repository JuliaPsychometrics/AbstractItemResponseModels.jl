module Tests

import AbstractItemResponseModels:
    response_type,
    item_dimensionality,
    person_dimensionality,
    estimation_type,
    fit,
    irf,
    iif,
    expected_score,
    information,
    get_item_locations,
    get_person_locations,
    each_item_index,
    each_person_index

using AbstractItemResponseModels
using Test

export FakeIRM
export test_interface

"""
    test_interface(T::Type{<:ItemResponseModel}, data, args...; kwargs...)

Test the implementation of an item response model interface.

## Arguments
- `T`: The implemented model type
- `data`: observed data
- `args...`: Additional arguments passed to `fit`

## Keyword arguments
- `kwargs...`: Additional keyword arguments passed to `fit`
"""
function test_interface(T::Type{<:ItemResponseModel}, data, args...; kwargs...)
    @testset "AbstractItemResponseModels.jl API Tests" begin
        model = fit(T, data, args...; kwargs...)

        test_types(model)
        test_traits(model)
        test_interface(model)
    end
end

function test_types(model)
    @testset "Types" begin
        @test model isa ItemResponseModel
    end
end

function test_traits(model::ItemResponseModel)
    @testset "Traits" begin
        @test response_type(model) <: ResponseType

        @test estimation_type(model) <: EstimationType

        @test item_dimensionality(model) isa Int
        @test item_dimensionality(model) > 0

        @test person_dimensionality(model) isa Int
        @test person_dimensionality(model) > 0
    end
end

function test_interface(model::ItemResponseModel)
    @testset "Interface" begin
        test_irf(model)
        test_iif(model)
        test_expected_score(model)
        test_information(model)
        test_getters(model)
        # test_iterators(model)
    end
end

function test_irf(model::ItemResponseModel)
    @testset "irf" begin
        rt = response_type(model)
        pdim = person_dimensionality(model)
        idim = item_dimensionality(model)
        et = estimation_type(model)
        return test_irf(rt, pdim, idim, et, model)
    end
end

function test_irf(rt::Type{Dichotomous}, pdim, idim, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test irf(model, theta, 1, 0) isa out_type(et)
    @test irf(model, theta, 1, 1) isa out_type(et)
    @test_throws DomainError irf(model, theta, 1, -1)
    @test_throws DomainError irf(model, theta, 1, 2)
    @test_throws DomainError irf(model, theta, 1, 1.1)
end

function test_irf(
    rt::Type{<:Union{Nominal,Ordinal}},
    pdim,
    idim,
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    @test irf(model, theta, 1, 1) isa out_type(et)
    @test irf(model, theta, 1, 2.0) isa out_type(et)
    @test_throws DomainError irf(model, theta, 1, -1)
    @test_throws DomainError irf(model, theta, 1, 0)
    @test_throws DomainError irf(model, theta, 1, 1.1)
end

function test_irf(rt::Type{Continuous}, pdim, idim, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test irf(model, theta, 1, 0.0) isa out_type(et)
    @test irf(model, theta, 1, -1.0) isa out_type(et)
    @test irf(model, theta, 1, 2.3) isa out_type(et)
    @test_throws DomainError irf(model, theta, 1, 1im)
end

function test_iif(model::ItemResponseModel)
    @testset "iif" begin
        rt = response_type(model)
        pdim = person_dimensionality(model)
        idim = item_dimensionality(model)
        et = estimation_type(model)
        return test_iif(rt, pdim, idim, et, model)
    end
end

function test_iif(rt::Type{Dichotomous}, pdim, idim, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 0.0) isa out_type(et)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 0.5)
    @test_throws DomainError iif(model, theta, 1, 2.0)
end

function test_iif(
    rt::Type{<:Union{Nominal,Ordinal}},
    pdim,
    idim,
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test iif(model, theta, 1, 2.0) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 2.5) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 0) isa out_type(et)
end

function test_iif(rt::Type{Continuous}, pdim, idim, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test iif(model, theta, 1, -2.0) isa out_type(et)
    @test iif(model, theta, 1, 3.5) isa out_type(et)
    @test_throws Exception iif(model, theta, 1, 1im)
    @test_throws Exception iif(model, theta, 1, (0, 1))
end

function test_expected_score(model::ItemResponseModel)
    @testset "expected_score" begin
        rt = response_type(model)
        pdim = person_dimensionality(model)
        idim = item_dimensionality(model)
        et = estimation_type(model)
        return test_expected_score(rt, pdim, idim, et, model)
    end
end

function test_expected_score(
    rt::Type{<:ResponseType},
    pdim,
    idim,
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    item = first(each_item_index(model))
    @test expected_score(model, theta) isa out_type(et)
    @test expected_score(model, theta, item) isa out_type(et)
    @test expected_score(model, theta, each_item_index(model)) isa out_type(et)
    @test expected_score(model, theta) ==
          expected_score(model, theta, each_item_index(model))
end

function test_information(model::ItemResponseModel)
    @testset "information" begin
        rt = response_type(model)
        pdim = person_dimensionality(model)
        idim = item_dimensionality(model)
        et = estimation_type(model)
        return test_information(rt, pdim, idim, et, model)
    end
end

function test_information(
    rt::Type{<:ResponseType},
    pdim,
    idim,
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    item = first(each_item_index(model))
    @test information(model, theta) isa out_type(et)
    @test information(model, theta, item) isa out_type(et)
    @test information(model, theta, each_item_index(model)) isa out_type(et)
    @test information(model, theta) == information(model, theta, each_item_index(model))
end

function test_getters(model)
    et = estimation_type(model)
    pdim = person_dimensionality(model)
    idim = item_dimensionality(model)

    @testset "getters" begin
        @testset "get_item_locations" begin
            @test applicable(get_item_locations, model, first(each_item_index(model)))
        end
        @testset "get_person_locations" begin
            @test applicable(get_person_locations, model, first(each_person_index(model)))
        end
    end
end

function test_iterators(model)
    @testset "Iterators" begin
        @testset "each_item_index" begin end
        @testset "each_person_index" begin end
    end
end

sim_theta(n) = n == 1 ? zero(Float64) : zeros(Float64, n)

# allowed output types for irf, iif, expected_score and information
out_type(::Type{PointEstimate}) = Real
out_type(::Type{SamplingEstimate}) = AbstractVector{<:Real}

"""
    FakeIRM{RT<:ResponseType,PD<:Dimensionality,ID<:Dimensionality}

A minimal implementation of [`ItemResponseModel`](@ref) for interface testing.
"""
struct FakeIRM{RT<:ResponseType,ID,PD,ET<:EstimationType} <: ItemResponseModel
    betas::Vector{Float64}
    thetas::Vector{Float64}
    function FakeIRM{RT,ID,PD,ET}(
        betas::AbstractVector,
        thetas::AbstractVector,
    ) where {RT,ID,PD,ET}
        return new{RT,ID,PD,ET}(betas, thetas)
    end
end

function FakeIRM{RT,ID,PD,ET}(data::AbstractMatrix) where {RT,ID,PD,ET}
    betas = randn(size(data, 2))
    thetas = randn(size(data, 1))
    return FakeIRM{RT,ID,PD,ET}(betas, thetas)
end

response_type(::Type{<:FakeIRM{RT,ID,PD,ET}}) where {RT,ID,PD,ET} = RT
item_dimensionality(::Type{<:FakeIRM{RT,ID,PD,ET}}) where {RT,ID,PD,ET} = ID
person_dimensionality(::Type{<:FakeIRM{RT,ID,PD,ET}}) where {RT,ID,PD,ET} = PD
estimation_type(::Type{<:FakeIRM{RT,ID,PD,ET}}) where {RT,ID,PD,ET} = ET

# methods
function irf(model::FakeIRM{RT,ID,PD,PointEstimate}, theta, i, y) where {RT,ID,PD}
    check_response_type(RT, y)
    return 0.0
end

function irf(model::FakeIRM{RT,ID,PD,SamplingEstimate}, theta, i, y) where {RT,ID,PD}
    check_response_type(RT, y)
    return fill(0.0, 10)
end

function iif(model::FakeIRM{RT,ID,PD,PointEstimate}, theta, i, y) where {RT,ID,PD}
    check_response_type(RT, y)
    return 1.0
end

function iif(model::FakeIRM{RT,ID,PD,SamplingEstimate}, theta, i, y) where {RT,ID,PD}
    check_response_type(RT, y)
    return ones(Float64, 10)
end

sf(x, _) = x

function expected_score(
    model::FakeIRM{RT,ID,PD,PointEstimate},
    theta,
    is;
    scoring_function = sf,
) where {RT,ID,PD}
    return 0.0
end

function expected_score(
    model::FakeIRM{RT,ID,PD,SamplingEstimate},
    theta,
    is;
    scoring_function = sf,
) where {RT,ID,PD}
    return zeros(Float64, 10)
end

function information(
    model::FakeIRM{RT,ID,PD,PointEstimate},
    theta,
    is;
    scoring_function = sf,
) where {RT,ID,PD}
    return 1.0
end

function information(
    model::FakeIRM{RT,ID,PD,SamplingEstimate},
    theta,
    is;
    scoring_function = sf,
) where {RT,ID,PD}
    return ones(Float64, 10)
end

function fit(::Type{FakeIRM{RT,ID,PD,ET}}, data::AbstractMatrix) where {RT,ID,PD,ET}
    return FakeIRM{RT,ID,PD,ET}(data)
end

function get_item_locations(model::FakeIRM, i)
    return 0.0
end

function get_person_locations(model::FakeIRM, p)
    return 0.0
end

each_item_index(model::FakeIRM) = eachindex(model.betas)
each_person_index(model::FakeIRM) = eachindex(model.thetas)

end

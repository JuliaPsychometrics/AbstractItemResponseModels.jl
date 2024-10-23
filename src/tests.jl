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
    FakeIRM{RT<:ResponseType,PD<:Dimensionality,ID<:Dimensionality}

A minimal implementation of [`ItemReponseModel`](@ref) for interface testing.
"""
struct FakeIRM{RT<:ResponseType,ET<:EstimationType} <: ItemResponseModel
    betas::Vector{Float64}
    thetas::Vector{Float64}
    function FakeIRM{RT,ET}(betas::AbstractVector, thetas::AbstractVector) where {RT,ET}
        return new{RT,ET}(betas, thetas)
    end
end

function FakeIRM{RT,ET}(data::AbstractMatrix) where {RT,ET}
    betas = randn(size(data, 2))
    return FakeIRM{RT,ET}(betas)
end

response_type(::Type{<:FakeIRM{RT,ET}}) where {RT,ET} = RT
item_dimensionality(::Type{<:FakeIRM{RT,ET}}) where {RT,ET} = 1
person_dimensionality(::Type{<:FakeIRM{RT,ET}}) where {RT,ET} = 1
estimation_type(::Type{<:FakeIRM{RT,ET}}) where {RT,ET} = ET

# methods
function irf(model::FakeIRM{RT,PointEstimate}, theta, i, y) where {RT}
    check_response_type(RT, y)
    return 0.0
end

function irf(model::FakeIRM{RT,SamplingEstimate}, theta, i, y) where {RT}
    check_response_type(RT, y)
    return fill(0.0, 10)
end

function iif(model::FakeIRM{RT,PointEstimate}, theta, i, y) where {RT}
    check_response_type(RT, y)
    return 1.0
end

function iif(model::FakeIRM{RT,SamplingEstimate}, theta, i, y) where {RT}
    check_response_type(RT, y)
    return fill(1.0, 10)
end

sf(x, _) = x

function expected_score(
    model::FakeIRM{<:ResponseType,PointEstimate},
    theta,
    is;
    scoring_function = sf,
)
    return scoring_function(0.0, nothing)
end

function expected_score(
    model::FakeIRM{<:ResponseType,SamplingEstimate},
    theta,
    is;
    scoring_function = sf,
)
    return scoring_function.(fill(0.0, 10), nothing)
end

function information(
    model::FakeIRM{<:ResponseType,PointEstimate},
    theta,
    is;
    scoring_function = sf,
)
    return scoring_function(0.0, nothing)
end

function information(
    model::FakeIRM{<:ResponseType,SamplingEstimate},
    theta,
    is;
    scoring_function = sf,
) where {RT}
    return scoring_function.(fill(0.0, 10), nothing)
end

function fit(::Type{FakeIRM{RT,ET}}, data::AbstractMatrix) where {RT,ET}
    return FakeIRM{RT,ET}(data)
end

function get_item_locations(model::FakeIRM{RT,PointEstimate}, i, y) where {RT,PD}
    return 0.0
end

function get_item_locations(model::FakeIRM{RT,PD,Univariate,PointEstimate}, i) where {RT,PD}
    return zeros(3)
end

function get_item_locations(
    model::FakeIRM{RT,PD,Multivariate,PointEstimate},
    i,
    y,
) where {RT,PD}
    return zeros(2)
end

function get_item_locations(
    model::FakeIRM{RT,PD,Multivariate,PointEstimate},
    i,
) where {RT,PD}
    return [zeros(2) for _ in 1:2]
end

function get_item_locations(
    model::FakeIRM{RT,PD,Univariate,SamplingEstimate},
    i,
    y,
) where {RT,PD}
    return zeros(10)
end

function get_item_locations(
    model::FakeIRM{RT,PD,Multivariate,SamplingEstimate},
    i,
    y,
) where {RT,PD}
    return zeros(10, 2)
end

function get_person_locations(
    model::FakeIRM{RT,Univariate,ID,PointEstimate},
    i,
) where {RT,ID}
    return 0.0
end

function get_person_locations(
    model::FakeIRM{RT,Multivariate,ID,PointEstimate},
    i,
) where {RT,ID}
    return zeros(2)
end

function get_person_locations(
    model::FakeIRM{RT,Univariate,ID,SamplingEstimate},
    i,
) where {RT,ID}
    return zeros(10)
end

function get_person_locations(
    model::FakeIRM{RT,Multivariate,ID,SamplingEstimate},
    i,
) where {RT,ID}
    return zeros(10, 2)
end

each_item_index(model::FakeIRM) = eachindex(model.betas)
each_person_index(model::FakeIRM) = eachindex(model.thetas)

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
        @test model isa ItemResponseModel
        @test model isa T

        test_traits(model)
        test_methods(model)

        @testset "Interface" begin
            test_irf(model)
            test_iif(model)
            test_expected_score(model)
            test_information(model)
            test_getters(model)
        end
    end
end

function test_traits(model::ItemResponseModel)
    @testset "Traits" begin
        @test response_type(model) <: ResponseType
        @test item_dimensionality(model) isa Int
        @test person_dimensionality(model) isa Int
    end
end

function test_methods(model::ItemResponseModel)
    @testset "Methods" begin
        test_irf(model)
        test_iif(model)
        test_expected_score(model)
        test_information(model)
        test_getters(model)
        test_iterators(model)
    end
end

function test_irf(model::ItemResponseModel)
    @testset "irf" begin
        rt = response_type(model)
        et = estimation_type(model)
        return test_irf(rt, pdim, idim, et, model)
    end
end

function test_irf(
    rt::Type{Dichotomous},
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    @test irf(model, theta, 1, 0) isa out_type(et)
    @test irf(model, theta, 1, 1) isa out_type(et)
    @test_throws DomainError irf(model, theta, 1, -1)
    @test_throws DomainError irf(model, theta, 1, 2)
    @test_throws DomainError irf(model, theta, 1, 1.1)
end

function test_irf(
    rt::Type{<:Union{Nominal,Ordinal}},
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
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

function test_irf(
    rt::Type{Continuous},
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
    et::Type{<:EstimationType},
    model,
)
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

function test_iif(
    rt::Type{Dichotomous},
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 0.0) isa out_type(et)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 0.5)
    @test_throws DomainError iif(model, theta, 1, 2.0)
end

function test_iif(
    rt::Type{<:Union{Nominal,Ordinal}},
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test iif(model, theta, 1, 2.0) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 2.5) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 0) isa out_type(et)
end

function test_iif(
    rt::Type{Continuous},
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
    et::Type{<:EstimationType},
    model,
)
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
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    @test expected_score(model, theta) isa out_type(et)
    @test expected_score(model, theta, 1) isa out_type(et)

    @test expected_score(model, theta) ==
          expected_score(model, theta, each_item_index(model))

    # check default scoring function implementation
    @test expected_score(model, theta; scoring_function = sf) ==
          expected_score(model, theta)
    @test expected_score(model, theta, 1; scoring_function = sf) ==
          expected_score(model, theta, 1)
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
    pdim::Type{<:Dimensionality},
    idim::Type{<:Dimensionality},
    et::Type{<:EstimationType},
    model,
)
    theta = sim_theta(pdim)
    @test information(model, theta) isa out_type(et)
    @test information(model, theta, 1) isa out_type(et)

    # check default scoring function implementation
    @test information(model, theta; scoring_function = sf) == information(model, theta)
    @test information(model, theta, 1; scoring_function = sf) ==
          information(model, theta, 1)
end

function test_getters(model)
    et = estimation_type(model)
    pdim = person_dimensionality(model)
    idim = item_dimensionality(model)

    @testset "getters" begin
        @testset "get_item_locations" begin
            @test get_item_locations(model, 1, 1) isa out_type(et, idim)
        end
        @testset "get_person_locations" begin
            @test get_person_locations(model, 1) isa out_type(et, pdim)
        end
    end
end

function test_iterators(model)
    @testset "Iterators" begin
        @testset "each_item_index" begin end
        @testset "each_person_index" begin end
    end
end

sim_theta(::Type{Univariate}) = 0.0
sim_theta(::Type{Multivariate}) = [0.0, 0.0]

out_type(::Type{PointEstimate}) = Real
out_type(::Type{SamplingEstimate}) = AbstractVector{<:Real}

out_type(::Type{PointEstimate}, ::Type{Univariate}) = Real
out_type(::Type{PointEstimate}, ::Type{Multivariate}) = AbstractVector{<:Real}
out_type(::Type{SamplingEstimate}, ::Type{Univariate}) = AbstractVector{<:Real}
out_type(::Type{SamplingEstimate}, ::Type{Multivariate}) = AbstractMatrix{<:Real}

end

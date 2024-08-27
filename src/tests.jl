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
    get_person_locations

using AbstractItemResponseModels
using Test

export FakeIRM
export test_interface

"""
    FakeIRM{RT<:ResponseType,PD<:Dimensionality,ID<:Dimensionality}

A minimal implementation of [`ItemReponseModel`](@ref) for interface testing.
"""
struct FakeIRM{RT<:ResponseType,PD<:Dimensionality,ID<:Dimensionality,ET<:EstimationType} <:
       ItemResponseModel
    betas::Vector{Float64}
    function FakeIRM{RT,PD,ID,ET}(betas::AbstractVector) where {RT,PD,ID,ET}
        return new{RT,PD,ID,ET}(betas)
    end
end

function FakeIRM{RT,PD,ID,ET}(data::AbstractMatrix) where {RT,PD,ID,ET}
    betas = randn(size(data, 2))
    return FakeIRM{RT,PD,ID,ET}(betas)
end

response_type(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = RT
item_dimensionality(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = ID
person_dimensionality(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = PD
estimation_type(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = ET

# methods
function irf(model::FakeIRM{RT,PD,ID,PointEstimate}, theta, i, y::Real) where {RT,PD,ID}
    check_response_type(RT, y)
    return 0.0
end

function irf(model::FakeIRM{RT,PD,ID,SamplingEstimate}, theta, i, y::Real) where {RT,PD,ID}
    check_response_type(RT, y)
    nsamples = 10
    return fill(0.0, nsamples)
end

function iif(model::FakeIRM{RT,PD,ID,PointEstimate}, theta, i, y::Real) where {RT,PD,ID}
    check_response_type(RT, y)
    return 1.0
end

function iif(model::FakeIRM{RT,PD,ID,SamplingEstimate}, theta, i, y::Real) where {RT,PD,ID}
    check_response_type(RT, y)
    nsamples = 10
    return fill(1.0, nsamples)
end

function expected_score(
    model::FakeIRM{RT,PD,ID,PointEstimate},
    theta,
    is = nothing;
    scoring_function = identity,
) where {RT,PD,ID}
    return scoring_function(0.0)
end

function expected_score(
    model::FakeIRM{RT,PD,ID,SamplingEstimate},
    theta,
    is = nothing;
    scoring_function = identity,
) where {RT,PD,ID}
    return scoring_function.(fill(0.0, 10))
end

function information(
    model::FakeIRM{RT,PD,ID,PointEstimate},
    theta,
    is = nothing;
    scoring_function = identity,
) where {RT,PD,ID}
    return scoring_function(0.0)
end

function information(
    model::FakeIRM{RT,PD,ID,SamplingEstimate},
    theta,
    is = nothing;
    scoring_function = identity,
) where {RT,PD,ID}
    return scoring_function.(fill(0.0, 10))
end

function fit(::Type{FakeIRM{RT,PD,ID,ET}}, data::AbstractMatrix) where {RT,PD,ID,ET}
    return FakeIRM{RT,PD,ID,ET}(data)
end

function get_item_locations(
    model::FakeIRM{RT,PD,Univariate,PointEstimate},
    i,
    y,
) where {RT,PD}
    return 0.0
end

function get_item_locations(
    model::FakeIRM{RT,PD,Multivariate,PointEstimate},
    i,
    y,
) where {RT,PD}
    return zeros(2)
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

function get_person_locations(model::FakeIRM{RT,Univariate,ID,PointEstimate}, i) where {RT,ID}
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

        @testset "Interface" begin
            test_irf(model)
            test_iif(model)
            test_expected_score(model)
            test_information(model)
            test_getters(model)
        end
    end
end

function test_traits(model)
    @testset "Traits" begin
        @test response_type(model) <: ResponseType
        @test item_dimensionality(model) <: Dimensionality
        @test person_dimensionality(model) <: Dimensionality
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
    @test_throws Exception irf(model, theta, 1, 1im)
    @test_throws Exception irf(model, theta, 1, (0, 1))
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
    @test expected_score(model, theta; scoring_function = identity) ==
          expected_score(model, theta)
    @test expected_score(model, theta, 1; scoring_function = identity) ==
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
    @test information(model, theta; scoring_function = identity) ==
          information(model, theta)
    @test information(model, theta, 1; scoring_function = identity) ==
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

sim_theta(::Type{Univariate}) = 0.0
sim_theta(::Type{Multivariate}) = [0.0, 0.0]

out_type(::Type{PointEstimate}) = Real
out_type(::Type{SamplingEstimate}) = AbstractVector{<:Real}

out_type(::Type{PointEstimate}, ::Type{Univariate}) = Real
out_type(::Type{PointEstimate}, ::Type{Multivariate}) = AbstractVector{<:Real}
out_type(::Type{SamplingEstimate}, ::Type{Univariate}) = AbstractVector{<:Real}
out_type(::Type{SamplingEstimate}, ::Type{Multivariate}) = AbstractMatrix{<:Real}

end

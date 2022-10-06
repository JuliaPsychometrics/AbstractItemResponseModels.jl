module Tests

using AbstractItemResponseModels
using StatsBase
using Test

export FakeIRM
export test_interface

"""
    FakeIRM{RT<:ResponseType,PD<:Dimensionality,ID<:Dimensionality}

A minimal implementation of [`ItemReponseModel`](@ref) for interface testing.
"""
struct FakeIRM{RT<:ResponseType,PD<:Dimensionality,ID<:Dimensionality,ET<:EstimationType} <: ItemResponseModel
    betas::Vector{Float64}
    function FakeIRM{RT,PD,ID,ET}(betas::AbstractVector) where {RT,PD,ID,ET}
        return new{RT,PD,ID,ET}(betas)
    end
end

function FakeIRM{RT,PD,ID,ET}(data::AbstractMatrix) where {RT,PD,ID,ET}
    betas = randn(size(data, 2))
    return FakeIRM{RT,PD,ID,ET}(betas)
end

AbstractItemResponseModels.response_type(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = RT
AbstractItemResponseModels.item_dimensionality(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = ID
AbstractItemResponseModels.person_dimensionality(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = PD
AbstractItemResponseModels.estimation_type(::Type{<:FakeIRM{RT,PD,ID,ET}}) where {RT,PD,ID,ET} = ET

# methods
function AbstractItemResponseModels.irf(model::FakeIRM{RT,PD,ID,PointEstimate}, theta, i, y::Real) where {RT,PD,ID}
    checkresponsetype(RT, y)
    return 0.0
end

function AbstractItemResponseModels.irf(model::FakeIRM{RT,PD,ID,SamplingEstimate}, theta, i, y::Real) where {RT,PD,ID}
    checkresponsetype(RT, y)
    nsamples = 10
    return fill(0.0, nsamples)
end

function AbstractItemResponseModels.iif(model::FakeIRM{RT,PD,ID,PointEstimate}, theta, i, y::Real) where {RT,PD,ID}
    checkresponsetype(RT, y)
    return 1.0
end

function AbstractItemResponseModels.iif(model::FakeIRM{RT,PD,ID,SamplingEstimate}, theta, i, y::Real) where {RT,PD,ID}
    checkresponsetype(RT, y)
    nsamples = 10
    return fill(1.0, nsamples)
end

function StatsBase.fit(::Type{FakeIRM{RT,PD,ID,ET}}, data::AbstractMatrix) where {RT,PD,ID,ET}
    return FakeIRM{RT,PD,ID,ET}(data)
end

function test_interface(T::Type{<:ItemResponseModel}, data; kwargs...)
    @testset "AbstractItemResponseModels.jl API Tests" begin

        model = fit(T, data; kwargs...)
        @test model isa ItemResponseModel
        @test model isa T

        test_traits(model)

        @testset "Interface" begin
            test_irf(model)
            test_iif(model)
        end
    end
end

function test_response_type(::Type{Dichotomous}) end
function test_response_type(::Type{Nominal}) end
function test_response_type(::Type{Ordinal}) end
function test_response_type(::Type{Continuous}) end

function test_dimensionality_type(::Type{Univariate}) end
function test_dimensionality_type(::Type{Multivariate}) end

function test_traits(model)
    @testset "Traits" begin
        @test response_type(model) <: ResponseType
        @test item_dimensionality(model) <: Dimensionality
        @test person_dimensionality(model) <: Dimensionality
    end
end

function test_irf(model::ItemResponseModel)
    rt = response_type(model)
    pdim = person_dimensionality(model)
    idim = item_dimensionality(model)
    et = estimation_type(model)
    return test_irf(rt, pdim, idim, et, model)
end

function test_irf(rt::Type{Dichotomous}, pdim::Type{<:Dimensionality}, idim::Type{<:Dimensionality}, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test irf(model, theta, 1, 0) isa out_type(et)
    @test irf(model, theta, 1, 1) isa out_type(et)
    @test_throws DomainError irf(model, theta, 1, 2)
    @test_throws DomainError irf(model, theta, 1, 1.1)
end

function test_irf(rt::Type{<:Union{Nominal,Ordinal}}, pdim::Type{<:Dimensionality}, idim::Type{<:Dimensionality}, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test irf(model, theta, 1, 1) isa out_type(et)
    @test irf(model, theta, 1, 2.0) isa out_type(et)
    @test_throws DomainError irf(model, theta, 1, 0)
    @test_throws DomainError irf(model, theta, 1, 1.1)
end

function test_irf(rt::Type{Continuous}, pdim::Type{<:Dimensionality}, idim::Type{<:Dimensionality}, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test irf(model, theta, 1, 0.0) isa out_type(et)
    @test irf(model, theta, 1, -1.0) isa out_type(et)
    @test irf(model, theta, 1, 2.3) isa out_type(et)
    @test_throws Exception irf(model, theta, 1, 1im)
    @test_throws Exception irf(model, theta, 1, (0, 1))
end

function test_iif(model::ItemResponseModel)
    rt = response_type(model)
    pdim = person_dimensionality(model)
    idim = item_dimensionality(model)
    et = estimation_type(model)
    return test_iif(rt, pdim, idim, et, model)
end

function test_iif(rt::Type{Dichotomous}, pdim::Type{<:Dimensionality}, idim::Type{<:Dimensionality}, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 0.0) isa out_type(et)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 0.5)
    @test_throws DomainError iif(model, theta, 1, 2.0)
end

function test_iif(rt::Type{<:Union{Nominal,Ordinal}}, pdim::Type{<:Dimensionality}, idim::Type{<:Dimensionality}, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test iif(model, theta, 1, 2.0) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 2.5) isa out_type(et)
    @test_throws DomainError iif(model, theta, 1, 0) isa out_type(et)
end

function test_iif(rt::Type{Continuous}, pdim::Type{<:Dimensionality}, idim::Type{<:Dimensionality}, et::Type{<:EstimationType}, model)
    theta = sim_theta(pdim)
    @test iif(model, theta, 1, 1.0) isa out_type(et)
    @test iif(model, theta, 1, -2.0) isa out_type(et)
    @test iif(model, theta, 1, 3.5) isa out_type(et)
    @test_throws Exception iif(model, theta, 1, 1im)
    @test_throws Exception iif(model, theta, 1, (0, 1))
end

sim_theta(::Type{Univariate}) = 0.0
sim_theta(::Type{Multivariate}) = [0.0, 0.0]

out_type(::Type{PointEstimate}) = Real
out_type(::Type{SamplingEstimate}) = Vector{<:Real}

end

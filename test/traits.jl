@testset "Traits" begin
    struct NoImplement <: ItemResponseModel end
    @test_throws MethodError response_type(NoImplement)
    @test_throws MethodError item_dimensionality(NoImplement)
    @test_throws MethodError person_dimensionality(NoImplement)
    @test_throws MethodError estimation_type(NoImplement)

    noimplement_model = NoImplement()
    @test_throws MethodError response_type(noimplement_model)
    @test_throws MethodError item_dimensionality(noimplement_model)
    @test_throws MethodError person_dimensionality(noimplement_model)
    @test_throws MethodError estimation_type(noimplement_model)

    struct Implement <: ItemResponseModel end
    AbstractItemResponseModels.response_type(::Type{Implement}) = Dichotomous
    AbstractItemResponseModels.item_dimensionality(::Type{Implement}) = 1
    AbstractItemResponseModels.person_dimensionality(::Type{Implement}) = 2
    AbstractItemResponseModels.estimation_type(::Type{Implement}) = PointEstimate

    @test response_type(Implement) == Dichotomous
    @test item_dimensionality(Implement) == 1
    @test person_dimensionality(Implement) == 2
    @test estimation_type(Implement) == PointEstimate

    implement_model = Implement()
    @test response_type(implement_model) == Dichotomous
    @test item_dimensionality(implement_model) == 1
    @test person_dimensionality(implement_model) == 2
    @test estimation_type(implement_model) == PointEstimate
end

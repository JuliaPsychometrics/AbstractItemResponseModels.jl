@testset "Interface Tests" begin
    rtypes = [Dichotomous, Nominal, Ordinal, Continuous]
    pdims = [1, 2]
    idims = [1, 2]
    etypes = [PointEstimate, SamplingEstimate]

    @testset "FakeIRM{$rt,$pd,$it,$et}" for (rt, pd, it, et) in Iterators.product(rtypes, pdims, idims, etypes)
        data = rand(10, 3)
        modeltype = FakeIRM{rt,pd,it,et}
        test_interface(modeltype, data)
    end
end

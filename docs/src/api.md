```@meta
CurrentModule = AbstractItemResponseModels
```

# API
## Types
```@docs
ItemResponseModel
```

## Traits
### Dimensionality
```@docs
Dimensionality
Univariate
Multivariate
item_dimensionality
person_dimensionality
```

### Estimation type
```@docs
EstimationType
PointEstimate
SamplingEstimate
estimation_type
```

### Response type
```@docs
ResponseType
Dichotomous
Nominal
Ordinal
Continuous
response_type
checkresponsetype
```

## Methods
```@docs
expected_score
fit
iif
information
irf
```

## Tests
Interface tests are provided in the `AbstractItemResponseModels.Tests` module. 

```@docs
Tests.test_interface
```

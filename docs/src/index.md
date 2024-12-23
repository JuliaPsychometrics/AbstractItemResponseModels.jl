```@raw html
---
layout: home

hero:
    name: AbstractItemResponseModels.jl
    tagline: An API for item response modelling in Julia
    actions:
        - theme: alt
          text: View on Github
          link: https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl  
        - theme: alt
          text: Function reference
          link: /api
---
```

```@raw html
<div class="vp-doc" style="width:80%; margin:auto">
```

# What is AbstractItemResponseModels.jl?
AbstractItemResponseModels.jl provides a generic interface for item response models in Julia. 
It is targeted at developers of item response model packages. 
Packages sucessfully implementing the AbstractItemResponseModels interface will profit from features within [JuliaPsychometrics](https://github.com/JuliaPsychometrics/) such as plotting for their item response models (e.g. via [ItemResponsePlots.jl](https://github.com/JuliaPsychometrics/ItemResponsePlots.jl)).

It is developed by the [JuliaPsychometrics](https://github.com/juliapsychometrics) organization under MIT license. 

## Installation 
The package can be installed via julias package management. 

```julia
] add AbstractItemResponseModels
```

## How do I use this package?
### As a user
As a user you do not directly need to interact with AbstractItemResponseModels.jl. 
Packages that implement the interface defined in this package, however, will all export functions to interact with item response models such as [`irf`](@ref), [`iif`](@ref), [`expected_score`](@ref) or [`information`](@ref). 

For a full list of methods see the [Methods](@ref methods_page) section of the documentation.

### As a package developer
If you want to be able to use features from [JuliaPsychometrics](https://github.com/JuliaPsychometrics/) for your item response modelling package, you are required to implement the AbstractItemResponseModels.jl interface. The API consists of a set of [Types](@ref types_page), [Traits](@ref traits_page), and [Methods](@ref methods_page). 

```@raw html
</div>
```

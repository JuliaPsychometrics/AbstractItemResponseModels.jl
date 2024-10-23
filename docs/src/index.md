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

### As a package developer
If you want to be able to use features from [JuliaPsychometrics](https://github.com/JuliaPsychometrics/) for your item response modelling package, you are required to implement the AbstractItemResponseModels.jl interface. The API consists of a set of [types](/references/types), [traits](/references/traits), and [methods](/references/methods). 

```@raw html
</div>
```
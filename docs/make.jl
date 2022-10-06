using AbstractItemResponseModels
using Documenter

DocMeta.setdocmeta!(AbstractItemResponseModels, :DocTestSetup, :(using AbstractItemResponseModels); recursive=true)

makedocs(;
    modules=[AbstractItemResponseModels],
    authors="Philipp Gewessler",
    repo="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/{commit}{path}#{line}",
    sitename="AbstractItemResponseModels.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaPsychometrics.github.io/AbstractItemResponseModels.jl",
        edit_link="main",
        assets=String[]
    ),
    pages=[
        "Home" => "index.md",
    ]
)

deploydocs(;
    repo="github.com/JuliaPsychometrics/AbstractItemResponseModels.jl",
    devbranch="main"
)

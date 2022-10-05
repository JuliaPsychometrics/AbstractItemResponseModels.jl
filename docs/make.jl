using AbstractItemResponseModels
using Documenter

DocMeta.setdocmeta!(AbstractItemResponseModels, :DocTestSetup, :(using AbstractItemResponseModels); recursive=true)

makedocs(;
    modules=[AbstractItemResponseModels],
    authors="Philipp Gewessler",
    repo="https://github.com/p-gw/AbstractItemResponseModels.jl/blob/{commit}{path}#{line}",
    sitename="AbstractItemResponseModels.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://p-gw.github.io/AbstractItemResponseModels.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/p-gw/AbstractItemResponseModels.jl",
    devbranch="main",
)

using AbstractItemResponseModels
using Documenter
using DocumenterVitepress

DocMeta.setdocmeta!(
    AbstractItemResponseModels,
    :DocTestSetup,
    :(using AbstractItemResponseModels);
    recursive = true,
)

makedocs(;
    sitename = "AbstractItemResponseModels.jl",
    authors = "Philipp Gewessler",
    modules = [AbstractItemResponseModels],
    warnonly = true,
    checkdocs = :all,
    format = DocumenterVitepress.MarkdownVitepress(
        repo = "github.com/JuliaPsychometrics/AbstractItemResponseModels.jl",
        devbranch = "main",
        devurl = "dev",
    ),
    clean = true,
    draft = false,
    source = "src",
    build = "build",
    pages = [
        "Home" => "index.md",
        "References" => [
            "Types" => "references/types.md",
            "Traits" => "references/traits.md",
            "Methods" => "references/methods.md",
        ],
        "API" => "api.md",
    ],
)

deploydocs(;
    repo = "github.com/JuliaPsychometrics/AbstractItemResponseModels.jl",
    target = "build",
    branch = "gh-pages",
    devbranch = "main",
    push_preview = true,
)

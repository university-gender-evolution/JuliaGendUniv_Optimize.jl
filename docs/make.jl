using JuliaGendUniv_Optimize
using Documenter

DocMeta.setdocmeta!(JuliaGendUniv_Optimize, :DocTestSetup, :(using JuliaGendUniv_Optimize); recursive=true)

makedocs(;
    modules=[JuliaGendUniv_Optimize],
    authors="Krishna Bhogaonker",
    repo="https://github.com/university-gender-evolution/JuliaGendUniv_Optimize/blob/{commit}{path}#{line}",
    sitename="JuliaGendUniv_Optimize.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://00krishna.github.io/JuliaGendUniv_Optimize.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/university-gender-evolution/JuliaGendUniv_Optimize",
    devbranch="main",
)

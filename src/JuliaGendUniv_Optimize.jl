module JuliaGendUniv_Optimize


using JuliaGendUniv_Types
using DataFrames
using DifferentialEquations
using Optimization
using ComponentArrays

include("Genduniv_opt_model_types.jl")
include("GendUniv_run_model.jl")
include("GendUniv_optimize_model.jl")
include("models/basic_model.jl")

export run_model





end

module JuliaGendUniv_Optimize


using JuliaGendUniv_Types
#using JuliaGendUniv
using DataFrames
using DifferentialEquations
using Optimization
using OptimizationOptimisers
using OptimizationNLopt
using OptimizationOptimJL
using Zygote
using ForwardDiff
using ComponentArrays

include("Genduniv_opt_model_types.jl")
include("GendUniv_run_model.jl")
include("GendUniv_optimize_model.jl")
include("models/basic_dde_model.jl")
include("models/basic_ode_model.jl")

export run_model, optimize_model, estimate_model_with_bayes, BasicODEModel, 
BasicDDEModel





end

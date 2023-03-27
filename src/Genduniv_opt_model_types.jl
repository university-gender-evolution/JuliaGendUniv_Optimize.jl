# Model types
abstract type AbstractGendUnivModel end;
abstract type AbstractModelParams end;
struct BasicODEModel <: AbstractGendUnivModel end;
struct BasicDDEModel <: AbstractGendUnivModel end;


mutable struct GUModel <: AbstractGendUnivModel
    name::String
    timespan::Tuple{Float64, Float64}
end;



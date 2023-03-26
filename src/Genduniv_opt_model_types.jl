# Model types
abstract type AbstractGendUnivModel end;

mutable struct GUModel <: AbstractGendUnivModel
    name::String
    timespan::Tuple{Float64, Float64}
    u0::ComponentArray
end;



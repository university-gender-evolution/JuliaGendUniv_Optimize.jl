# Model types
abstract type AbstractGendUnivModel end;
struct BaseModel <: AbstractGendUnivModel end;
struct DdeModel <: AbstractGendUnivModel end;


mutable struct GUModel <: AbstractGendUnivModel
    name::String
    timespan::Tuple{Float64, Float64}
end;



# Model types
abstract type AbstractGendUnivModel end;
abstract type AbstractModelParams end;
struct BasicODEModel <: AbstractGendUnivModel end;
struct BasicDDEModel <: AbstractGendUnivModel end;



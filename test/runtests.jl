using JuliaGendUniv_Optimize
using JuliaGendUniv_Types
using Test
using TestItems


@testitem "[JuliaGendUniv_Optimize] optimization module" begin
    using JuliaGendUniv_Types, Test
    @test UM() isa JuliaGendUniv_Types.AbstractGendUnivDataConfiguration 
    @test DataAudit() isa JuliaGendUniv_Types.AbstractDataChecks
    @test NoAudit() isa JuliaGendUniv_Types.AbstractDataChecks

end

@testitem "[JuliaGendUniv_Optimize] optimization module" begin
    using JuliaGendUniv_Optimize, Test

    @test 1 + 1 == 2

end

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

    @test run_model() == 1
    @test 1 + 1 == 2
    # t_preprocess_um_deptindex = preprocess_data("michigan1979to2009_wGender.dta", 
    #                             165, UM(); audit_config=NoAudit());
end

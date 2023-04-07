using JuliaGendUniv_Optimize
using Test
using TestItems


@testitem "[JuliaGendUniv_Optimize] preprocessing types module" begin
    using JuliaGendUniv_Types, Test

    @test UM() isa JuliaGendUniv_Types.AbstractGendUnivDataConfiguration 
    @test DataAudit() isa JuliaGendUniv_Types.AbstractDataChecks
    @test NoAudit() isa JuliaGendUniv_Types.AbstractDataChecks
end


@testitem "[JuliaGendUniv_Optimize] optimization module" begin
    using Test

    @test BasicODEModel() isa JuliaGendUniv_Optimize.AbstractGendUnivModel
    @test BasicDDEModel() isa JuliaGendUniv_Optimize.AbstractGendUnivModel

end

@testitem "[JuliaGendUniv_Optimize] Run model functions" begin
    using JuliaGendUniv, Test

    t_preprocess_um_deptindex = preprocess_data("michigan1979to2009_wGender.dta", 
                                165, UM(); audit_config=NoAudit());
    
    @test run_model() == 1
end

@testitem "[JuliaGendUniv_Optimize] Optimize model functions" begin
    using Test

    @test estimate_model_with_bayes() == 1
    @test optimize_model() == 1
    @test 1 + 1 == 2
end
using JuliaGendUniv_Optimize
using Test
using TestItems


@testitem "[JuliaGendUniv_Optimize] test import of JuliaGendUniv_Types types" begin
    using JuliaGendUniv_Types, Test

    @test UM() isa JuliaGendUniv_Types.AbstractGendUnivDataConfiguration 
    @test DataAudit() isa JuliaGendUniv_Types.AbstractDataChecks
    @test NoAudit() isa JuliaGendUniv_Types.AbstractDataChecks
end


@testitem "[JuliaGendUniv_Optimize] test local Optimization model types" begin
    using Test

    @test BasicODEModel() isa JuliaGendUniv_Optimize.AbstractGendUnivModel
    @test BasicDDEModel() isa JuliaGendUniv_Optimize.AbstractGendUnivModel

end


@testitem "[JuliaGendUniv_Optimize] Run model functions" begin
    using JuliaGendUniv, JuliaGendUniv_Types, Test
    
    cd(@__DIR__)
    @show pwd()

    t_preprocess = preprocess_data("michigan1979to2009_wGender.dta", 
                                165, UM(); audit_config=NoAudit());
    tdata = t_preprocess.dept_data_vector[1]
    @test size(run_model(tdata, BasicDDEModel(), JuliaGendUniv_Optimize.Basic_DDE_Initial_Params)) == (6, 31)
    @test size(optimize_model(tdata, BasicDDEModel(), JuliaGendUniv_Optimize.Basic_DDE_Initial_Params, NoAudit())) == (31,7)


end


@testitem "[JuliaGendUniv_Optimize] Optimize model functions" begin
    using Test

    @test estimate_model_with_bayes() == 1
    @test optimize_model() == 1
    @test 1 + 1 == 2
end
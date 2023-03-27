
mutable struct Basic_DDE_Initial_Params <: AbstractModelParams
    rattr_f1::Float64
    rattr_f2::Float64
    rattr_f3::Float64
    rattr_m1::Float64
    rattr_m2::Float64
    rattr_m3::Float64
    rhire_f1::Float64
    rhire_f2::Float64
    rhire_f3::Float64
    rhire_m1::Float64
    rhire_m2::Float64
    rhire_m3::Float64
    rprom_f1::Float64
    rprom_f2::Float64
    rprom_f3::Float64
    rprom_m1::Float64
    rprom_m2::Float64
    rprom_m3::Float64
    growth_rate_linear::Float64
end;

function Basic_DDE_Initial_Params()
    return Basic_DDE_Initial_Params(
        0.01,
        0.001,
        0.01,
        0.01,
        0.01,
        0.01,
        0.01,
        0.01,
        0.001,
        0.01,
        0.01,
        0.01,
        0.01,
        0.01,
        0.00,
        0.01,
        0.01,
        0.00,
        0.01
    )
end


function basic_genduniv_dde!(du, u, h, p, t)

    du[1] = p.rhire_f1*u[1] - p.rattr_f1*u[1] - p.rprom_f1*h(p, t-6.0)[1]
    du[2] = p.rhire_f2*u[2] + p.rprom_f1*u[1] - p.rattr_f2*u[2] - p.rprom_f2*h(p, t-6.0)[2] 
    du[3] = p.rhire_f3*u[3] + p.rprom_f2*u[2] - p.rattr_f3*u[3]
    du[4] = p.rhire_m1*u[4] - p.rattr_m1*u[4] - p.rprom_m1*h(p, t-6.0)[4]
    du[5] = p.rhire_m2*u[5] + p.rprom_m1*u[4] - p.rattr_m2*u[5] - p.rprom_m2*h(p, t-6.0)[5]
    du[6] = p.rhire_m3*u[6] + p.rprom_m2*u[5] - p.rattr_m3*u[6]
    du
end;


function run_model(dept_data::JuliaGendUniv.UMDeptData, ::BasicDDEModel,
                    params::Basic_DDE_Initial_Params)

    tspan = dept_data._tspan
    u0 = dept_data._u0.u0_act_bootnorm
    full_data = dept_data.bootstrap_df[:, [:boot_norm_f1, :boot_norm_f2, :boot_norm_f3, :boot_norm_m1, :boot_norm_m2, :boot_norm_m3]]
    full_data = transpose(Array(full_data))[:, Int(tspan[1]):Int(tspan[2])]
    
    #throw(ErrorException("just checking stuff"))

    h(p, t) = zeros(6)
    lags = [6.0]

    genduniv_dde_prob = DDEProblem(basic_genduniv_dde!, u0, h, tspan, params,
                                    constant_lags=lags)

    alg = MethodOfSteps(Rosenbrock23())
    sol = Array(solve(genduniv_dde_prob, alg, saveat=1.0))
    return sol
end;

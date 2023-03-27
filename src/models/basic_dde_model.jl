
mutable struct DDE_Initial_Params <: AbstractModelParams
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

function DDE_Initial_Params()
    return DDE_Initial_Params(
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


function run_model(dept_data::UMDeptData,
                    params::)
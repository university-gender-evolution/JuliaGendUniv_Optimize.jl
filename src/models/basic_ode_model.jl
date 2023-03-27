
function basic_genduniv_ode!(du, u, p, t)

    du[1] = p.rhire_f1*u[1] - p.rattr_f1*u[1] - p.rprom_f1*u[1]
    du[2] = p.rhire_f2*u[2] + p.rprom_f1*u[1] - p.rattr_f2*u[2] - p.rprom_f2*u[2] 
    du[3] = p.rhire_f3*u[3] + p.rprom_f2*u[2] - p.rattr_f3*u[3]
    du[4] = p.rhire_m1*u[4] - p.rattr_m1*u[4] - p.rprom_m1*u[4]
    du[5] = p.rhire_m2*u[5] + p.rprom_m1*u[4] - p.rattr_m2*u[5] - p.rprom_m2*u[5]
    du[6] = p.rhire_m3*u[6] + p.rprom_m2*u[5] - p.rattr_m3*u[6]
    du
end;
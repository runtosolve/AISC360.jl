module v16

function calculate_factored_strength(Rn, Ω, ϕ_LRFD, design_code)

    if design_code == "ASD"
        eRn  = Rn / Ω
    elseif design_code == "LRFD"
        eRn = Rn * ϕ_LRFD
    elseif design_code == "nominal"
        eRn = Rn
    end

    return eRn

end


function e3(Fe, Fy, Ag, design_code)

    Ω = 1.80
    ϕ = 0.85

    if Fy/Fe <= 2.25
        Fcr = 0.658^(Fy/Fe) * Fy
    elseif λc > 2.25
        Fcr = 0.877 * Fe
    end

    Pn = Fcr * Ag

    ePn = calculate_factored_strength(Pn, Ω, ϕ, design_code)

    return Pn, ePn

end

e3(;Fe, Fy, Ag, ASDorLRFD) = e3(Fe, Fy, Ag, ASDorLRFD)

end  #module
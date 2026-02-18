using LinearAlgebra

function phase_damping_kraus(γ)
    K0 = [1 0; 0 sqrt(1-γ)]
    K1 = [0 0; 0 sqrt(γ)]
    return [K0,K1]
end

function phase_damping_2q(ρ, γ)
    ρ_out = zeros(ComplexF64,4,4)
    for K1 in phase_damping_kraus(γ), K2 in phase_damping_kraus(γ)
        ρ_out += kron(K1,K2) * ρ * kron(K1,K2)'
    end
    return ρ_out
end

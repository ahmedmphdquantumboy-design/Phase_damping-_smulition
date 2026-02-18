using LinearAlgebra
include("pauli.jl")

function measurement_operator(θ, ϕ)
    n = [sin(θ)*cos(ϕ), sin(θ)*sin(ϕ), cos(θ)]
    return n[1]*σx + n[2]*σy + n[3]*σz
end

function chsh_expectation(ρ, angles)
    A  = measurement_operator(angles[1], angles[2])
    A′ = measurement_operator(angles[3], angles[4])
    B  = measurement_operator(angles[5], angles[6])
    B′ = measurement_operator(angles[7], angles[8])
    Bchsh = kron(A,B) + kron(A,B′) + kron(A′,B) - kron(A′,B′)
    return real(tr(ρ*Bchsh))
end

using LinearAlgebra

function bell_state()
    ψ = [1,0,0,1]/sqrt(2)
    return ψ*ψ'
end

function werner_state(p::Float64)
    ρbell = bell_state()
    return p*ρbell + (1-p)*Matrix{ComplexF64}(I,4,4)/4
end

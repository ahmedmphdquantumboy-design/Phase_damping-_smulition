using Random
include("chsh.jl")
Random.seed!(1234)

function optimize_chsh(ρ; n_samples=6000)
    Smax = -Inf
    best = nothing
    for _ in 1:n_samples
        angles = [π*rand(), 2π*rand(), π*rand(), 2π*rand(),
                  π*rand(), 2π*rand(), π*rand(), 2π*rand()]
        S = chsh_expectation(ρ, angles)
        if S > Smax
            Smax = S
            best = angles
        end
    end
    return Smax, best
end

function critical_gamma(γs, Svals)
    for (γ,S) in zip(γs,Svals)
        if S <= 2
            return γ
        end
    end
    return NaN
end

using Plots
include("../src/states.jl")
include("../src/noise.jl")
include("../src/optimization.jl")

γs = 0:0.05:1
p = 0.9

S_bell = Float64[]
S_werner = Float64[]

for γ in γs
    push!(S_bell, optimize_chsh(phase_damping_2q(bell_state(), γ))[1])
    push!(S_werner, optimize_chsh(phase_damping_2q(werner_state(p), γ))[1])
end

γc_bell = critical_gamma(γs, S_bell)
γc_werner = critical_gamma(γs, S_werner)

println("Critical γ (Bell) = ", γc_bell)
println("Critical γ (Werner) = ", γc_werner)

plot(γs, S_bell, label="Bell state", lw=2)
plot!(γs, S_werner, label="Werner state (p=0.9)", lw=2, ls=:dash)
hline!([2], label="Classical bound S=2", ls=:dot)
scatter!([γc_bell, γc_werner], [2,2], label="γc", ms=6)

xlabel!("Phase damping strength γ")
ylabel!("S_max")
savefig("../plots/chsh_phase_damping.png")

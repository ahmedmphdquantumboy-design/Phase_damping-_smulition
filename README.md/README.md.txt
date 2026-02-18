# CHSH Simulation under Phase Damping Noise

This repository contains Julia source code for the numerical evaluation of the CHSH inequality in two-qubit quantum systems subject to **local phase damping noise**.

The code accompanies the study:

**"Violation of Bell Inequalities in Two-Qubit Systems: Analytical Results and Numerical Optimization under Noise"**

and provides a reproducible framework for computing the optimized CHSH parameter under realistic noise.

---

## Physical Model

The simulations consider bipartite two-qubit states exposed to a **local phase damping channel**. Two classes of quantum states are analyzed:

- The maximally entangled Bell state $\( |\Phi^+ \rangle \)$  
- Werner states parameterized by a mixing probability $\( p \)$ 

The phase damping channel models decoherence that suppresses off-diagonal terms in the density matrix, leading to a loss of quantum coherence and reduction of nonlocal correlations.

---

## Numerical Method

For each value of the phase damping strength $\( \gamma \in [0,1] \)$, the CHSH parameter is evaluated as

$$
S_{\max} = \max_{\vec a, \vec a', \vec b, \vec b'} \langle B \rangle,
$$

where the maximization is performed numerically over all local measurement directions of the two subsystems.

The optimization is carried out via **random sampling of measurement angles on the Bloch sphere**.

Random seeds are fixed to ensure reproducibility of the numerical optimization results.

---

## Repository Structure

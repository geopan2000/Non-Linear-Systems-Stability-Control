# Non-Linear-Systems-Stability-Control

## Overview
This repository contains the MATLAB simulations and analysis for a project on controlling and stabilizing nonlinear systems. The tasks involve converting a dynamic system into state-space form, verifying passivity, implementing a feedback controller, and exploring system stability. Due to university regulations, the solutions provided are theoretical models, and assignment-specific validations have not been tested.

## Coursework Questions

### 1. State-Space Representation
- Given a set of second-order differential equations describing a system:
  ```
  (r²(t) + 1)θ̈(t) + 2r(t)ṙ(t)θ̇(t) = u₁(t)
  r̈(t) − r(t)θ̇²(t) = u₂(t)
  ```
- Represent the system in state-space form by defining the state variables and expressing the system as:
  ```
  ẋ = f(x, u), y = h(x)
  ```

### 2. Verifying Passivity
- Prove that the system is passive from the input `u` to the output `y` by using a Lyapunov function:
  ```
  V(x) = 1/2 * (r² + 1) * θ̇² + 1/2 * ṙ²
  ```
- Show that the derivative of the Lyapunov function satisfies `V̇ ≤ y^T u`, confirming system passivity.

### 3. PD Feedback Control
- A PD feedback controller is applied:
  ```
  u₁ = −θ̇ − (θ − θ₁)
  u₂ = −ṙ − (r − r₁)
  ```
- Demonstrate that for `θ₁ = 0` and `r₁ = 0`, the system becomes globally asymptotically stable at the origin using a modified Lyapunov function.

### 4. System Simulation
- Simulate the system for different values of the desired inputs `θ₁` and `r₁`. Explain the effect of the controller and how the system responds to changes in the input.

### 5. Input-to-State Stability (ISS) Violation
- The system does not exhibit Input-to-State Stability (ISS). Design a destabilizing input:
  ```
  rd = 0, θd(t) = c * sign(k(x(t))).
  ```
- Show through simulation that this input causes instability, and the system's states grow unbounded.

### 6. Nonlinear PD Control
- Modify the control law for `r` to include a nonlinear term for enhanced control performance:
  ```
  u₂ = −ṙ − (r − r₁) − (r³ − r₁³)
  ```
- Simulate and show that the closed-loop system demonstrates the typical properties of an Input-to-State Stable (ISS) system.

## Files Included
- **cw2_1.m**: Basic PD feedback control simulation.
- **cw2_2.m**: ISS disproving through destabilizing input.
- **cw2_3.m**: Nonlinear control with square wave inputs for testing ISS.
- **PDF files**: Full description of the problem, theoretical analysis, and derivations.

## How to Run
1. Download the `.m` files.
2. Adjust the input parameters such as initial conditions or disturbance values within the scripts to observe the system behavior under different scenarios.
3. Run each script in MATLAB to generate the corresponding state responses and validate theoretical findings.

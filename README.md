# Crane Control System Development

Welcome to the Crane Controller project repository. This project is focused on the creation of a sophisticated control and observation system tailored for managing loads suspended by crane cables. The project is structured methodically, beginning with foundational principles and advancing through complex control system design.

## Project Overview

The journey of this project unfolds in several key stages:

### Motion Equation Derivation
The initial phase involves formulating the motion equations that govern the crane and its load. This step is critical for understanding the dynamics at play.

### System Linearization
Following the derivation of motion equations, the system is linearized around equilibrium points. This simplification is essential for the subsequent design of controllers.

### LQR Controller Design
With a linearized model in hand, we proceed to design a Linear-Quadratic Regulator (LQR) controller using MATLAB/SIMULINK. This controller aims to optimize the system's stability and performance.

### Observer Implementation
To accurately estimate the system states, a Luenberger Observer is developed. This observer is adept at handling both linear and nonlinear system dynamics, ensuring precise control under varying conditions.

### Nonlinear System Analysis
The project delves into the nonlinear aspects of the system, employing the Ode45 solver for meticulous analysis. This approach allows for a comprehensive understanding of the system's behavior beyond linear approximations.

### LQG Controller Development
The culmination of the project involves designing a Linear-Quadratic Gaussian (LQG) controller. This advanced controller integrates the Kalman Filter with the LQR controller, offering a robust solution for managing crane loads under uncertainty.

---

## Contributions

- **Comprehensive Control System Development**: I meticulously developed and implemented a comprehensive control system tailored for precise management of crane loads. This involved an initial derivation of the motion equations, followed by system linearization at equilibrium points, and culminated in a detailed simulation within MATLAB/SIMULINK.
  
- **Innovative Controller Design and Implementation**: I engineered and designed state-of-the-art controllers, notably the Linear-Quadratic Regulator (LQR) and Linear-Quadratic Gaussian (LQG) controllers. These efforts were augmented with the integration of a Luenberger Observer, ensuring unparalleled accuracy in state estimation for both linear and nonlinear system dynamics.
  
- **Advanced Numerical Analysis**: I employed the Ode45 solver to conduct advanced numerical analysis on the nonlinear aspects of the system. This approach allowed me to achieve a deep understanding and thorough examination of the system's behavior beyond linear approximations, ensuring robustness and reliability in the control system's performance.

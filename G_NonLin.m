% Clear workspace
clear all

%% Defining variables
syms m1 g m2 M L1 L2 x dx 
m1 = 100;
m2 = 100;
M = 1000;
L1 = 20;
L2 = 10;
g = 9.81;
tspan = 0:0.1:100;
q0 = [2 0 deg2rad(0) 0 deg2rad(0) 0];

%% Linearized Model
A = [0 1 0 0 0 0; 0 0 -m1*g/M 0 -m2*g/M 0; 0 0 0 1 0 0; 0 0 -((M*g)+(m1*g))/(M*L1) 0 -g*m2/(M*L1) 0; 0 0 0 0 0 1; 0 0 -m1*g/(M*L2) 0 -((M*g)+(m2*g))/(M*L2) 0];
B = [0; 1/M; 0; 1/(L1*M); 0; 1/(L2*M)];
c1 = [1 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];
d = [1; 0; 0];
sys1 = ss(A, B, c1, d);

%% LQR Controller
Q = [1 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];
R = 0.1;
[K, ~, ~] = lqr(A, B, Q, R);
sys = ss(A - B * K, B, c1, d);

%% Kalman Estimator Design
Bd = 0.1 * eye(6);  % Process Noise
Vn = 0.01;          % Measurement Noise
[Lue1, ~, ~] = lqe(A, Bd, c1, Bd, Vn * eye(3));
Ac1 = A - Lue1 * c1;
e_sys1 = ss(Ac1, [B, Lue1], c1, 0);

%% Non-linear Model LQG Response
[t, q1] = ode45(@(t, q) nonLinearObs1(t, q, -K * q, Lue1), tspan, q0);
figure();
plot(t, q1(:,1), 'LineWidth', 2);
ylabel('State Variable');
xlabel('Time (sec)');
title('Non-Linear System LQG for output vector: x(t)');
legend('x');

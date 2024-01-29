% Parámetros del sistema
m1 = 0.2;   % kg
l1 = 0.3;   % m
m2 = 0.1;   % kg
l2 = 0.25;  % m
g = 9.81;   % m/s^2
c1 = 0.2;   % kg*m/s

% Definir las matrices de espacio de estados
A = [0, 0, 1, 0; 
     0, 0, 0, 1; 
     -(m2*l2*g)/(m1+m2), (m2*g)/(m1+m2), -c1/(m1+m2), 0; 
     (l1*g)/(m1+m2), -(l1*g)/(m1+m2), 0, 0];

B = [0; 0; 1/(m1+m2); -1/(m1+m2)];

C = eye(4);
D = zeros(4, 1);

% Condiciones iniciales
theta1_0 = 0;        % rad
theta2_0 = deg2rad(35); % convertir grados a radianes
theta1_dot_0 = 0;    % rad/s
theta2_dot_0 = 0;    % rad/s
x0 = [theta1_0; theta2_0; theta1_dot_0; theta2_dot_0];

% Simulación usando ode45
tspan = 0:0.01:10;  % tiempo de simulación de 0 a 10 segundos
[t, x] = ode45(@(t, x) A*x + B*0, tspan, x0);

% Plotear resultados
figure;

subplot(2, 1, 1);
plot(t, rad2deg(x(:, 1)), 'r', t, rad2deg(x(:, 2)), 'b');
title('Ángulos vs Tiempo');
xlabel('Tiempo (s)');
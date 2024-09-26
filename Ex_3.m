clear;
clc;
x_initial = [2,2,2,2]; 
tspan = [0, 40]; 
theta_d = @(t) square(2 * pi * 0.1 * t);  
r_d = @(t) square(2 * pi * 0.05 * t);     

[t, x] = ode23(@(t, x) system(t, x, theta_d(t), r_d(t)), tspan, x_initial);

figure;
subplot(4, 1, 1);
plot(t, x(:,1));
ylabel('x1');
title('State Response x1 over Time');
grid on;

subplot(4, 1, 2);
plot(t, x(:,2));
ylabel('x2');
title('State Response x2 over Time');
grid on;

subplot(4, 1, 3);
plot(t, x(:,3));
ylabel('x3');
title('State Response x3 over Time');
grid on;

subplot(4, 1, 4);
plot(t, x(:,4));
xlabel('Time');
ylabel('x4');
title('State Response x4 over Time');
grid on;
hold off;

function dx = system(t, x, theta_d, r_d )
    U1 = -x(2)-(x(1)-theta_d);
    U2 = -x(4)-(x(3)-r_d)-(x(3)^3-r_d^3);    
    dx1 = x(2);
    dx2 = ((U1-2*x(2)*x(3)*x(4))/(x(3)^2+1));
    dx3 = x(4);
    dx4 = x(3)*x(2)^2 +U2;
    dx = [dx1; dx2; dx3; dx4];
end
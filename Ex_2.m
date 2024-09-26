x_initial = [1, 1, 1, 1];
tspan = [0 10000];
c_values=[1,5,10,50];
% Loop for ploting all states
for i = 1:4
    figure;
        for c=c_values %loop for varius values of c
           % Solve the system for each value of c
           [t, x] = ode23(@(t, x) system(t, x,c), tspan, x_initial);
           plot(t, x(:,i), 'DisplayName', sprintf('c=%d',c));% Plot state
           hold on;
        end
    ylabel(sprintf('x%d', i));
    xlabel('Time');
    title(sprintf('State Response x%d over Time', i));
    legend;
    grid on;
    hold off;
end

function dx = system(t, x, c)
    theta_d = c * sign(x(2));
    U1 = -x(2)-(x(1)-theta_d);
    U2 = -x(4)-(x(3));    
    dx1 = x(2);
    dx2 = ((U1-2*x(2)*x(3)*x(4))/(x(3)^2+1));
    dx3 = x(4);
    dx4 = x(3)*x(2)^2 + U2;
    dx = [dx1; dx2; dx3; dx4];
end


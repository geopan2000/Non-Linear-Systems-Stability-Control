x_initial = [0, 0, 0, 0];
tspan = [0 300];
theta_d_values = [-5, 1, 5];
r_d_values = [-5, 1, 5];
% Loop for various values of theta_d and r_d and plot for each state
    for i = 1:4
        figure;
        for theta_d = theta_d_values
            for r_d = r_d_values
                % Solve the ODE for each pair of theta_d and r_d
                [t, x] = ode23(@(t, x) system(t, x, theta_d, r_d), tspan, x_initial);

                % Plot state response over time
                plot(t, x(:,i), 'DisplayName', sprintf('theta_d=%d, r_d=%d', theta_d, r_d));
                hold on;
            end
        end
        ylabel(sprintf('x%d', i));
        xlabel('Time');
        title(sprintf('State Response x%d over Time', i));
        legend;
        grid on;
        hold off;
    end
    
function dx = system(t, x, theta_d, r_d)
    U1 = -x(2) - (x(1) - theta_d);
    U2 = -x(4) - (x(3) - r_d);
    dx1 = x(2);
    dx2 = (U1 - 2*x(3)*x(2)*x(4)) / (x(3)^2 + 1);
    dx3 = x(4);
    dx4 = x(3)*x(2)^2 + U2;
    dx = [dx1; dx2; dx3; dx4];
end


% Fitting functions
% f1(x)
figure
plot(x, f1(x), 'k', 'LineWidth', 2);
xlabel('x');
ylabel('f1(x)');
legend('f1(x)');
grid on;

% f2(x)
figure
plot(x, f2(x), 'k', 'LineWidth', 2);
xlabel('x');
ylabel('f2(x)');
legend('f1(x)');
grid on;

% Gaussian2
figure
plot(xg, Gaussian2(xg, beta), 'k', 'LineWidth', 2); hold on;
plot(xg, y, 'r--', 'LineWidth', 1);
xlabel('x');
ylabel('Gaussian2');
legend('Sem ruído', 'Com ruído');
grid on;

% Lorentzian
figure
plot(xl, lorentiaz(K, ak, xok, wk), 'k', 'LineWidth', 2); hold on;
plot(xl, L_noise, 'r--', 'LineWidth', 1);
xlabel('x');
ylabel('Lorentziana');
legend('Sem ruído', 'Com ruído');
grid on;

% Voigt
Gx = exp(-((xv - 50)/sigma).^2);
Lx = 1 ./ ((xv - 50).^2 + gamma^2);
V_clean = a * (r * Lx + (1 - r) * Gx);
V_noise = V_clean + 0.2 * randn(size(xv));

figure
plot(xv, V_clean, 'k', 'LineWidth', 2); hold on;
plot(xv, V_noise, 'r--', 'LineWidth', 1);
xlabel('x');
ylabel('Voigt');
legend('Sem ruído', 'Com ruído');
grid on;

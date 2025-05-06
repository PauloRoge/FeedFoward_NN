clear; clc;

x = linspace(0,1,500); % gerar os dados da funcao alvo
x = x(:)'; % vetor linha

%% Function 1
f1 = @(x) (4*x-2)+ 2*exp(-16*(4*x-2).^2); % funcao alvo

%% Function 2
f2 = @(x) sin(2*((4*x)-2))+2*exp(-16*((4*x)-2).^2);

%% Gaussian2
xg = linspace(0, 250, 300)';
beta = [1; 1; 1; 1; 1; 1; 1];

gaussian2 = @(xg) beta(1)*exp(-beta(2)*xg) + beta(3)*exp(-((xg - beta(4)).^2)/beta(5)) + ...
                beta(6)*exp(-((xg - beta(7)).^2)/beta(5));

y = gaussian2(xg) + 0.5 * randn(size(xg));

%% Lorentzian
xl = linspace(0, 80, 300)';
K = 3;
ak = [1.5 2.0 1.0];
xok = [20 40 60];
wk = [3 4 5];

lorentiaz = @(xl) L(K, xl, ak, xok, wk);
L_noise = lorentiaz(xl) + 0.5*randn(size(xl)); % ruído com sigma = 0.5

%% Voigt
xv = linspace(0, 100, 300)';
sigma = 5; gamma = 3; a = 0.6; r = 0.5;
Gx = exp(-((xv - 50)/sigma).^2);
Lx = 1 ./ ((xv - 50).^2 + gamma^2);

voigt = @(xv) a * (r * Lx + (1 - r) * Gx);
V_noise =  voigt(xv) + 0.2*randn(size(xv)); % ruído com sigma aprox 0.2
%%
% =========================================================================
function [values] = L(K, xl, ak, xok, wk)
    AUX = zeros(size(xl));

    for k = 1:K
        values = AUX + ak(k) ./ ((xl - xok(k)).^2 + wk(k)^2);
    end
end
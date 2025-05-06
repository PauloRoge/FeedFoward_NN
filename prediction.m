% --- predicao da rede ---

t_pred_treino = net(x_rotulo);
t_pred_test = net(x_test);

perf_train = perform(net, t_rotulo, t_pred_treino);
perf_test  = perform(net, t_test, t_pred_test);

residuals_train = t_rotulo - t_pred_treino;
residuals_test  = t_test - t_pred_test;

figure;
plot(x_rotulo, residuals_train, 'ro'); hold on;
plot(x_test, residuals_test, 'bo');
yline(0, '--k');
legend('Resíduos treino', 'Resíduos teste');
title('Erro residual da rede neural');
xlabel('x');
ylabel('Erro residual');
grid on;

[sorted_trax_x, idx_train] = sort(x_rotulo);
[sorted_test_x, idx_test]   = sort(x_test);

% Gráfico de linha do erro residual
figure;
plot(sorted_trax_x, residuals_train, 'r', 'LineWidth', 1.5); hold on;
plot(sorted_test_x, residuals_test, 'b', 'LineWidth', 1.5);
yline(0, '--k');
legend('Resíduo treino', 'Resíduo teste');
title('Erro residual ponto a ponto da FF-NN em f_1(x)');
xlabel('x');
ylabel('yreal - ypred');
grid on;


y_fitted = net(x);   % aplica a rede a todo o domínio
figure;
plot(x, t, 'k', 'LineWidth', 2); hold on;       % função verdadeira
plot(x, y_fitted, 'r--', 'LineWidth', 1.5);     % função ajustada pela rede
legend('f_1(x)', 'Fitting da rede');
title('Fitting da FF-NN sobre f_1(x)');
xlabel('x');
ylabel('y');
grid on;
%% Treinamento da NN
% escolher e gerar dados rotulados
% criar e configurar a arquitetura da rede
% processo de treinamento

%% Treinamento genérico da Function 1
x = linspace(0,1,500); % gerar os dados de input
x = x(:)'; % vetor linha
t = f1(x); % gerar dados de output
D = [x;t]; % pares rotulados

net = feedforwardnet(10); % rede neural
netG = train(net, D(1,:), D(2,:)); % treinamento
%% Treinamento Function 1

% --- Gerar pares rotulados (D) | escolher dados de treinamento  | particionar os dados ---
shuffle = randperm(length(x));    % vetor de indices embaralhados para ter 
Ntreino = floor(0.8 * length(x)); % representatividade de todo domínio. uso de permutacao

x_rotulo = x(shuffle(1 : Ntreino)); % 80% dos dados rotulados de forma aleatoria
t_rotulo = t(shuffle(1 : Ntreino)); % buscando generalizar os dados. pares D(x,t).

x_test = x(shuffle(Ntreino+1:end)); % Dados restantes que não foram rotulados, são
t_test = t(shuffle(Ntreino+1:end)); % utilizados para testa a rede.

% --- Criar arquitetura da rede / Configurar rede neural ---

net = feedforwardnet([10, 4, 3]); % 3 camadas com 10, 4, 3 neurônios.
% por padrão, função ativacao; tansig. sendo purelin na saída.

% --- Algoritmo de treinamento ---
net.trainFcn = 'trainlm'; % Levenberg-Marquardt
net.performFcn = 'mse'; %  funcao de desempenho (erro)

% --- Divisão explícita dos dados ---
net.divideParam.trainRatio = 1.0; % forca 100% dos dados fornecidos como
net.divideParam.valRatio   = 0.0; % treino e desabilitar a divisao automatica
net.divideParam.testRatio  = 0.0; % entre treino/validacao/test, de forma manual

% --- Treinar rede ---

% retorna a rede treinada, estrutura com informacoes
% de (convergencia, erros, n epocas, entre outros).
[net, tr] = train(net, x_rotulo, t_rotulo); % fornece a janela de treinamento, e feedfoward.





%% Treinamento genérico da Gaussian2
x = linspace(0, 250, 300)'; % gerar os dados de input
x = x(:)'; % vetor linha

t = gaussian2(x); % gerar dados de output
D = [x;t]; % pares rotulados

net = feedforwardnet(10); % rede neural
net = train(net, D(1,:), D(2,:)); % treinamento
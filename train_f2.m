%% Treinamento da Function 2
x = linspace(0,1,500); % gerar os dados de input
x = x(:)'; % vetor linha
t = f2(x); % gerar dados de output
D = [x;t]; % pares rotulados

net = feedforwardnet(10); % rede neural
net = train(net, D(1,:), D(2,:)); % treinamento
%% Treinamento genérico da Lorentzian
x = linspace(0, 80, 300); % gerar os dados de input
x = x(:)'; % vetor linha

t = lorentiaz(x); % gerar dados de output
D = [x;t]; % pares rotulados

net = feedforwardnet(10); % rede neural
net = train(net, D(1,:), D(2,:)); % treinamento
x = linspace(0, 100, 300)'; % vetor coluna
t = voigt(x);               % também será coluna

net = feedforwardnet(10);
net = train(net, x', t');   % transpose para usar como colunas (entrada por coluna)

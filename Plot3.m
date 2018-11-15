

beta04 = csvread('beta04');
beta07 = csvread('beta07');
ratioVec = csvread('ratioVec');
plot(ratioVec, beta04, ratioVec, beta07);
legend({'beta = 0.4','beta = 0.7'},'Location','southeast')
pbaspect([1 1 1]);
title('d = 0.8, nrAvg = 20, initAff = 1%, popSize = 1000');
xlabel('R0') 
ylabel('Rinf') 
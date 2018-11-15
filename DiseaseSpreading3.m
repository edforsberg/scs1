clc

beta = 0.4;
d = 0.8;
proportionAffected = 0.01;
nrAverage = 20; 

betaRatioVec = [];
recoverRatioVec = [];
plotHandle1 = plot(0, 0);
pbaspect([1 1 1]);
title('beta = 0.7, d = 0.8, nrAvg = 20, initAff = 1%, popSize = 1000');
xlabel('R0') 
ylabel('Rinf') 


ratioVec = logspace(-0.2, 2.1, 20);

for i = 1:size(ratioVec,2) 
    
    gamma = 1/(ratioVec(i)/beta); 
    
    averageI = 0; 
    
    for j = 1:nrAverage
        averageI = averageI + Epedemic(beta, gamma, d, proportionAffected); 
    end
    averageI = averageI/nrAverage; 
    
    recoverRatioVec = [recoverRatioVec; averageI];
    betaRatioVec = [betaRatioVec;beta/gamma];
    set(plotHandle1, 'XData', betaRatioVec, 'YData', recoverRatioVec);
    drawnow
    
end

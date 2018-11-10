clc

beta = 0.6;
d = 0.8;
proportionAffected = 0.01;
nrAverage = 20; 

betaRatioVec = [];
recoverRatioVec = [];
plotHandle1 = semilogx(0, 0);
pbaspect([1 1 1]);

gamma0 = 0.01;
for i = 0.1:0.1:6
    gamma = gamma0*i;
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

clc

beta = 0.6;
d = 0.8;
proportionAffected = 0.01;
nrAverage = 20; 

betaRatioVec = [];
recoverRatioVec = [];
plotHandle1 = semilogx(0, 0);
pbaspect([1 1 1]);

gamma0 = 0.005;
gammaMax = 0.06;
gamma = gamma0; 



while(gamma< gammaMax) 
     
    averageI = 0; 
    
    for j = 1:nrAverage
        averageI = averageI + Epedemic(beta, gamma, d, proportionAffected); 
    end
    averageI = averageI/nrAverage; 
    
    recoverRatioVec = [recoverRatioVec; averageI];
    betaRatioVec = [betaRatioVec;beta/gamma];
    set(plotHandle1, 'XData', betaRatioVec, 'YData', recoverRatioVec);
    drawnow
    
    gamma = gamma+0.003;
end

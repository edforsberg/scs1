clc

d = 0.8;
proportionAffected = 0.01;
nrAverage = 1;

tresholdVec = [];
betaVec = [];


plotHandle1 = plot(0, 0);
pbaspect([1 1 1]);

for beta = 0.4:0.05:0.7  
    
    betaRatioVec = [];
    recoverRatioVec = [];
    
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
        
    end
    
    treshold = FindTreshold(recoverRatioVec, betaRatioVec);
    betaVec = [betaVec; beta]; 
    tresholdVec = [tresholdVec;treshold]; 
    
    set(plotHandle1, 'XData', betaVec, 'YData', tresholdVec);
    drawnow
    
end

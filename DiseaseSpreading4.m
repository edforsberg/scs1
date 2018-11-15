clc

beta = 0.6;
d = 0.8;
proportionAffected = 0.01;
nrAverage = 20; 

beta0 = 0.5; 
betaMax = 0.8;

gamma0 = 0.01;
gammaMax = 0.06;

betaRatioMat = []; 
recoverRatioMat = []; 
betaVec = []; 

beta = beta0; 
while(beta<betaMax) 
    
i= i+1; 
beta = beta +0.05*i; 
    
betaRatioVec = [];
recoverRatioVec = [];
gamma = gamma0; 
j = 0; 
while(gamma< gammaMax)     
    j = j+1; 
    gamma = gamma0 + 0.005*j; 
    averageI = 0; 
    
    for h = 1:nrAverage
        averageI = averageI + Epedemic(beta, gamma, d, proportionAffected); 
    end
    averageI = averageI/nrAverage; 
    
    recoverRatioVec = [recoverRatioVec; averageI];
    betaRatioVec = [betaRatioVec;beta/gamma];   
end

recoverRatioMat(:,j) = recoverRatioVec; 
betaRatioMat(:,j) = betaRatioVec; 
betaVec = [betaVec beta]; 

end
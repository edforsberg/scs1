clc

betaVec = linspace(0.2, 0.95, 20);
ratioVec = logspace(-0.3, 2.3, 20);

d = 0.8;
proportionAffected = 0.01;
nrAverage = 20; 

recoverRatioMat = zeros(size(betaVec,2), size(ratioVec,2));

for i = 1:size(betaVec,2) 
    
    beta = betaVec(i); 

for j = 1:size(ratioVec,2) 
    
    gamma = 1/(ratioVec(j)/beta); 
    
    averageI = 0; 
    
    for k = 1:nrAverage
        averageI = averageI + Epedemic(beta, gamma, d, proportionAffected); 
    end
    averageI = averageI/nrAverage; 
    
    recoverRatioMat(i,j) = averageI;
      
end

end

csvwrite('recoverRatioMat4', recoverRatioMat);
csvwrite('betaVec4', betaVec);
csvwrite('ratioVec4', ratioVec);


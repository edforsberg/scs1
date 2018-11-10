function ratioRecovered = Epedemic(beta, gamma, d, proportionAffected)

canvasSize = 100; 
populationSize = 1000; 
nrInfected = ceil(populationSize*proportionAffected);

startPositions = randi(canvasSize,populationSize,2); 
states = Outbrake(populationSize, nrInfected);

positions = startPositions;
infection = true; 
itt = 1; 

while (infection) 
    
    itt = itt+1; 
    
    connectionMatrix = ConnectionMatrix(positions, canvasSize); 
    
    states = Spread(connectionMatrix,states,beta);  
    states = Recover(states, gamma);                        
    positions = Move(positions, canvasSize,d);    
    
    if(sum(states(:) == 2) == 0) 
        infection = false; 
    end
end

ratioRecovered = (sum(states(:) == 3))/populationSize;
clc

d = 0.8; 
beta = 0.6;
gamma = 0.01;

canvasSize = 100; 
populationSize = 1000; 
nrInfected= 2; 
nrOfItterations = 1000; 

%[startPositions, states] = InitializePopulation(populationSize, nrInfected, canvasSize);
%startPositions = [floor(rand(populationSize, 1)*canvasSize) round(rand(populationSize, 1)*canvasSize)];
startPositions = randi(canvasSize,populationSize,2); 
states = Outbrake(populationSize, nrInfected); 


plotHandle = scatter(startPositions(:,1), startPositions(:,2), 5, states,'filled'); 
xlim([0 canvasSize]);
ylim([0 canvasSize]);

positions = startPositions; 

for i = 1:nrOfItterations
    
    connectionMatrix = ConnectionMatrix(positions, canvasSize); 
    
    for j = 1:size(connectionMatrix, 1)
        
        currPosition = connectionMatrix(j,:); 
        IndsAtRisk = connectionMatrix(j, 1:nnz(currPosition)); 
        for k = 1:size(IndsAtRisk,2)
            if(states(IndsAtRisk(k)) == 1 && rand < beta) 
                for l = 1:size(IndsAtRisk,2)
                    if(l ~= k && states(IndsAtRisk(l)) == 0) 
                        states(IndsAtRisk(l)) = 1; 
                    end 
                end 
            end
        end
                
    end
    
    for j = 1:populationSize
        
        if(states(j) == 1 && rand < gamma) 
            states(j) = 2; 
        end 
        
    end
                        
    
    
    
    for j = 1:populationSize        
        if d < rand
            positions(j,:) = Move(positions(j,:), canvasSize); 
        end
    end
    
    set(plotHandle,'XData',positions(:,1));
    set(plotHandle,'YData',positions(:,2));
    set(plotHandle,'CData',states);
    drawnow

end

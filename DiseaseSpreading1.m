clc

d = 0.8; 
beta = 0.6;
gamma = 0.01;

canvasSize = 100; 
populationSize = 100; 
nrInitiallyInfected = 2; 
nrOfItterations = 1000; 

startPositions = floor(rand(populationSize, 2)*canvasSize); 
states = Outbrake(populationSize, nrInitiallyInfected); 


plotHandle = plot(startPositions(:,1), startPositions(:,2), '.'); 
xlim([0 canvasSize]);
ylim([0 canvasSize]);

pts = startPositions; 

for i = 1:nrOfItterations
    
    connectionMatrix = ConnectionMatrix(pts, canvasSize); 
    
    for j = 1:size(connectionMatrix, 1)
        
        currPosition = connectionMatrix(j,:); 
        IndsAtRisk = connectionMatrix(j, 1:nnz(currPosition)); 
        for k = 1:length(IndsAtRisk)
            if (states(currPosition(k)) == 1) 
                for l = 1:length(IndsAtRisk)
                    if(k~=l && rand < beta)
                        states(IndsAtRisk(l)) = 1;
                    end
                end
            end
        end
    end
                        
    
    
    
    for j = 1:populationSize        
        if d < rand
            pts(j,:) = Move(pts(j,:)); 
        end
    end
    
    set(plotHandle,'XData',pts(:,1));
    set(plotHandle,'YData',pts(:,2));
    drawnow

end

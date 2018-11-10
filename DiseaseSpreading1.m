clc

d = 0.7; 
beta = 0.7;
gamma = 0.01;

canvasSize = 100; 
populationSize = 2000; 
nrInfected= 1; 
nrOfItterations = 1000; 

startPositions = randi(canvasSize,populationSize,2); 
states = Outbrake(populationSize, nrInfected);

sirVec = [sum(states(:) == 1) sum(states(:) == 2) sum(states(:) == 3)]; 
ittVec = 1; 
    
subplot(1,2,1); 
plotHandle1 = plot(ittVec, sirVec); 
pbaspect([1 1 1]); 

subplot(1,2,2);
plotHandle2 = scatter(startPositions(:,1), startPositions(:,2), 5, states,'filled'); 
pbaspect([1 1 1]); 
xlim([0 canvasSize]);
ylim([0 canvasSize]);
colormap([0 0 1; 1 0 0; 0 1 0]); 

positions = startPositions; 

infection = true; 
itt = 1; 
while (infection) 
    
    itt = itt+1; 
    
    connectionMatrix = ConnectionMatrix(positions, canvasSize); 
    
    for j = 1:size(connectionMatrix, 1)        
        currPosition = connectionMatrix(j,:); 
        IndsAtRisk = connectionMatrix(j, 1:nnz(currPosition)); 
        for k = 1:size(IndsAtRisk,2)
            if(states(IndsAtRisk(k)) == 2 && rand < beta) 
                for l = 1:size(IndsAtRisk,2)
                    if(l ~= k && states(IndsAtRisk(l)) == 1) 
                        states(IndsAtRisk(l)) = 2; 
                    end 
                end 
            end
        end
                
    end
    
    for j = 1:populationSize
        
        if(states(j) == 2 && rand < gamma) 
            states(j) = 3; 
        end 
        
    end                         
    
    for j = 1:populationSize        
        if d < rand
            positions(j,:) = Move(positions(j,:), canvasSize); 
        end
    end
    
    ittVec = [ittVec; itt];
    sirVec = [sirVec; sum(states(:) == 1) sum(states(:) == 2) sum(states(:) == 3)];
    
    for i = 1:3
    set(plotHandle1(i), 'XData', ittVec, 'YData', sirVec(:,i)); 
    end 
    
    set(plotHandle2,'XData',positions(:,1));
    set(plotHandle2,'YData',positions(:,2));
    set(plotHandle2,'CData',states);
    drawnow
    
    
    if(sum(states(:) == 2) == 0) 
        infection = false; 
    end
end

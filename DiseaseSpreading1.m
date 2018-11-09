clc

d = 0.8; 
beta = 0.6;
gamma = 0.01;

canvasSize = 100; 
nrOfInds = 1000; 
nrOfItterations = 1000; 

startPositions = floor(rand(nrOfInds, 2)*canvasSize); 
states = zeros(nrOfInds, 1); 

plotHandle = plot(startPositions(:,1), startPositions(:,2), '.'); 
xlim([0 canvasSize]);
ylim([0 canvasSize]);

pts = startPositions; 

for i = 1:nrOfItterations
    
    connectionMatrix = ConnectionMatrix(pts, canvasSize); 
    
    
    
    for j = 1:nrOfInds        
        if d < rand
            pts(j,:) = Move(pts(j,:)); 
        end
    end
    
    set(plotHandle,'XData',pts(:,1));
    set(plotHandle,'YData',pts(:,2));
    drawnow

end

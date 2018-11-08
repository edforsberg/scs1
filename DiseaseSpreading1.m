clc
canvasSize = 100; 
nrOfInds = 1; 
nrOfItterations = 1000; 

d = 0.3; 

startPositions = rand(nrOfInds, 2)*canvasSize; 

plotHandle = plot(startPositions(:,1), startPositions(:,2), '.'); 
xlim([0 canvasSize]);
ylim([0 canvasSize]);

pts = startPositions; 

for i = 1:nrOfItterations
    
    for j = 1:nrOfInds        
        if d < rand
            pts(j,:) = Move(pts(j,:)); 
        end
    end
    
    set(plotHandle,'XData',pts(:,1));
    set(plotHandle,'YData',pts(:,2));
    drawnow

end

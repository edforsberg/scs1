clc

d = 1; 
beta = 0.7;
gamma = 0.01;

ratio = sprintf('beta/gamma ratio is \n %f', beta/gamma);
disp(ratio); 

canvasSize = 100; 
populationSize = 1; 
nrInfected = 0; 
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

xData = []; 
yData = [];
cData = []; 

while (true) 
    
    itt = itt+1; 
    
    connectionMatrix = ConnectionMatrix(positions, canvasSize); 
    
    states = Spread(connectionMatrix,states,beta);  
    states = Recover(states, gamma);                        
    positions = Move(positions, canvasSize,d); 
    
    xData = [xData; positions(:,1)]; 
    yData = [yData; positions(:,2)]; 
    cData = [cData; states]; 
    
    ittVec = [ittVec; itt];
    sirVec = [sirVec; sum(states(:) == 1) sum(states(:) == 2) sum(states(:) == 3)];
    
    for i = 1:3
    set(plotHandle1(i), 'XData', ittVec, 'YData', sirVec(:,i)); 
    end 
    
    set(plotHandle2,'XData',xData,'YData',yData,'CData',cData);
    %set(plotHandle2,'YData',yData);
    %set(plotHandle2,'CData',states);
    drawnow    
    
    if(sum(states(:) == 2) == 0) 
        infection = false; 
    end
end

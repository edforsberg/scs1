clc

% local spreading 
% d = 0.8; 
% beta = 0.4;
% gamma = 0.015;

%global spreading 
d = 0.8; 
beta = 0.7;
gamma = 0.01;


ratio = sprintf('beta/gamma ratio is \n %f', beta/gamma);
disp(ratio); 

canvasSize = 100; 
populationSize = 1000; 
nrInfected= 1; 
nrOfItterations = 1000; 

startPositions = randi(canvasSize,populationSize,2); 
states = Outbrake(populationSize, nrInfected);

sirVec = [sum(states(:) == 1) sum(states(:) == 2) sum(states(:) == 3)]; 
ittVec = 1; 
    
subplot(1,2,2); 
plotHandle1 = plot(ittVec, sirVec); 
set(plotHandle1(1), 'color', 'blue'); 
set(plotHandle1(2), 'color', 'red'); 
set(plotHandle1(3), 'color', 'green');
pbaspect([1 1 1]); 
title('d = 0.8, beta = 0.7, gamma = 0.01');
xlabel('Time step') 
ylabel('Nr of Agents') 


subplot(1,2,1);
plotHandle2 = scatter(startPositions(:,1), startPositions(:,2), 5, states,'filled'); 
pbaspect([1 1 1]); 
xlim([0 canvasSize]);
ylim([0 canvasSize]);
colormap([0 0 1; 1 0 0; 0 1 0]); 
title('t = 400, global spreading')
xlabel('x') 
ylabel('y') 

positions = startPositions;
infection = true; 
itt = 1; 

while (infection) 
    
    itt = itt+1; 
    
    connectionMatrix = ConnectionMatrix(positions, canvasSize); 
    
    states = Spread(connectionMatrix,states,beta);  
    states = Recover(states, gamma);                        
    positions = Move(positions, canvasSize,d); 
    
    ittVec = [ittVec; itt];
    sirVec = [sirVec; sum(states(:) == 1) sum(states(:) == 2) sum(states(:) == 3)];
    
    for i = 1:3
    set(plotHandle1(i), 'XData', ittVec, 'YData', sirVec(:,i));    
    end 
    drawnow 
    
    if(itt<400)
    set(plotHandle2,'XData',positions(:,1));
    set(plotHandle2,'YData',positions(:,2));
    set(plotHandle2,'CData',states);
    drawnow    
    end
    
    if(sum(states(:) == 2) == 0) 
        infection = false; 
    end
end

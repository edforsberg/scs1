
ratioVec = csvread('ratioVec4');
betaVec = csvread('betaVec4');
recoverRatioMat = csvread('recoverRatioMat4');
%%
surf(ratioVec(1:18), betaVec, recoverRatioMat(:,1:18)); 

axis tight; 

pbaspect([1 1 1]);
title('d = 0.8, nrAvg = 20, initAff = 1%, popSize = 1000');
xlabel('R0'); 
ylabel('beta');  
zlabel('Rinf'); 
% [x,y]=ginput   % click on the location you want+ Return
% text(x,y,'0.2<beta<0.95, 0.512<R0<106.25');


xLimits = get(gca,'XLim');  %# Get the range of the x axis
yLimits = get(gca,'YLim');  %# Get the range of the y axis
zLimits = get(gca,'ZLim');
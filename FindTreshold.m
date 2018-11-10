function treshold = FindTreshold(recoverRatioVec, betaRatioVec) 

pol = polyfit(betaRatioVec,recoverRatioVec,3); 
dpol = polyder(pol); 
dpol = [dpol(1:2)  dpol(3)+1]; 
r = (roots(dpol)); 
treshold =  polyval(dpol,r(1)); 


end 
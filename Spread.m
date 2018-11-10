function states = Spread(connectionMatrix,states,beta)


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
    
end
function states = Recover(states, gamma)


for j = 1:size(states,1)        
        if(states(j) == 2 && rand < gamma) 
            states(j) = 3; 
        end         
end    
    
end
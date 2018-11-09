classdef Individual
    properties
        Position
        State
    end
    
    methods 
        function population = InitializePopulation(nrOfIndividuals, canvasSize) 
            
            population = []; 
            
            for i = 1:nrOfIndividuals
                
                currInd = Individual
    
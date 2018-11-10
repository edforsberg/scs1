function states = Outbrake(populationSize, nrInfected)

states = ones(populationSize, 1);

i = 1;
while (i <= nrInfected)
    
    r = randi(populationSize);
    if (states(r) == 1)
        states(r) = 2;
    else
        i = i-1;
    end
    i = i+1;
end
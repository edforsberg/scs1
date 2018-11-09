function states = Outbrake(populationSize, nrInfected)

states = zeros(populationSize, 1);

i = 1;
while (i <= nrInfected)
    
    r = randi(populationSize);
    if (states(r) == 0)
        states(r) = 1;
    else
        i = i-1;
    end
    i = i+1;
end
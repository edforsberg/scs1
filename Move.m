function movedPoints = Move(positions, canvasSize, d)

movedPoints = zeros(size(positions));

for i = 1:size(positions,1)
    
    movedPoint = positions(i,:);
    
    if d > rand
        a = rand;
        if a < 0.25
            movedPoint(1) = movedPoint(1) -1;
        elseif a < 0.5
            movedPoint(1) = movedPoint(1) +1;
        elseif a < 0.75
            movedPoint(2) = movedPoint(2) -1;
        else
            movedPoint(2) = movedPoint(2) +1;
        end
    end
    
    if(movedPoint(1) < 1 || movedPoint(2) < 1 || movedPoint(1) > canvasSize || movedPoint(2) > canvasSize)
        movedPoints(i,:) = positions(i,:);
    else
        movedPoints(i,:) = movedPoint;
    end
    
end

end
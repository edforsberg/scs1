function movedPoint = Move(point, canvasSize)

originalPoint = point; 
movedPoint = point;
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

if(movedPoint(1) < 1 || movedPoint(2) < 1 || movedPoint(1) > canvasSize || movedPoint(2) > canvasSize) 
    movedPoint = originalPoint;
end

end
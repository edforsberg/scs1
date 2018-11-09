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

if(point(1) < 1 || point(2) < 1 || point(1) > canvasSize || point(2) > canvasSize)    
    movedPoint = originalPoint;
end

end
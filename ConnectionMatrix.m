function connectionMatrix = ConnectionMatrix(points, canvasSize)

nrOfPts = length(points);

matrix = zeros(canvasSize^2, 2);

a = 3;
for i = 1:nrOfPts
    
    position = canvasSize*(points(i,2)-1)+points(i,1);
    
    try 
    if (matrix(position,1) == 0)
        
        matrix(position,1) = i;
        
    elseif(matrix(position,2) == 0)
        matrix(position,2) = i;
    else
        try
            matrix(position,a) = i;
            a = 3;
        catch
            matrix = [matrix zeros(canvasSize^2, 1)];
            a = a+1;
        end
    end
    catch 
        disp(position);
    end 
    
end

connectionMatrix = [];

for i = 1:canvasSize^2
    if (matrix(i,2) ~= 0)
        connectionMatrix(end+1,:) = matrix(i,:);
    end
end

end
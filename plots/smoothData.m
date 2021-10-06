function res = smoothData(data, windowSize)
% Smoothens data using a filter of the given windowSize
    res = filter(ones(1,windowSize)/windowSize,1,data);
    
end
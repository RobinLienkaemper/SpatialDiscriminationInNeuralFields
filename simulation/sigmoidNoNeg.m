function res = sigmoidNoNeg (xVal, beta, treshhold) 

% Get Sigmoid value of treshhold
trs = sigmoid(treshhold, beta, treshhold);

res = sigmoid(xVal, beta, treshhold);
res(res <= trs) = 0;
res(res > trs) = res (res > trs) - trs;
    
end
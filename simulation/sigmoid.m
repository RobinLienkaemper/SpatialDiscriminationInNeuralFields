 function s = sigmoid(x,beta,x0)

 s = 1./ (1 + exp(-beta*(x-x0)));

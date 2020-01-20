function [J, grad] = costFunctionReg(theta, X, y, lambda)
m = length(y); % number of training examples
n = length(theta);

J = 0;
grad = zeros(size(theta));

for i = 1:m
  if(y(i)>=0.7)
    y(i)==1;
    continue
  endif
  y(i)==0;
endfor

hx = sigmoid(X*theta);
J = -1*sum(y.*log(hx) + (1-y).*log(1-hx))/m+lambda/(2*m)*sum(theta(2:n).^2);
oldGrad = ((hx - y).*X);
theta(1)=0;
grad = sum(oldGrad/m,1)'+lambda/m*theta;
% =============================================================

end

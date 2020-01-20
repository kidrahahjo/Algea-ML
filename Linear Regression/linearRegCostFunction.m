function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

m = length(y); 
s = size(theta);
J = 0;
grad = zeros(s);


k = (X*theta - y);
sigm = sum(k.*k);
J = 1/(2*m)*sigm + lambda/(2*m)*sum(theta(2:s,:).*theta(2:s,:));
grad = 1/m*(X'*k);
grad(2:s,:) = grad(2:s,:) + lambda/m*theta(2:s,:);

grad = grad(:);

end

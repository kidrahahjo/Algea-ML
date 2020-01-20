function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)
m = size(X, 1)

error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
  Xtrain = X(1:i,:);
  yTrain = y(1:i);
  [theta] = trainLinearReg(Xtrain,yTrain,lambda);
  J = linearRegCostFunction(Xtrain,yTrain,theta,0);
  error_train(i) = J;
  J = linearRegCostFunction(Xval,yval,theta,0);
  error_val(i) = J;
  
endfor

end

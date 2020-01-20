function [X_poly] = polyFeatures(X, p)
m = size(X,1);
X_poly = X; 

for i = 1:p-1
  X_poly =[X_poly X.^i]; 
endfor

end

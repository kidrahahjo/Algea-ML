function [U, S] = pca(X)
[m, n] = size(X);

U = zeros(n);
S = zeros(n);


[U,S,V] = svd(1/m*X'*X);

end

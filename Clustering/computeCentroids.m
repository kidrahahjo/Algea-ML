function centroids = computeCentroids(X, idx, K)
[m n] = size(X);

centroids = zeros(K, n);

numberOfOcc = zeros(K,1);

for i = 1:K
  numberOfOcc(i) = sum(idx == i);
endfor

for i = 1:m
  centroids(idx(i),:) += X(i,:);
endfor

centroids = centroids./numberOfOcc;

end


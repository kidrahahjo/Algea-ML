function plotProgresskMeans(X, centroids, previous, idx, K, i)

plotDataPoints(X, idx, K);


plot(centroids(:,1), centroids(:,2), 'x', ...
     'MarkerEdgeColor','k', ...
     'MarkerSize', 10, 'LineWidth', 3);

for j=1:size(centroids,1)
    drawLine(centroids(j, :), previous(j, :));
end
#}
xlabel('COD Concentration');
ylabel('Sugar Concentration');
title(sprintf('Clustering'));

end


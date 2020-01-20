% Created by Hardik Ojha


%% =========================== Loading the data ================================
clear; close all;
load('dataset.txt');
m = size(dataset,1);
y = dataset(:,6:7);
y_test = dataset(17:m,6:7);


%% =========================== Analyzing the data ==============================
plotData(y(:,2),y(:,1));
title('Plotting the points');
xlabel('COD Concentration');
ylabel('Sugar Concentration');

fprintf('Program paused. Press enter to continue.\n');
kbhit;


%% ========================= Implementing k-Means ==============================
K = 3;

max_iters = 30;

centroids = zeros(K, size(y, 2));
rdm = randperm(size(y,1),K);
initial_centroids = y(rdm,:);

[centroids, idx] = runkMeans(y, initial_centroids, max_iters, true);

fprintf('\nK-Means Done.\n\n');




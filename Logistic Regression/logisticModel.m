% Created by Hardik Ojha


%% =========================== Loading the data ================================
clear ; close all; clc

load('dataset.txt');
m = size(dataset);

X = dataset(1:16,1:5);
y = dataset(1:16,6:7);

X_test = dataset(17:m,1:5);
y_test = dataset(17:m,6:7);


%% =========================== Plotting the data ================================
[X, mu, sigma] = featureNormalize(X);
[U, S] = pca(X);
K = 1;
Z = projectData(X, U, K);

[y_norm, muY, sigmaY] = featureNormalize(y);
G = sigmoid(y_norm); %Probability function
y_test = (y_test-muY)/sigmaY;
g_test = sigmoid(y_test);

plot(Z, G(:,1),'bo');

xlabel('Experimental Details')
ylabel('Probability 1')

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ====================== Regularized Logistic Regression ======================
initial_theta = randn(size(X, 2), 1);
lambda = 1;
[cost, grad] = costFunctionReg(initial_theta, X, G(:,1), lambda);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, G(:,1), lambda)), initial_theta, options);
  p = predict(theta, (X_test-mu)./sigma);

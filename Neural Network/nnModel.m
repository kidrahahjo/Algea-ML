% Created by Hardik Ojha


%% =========================== Loading the data ================================
clear; close all;
load('dataset.txt');
X = dataset(1:16,1:5);
[X, mu, sigma] = featureNormalize(X);
y = dataset(1:16,6:7);
##[y, muY, sigmaY] = featureNormalize(y);
X_test = dataset(17:end,1:5);
X_test = (X_test .- mu)./sigma;
y_test = dataset(17:end,6:7);


%% ======================= Training Neural Netowork ============================
fprintf('\nTraining Neural Network... \n')

input_layer_size  = 5;  
hidden_layer_size = 2;
num_labels = 2;   



lambda = 10;
[nn_params] = trainNeuralNetwork(X, y, lambda,input_layer_size,hidden_layer_size,num_labels);


Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));


fprintf('\nProgram paused. Press enter to continue.\n');
kbhit;

%% ========================= Implement Predict =================================

p = predict(Theta1, Theta2, X_test);
m = size(X_test,1);
for i = 1:m
    fprintf('For Test Case %f Sugar Conc(in mg/g) is %f and expected conc is %f \n',int8(i),p(i,1),y_test(i,1));
    fprintf('\t\t and COD Conc(in mg/g) is %f expected conc is %f \n',p(i,2),y_test(i,2));
endfor

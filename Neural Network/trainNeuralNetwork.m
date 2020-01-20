function [theta] = trainNeuralNetwork(X, y, lambda,input_layer_size,hidden_layer_size,num_labels)


% Initialize Theta
Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
nn_params = [Theta1(:) ; Theta2(:)];   

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('MaxIter', 200);

% Minimize using fmincg
theta = fmincg(costFunction, nn_params, options);

end

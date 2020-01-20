function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)


Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1);
a1 = X;


X = [ones(m,1),X];


J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
del2 = zeros(hidden_layer_size,1);
del3 = zeros(num_labels,1);

t1 = Theta1(:,2:input_layer_size+1);
t2 = Theta2(:,2:hidden_layer_size+1);
D2 = zeros(num_labels,hidden_layer_size+1);
D1 = zeros(hidden_layer_size,input_layer_size+1);


for j = 1:m
  activation = Theta1*(X(j,:)');
  a2=activation;
  activation = [ones(1,1);activation];
  output = Theta2*activation;
  costi = 1/2*sum((output-y(j)).^2);
  J = J + costi;
  del3 = output - y(j);
  del2 = (t2'*del3).*(activation(2:hidden_layer_size+1,:).*(1-activation(2:hidden_layer_size+1,:)));
  D2 = D2 + del3*activation';
  D1 = D1 + del2*X(j,:);
endfor


Theta1_grad = 1/m*D1 + lambda*Theta1/m;
Theta1_grad(:,1) = 1/m*D1(:,1);

Theta2_grad = 1/m*D2 + lambda*Theta2/m;
Theta2_grad(:,1) = 1/m*D2(:,1);

J = (-1.0/m)*J;
reg = lambda/(2*m)*(sum(sum(t1.*t1)) + sum(sum(t2.*t2)));
J = J + reg;


grad = [Theta1_grad(:) ; Theta2_grad(:)];


end

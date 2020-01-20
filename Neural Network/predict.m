function p = predict(Theta1, Theta2, X)

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

h1 = [ones(m, 1) X] * Theta1';
h2 = [ones(m, 1) h1] * Theta2';
p = h2;

end

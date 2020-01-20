% Created by Hardik Ojha


%% =========================== Loading the data ================================
clear; close all;
load('dataset.txt');
m = size(dataset);
X = dataset(1:16,1:5);
y = dataset(1:16,6:7);
X_test = dataset(17:m,1:5);
y_test = dataset(17:m,6:7);


%========================== Polynomial Regression ==============================
p = 2;
X = polyFeatures(X,p);
X_test = polyFeatures(X_test,p);


%% ========================== Analyzing the data ===============================
[y_norm, muY, sigmaY] = featureNormalize(y);
[Uy, Sy] = pca(y_norm);
K = 1;
Y = projectData(y_norm, Uy, K);

[X, mu, sigma] = featureNormalize(X);
[U, S] = pca(X);
K = 1;
Xn = projectData(X, U, K);
 
plotData(Xn(1:16,:),Y(1:16,:));
title('Plotting the points');
xlabel('Experimental Data');
ylabel('Measure of breakage');

fprintf('Program paused. Press enter to continue.\n');
kbhit;



%=========================== Fitting the curve =================================
lambda = 0;
[theta] = trainLinearReg([ones(size(X,1), 1) X], Y, lambda);
%theta1 = pinv(X'*X)*X'*Y; 
plotData(Xn(1:16,:),Y(1:16,:));
xlabel('Experimental Data');
ylabel('Measure of breakage');
hold on;
plot(Xn, [ones(size(X,1), 1) X]*theta, '-', 'LineWidth', 2)
hold off;

fprintf('Program paused. Press enter to continue.\n');
kbhit;
%p = 2; %Polynomial Feature
% Map X onto Polynomial Features and Normalize


%========== Checking whether increasing examples would help or not ============= 
[error_train, error_val] = ...
    learningCurve(X(1:12,:), Y(1:12,:), X(13:16,:), Y(13:16,:), lambda);
plot(1:12, error_train, 1:12, error_val);

title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples');
ylabel('Error');
axis([0 13 0 100]);
legend('Train', 'Cross Validation')

fprintf('Polynomial Regression (lambda = %f)\n\n', lambda);
fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:12
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end

fprintf('Program paused. Press enter to continue.\n');
kbhit;


%============================= Learning Lamda ==================================
[lambda_vec, error_train, error_val] = ...
   validationCurve(X(1:12,:), Y(1:12,:), X(13:16,:), Y(13:16,:));

plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end

[minval,r] = min(abs(error_train-error_val));

lambda = lambda_vec(r);

[theta] = trainLinearReg([ones(size(X,1), 1) X], Y, lambda);
fprintf('Your preferred lambda is (lambda = %f)\n', lambda_vec(r));

fprintf('Program paused. Press enter to continue.\n');
kbhit;

plotData(Xn,Y);
xlabel('Experimental Data');
ylabel('Measure of breakage');
title('Final Plot')
hold on;
plot(Xn, [ones(size(X,1), 1) X]*theta, '-', 'LineWidth', 2)
hold off;

fprintf('Program paused. Press enter to continue.\n');
kbhit;


%============================= Testing the test set ============================
X_test = (X_test.-mu)./sigma;
%X_test = projectData(X_test, U, K);
yExp = [ones(size(X_test,1), 1) X_test]*theta;
Y_rec = recoverData(yExp,Uy,K);
yExp = (Y_rec.*sigmaY).+muY;

for i = 17:m
    fprintf('For Test Case %f Sugar Conc(in mg/g) is %f and expected conc is %f \n',i-17+1 ,yExp(i-17+1,1),y_test(i-17+1,1));
    fprintf('\t and COD Conc(in mg/g) is %f expected conc is %f \n',yExp(i-17+1,2),y_test(i-17+1,2));
end





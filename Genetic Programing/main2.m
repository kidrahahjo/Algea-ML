% Simple example for GP-OLS
%  Dynamical input-output model identification
% (Append the GpOls directory to the path)
%
clear all
%Simulation of a dynamic system and generates input/output data
load('dataset.txt');
X = dataset(1:16,1:5);
Y = dataset(1:16,6);
##t = [0:0.2:20]';
u = sin(X/2)-0.5;
u = u + randn(size(u))*0.1;
%Adds some simulated 'measurement noise' to the output
%Select the maximum input and output order for identification
uorder = 5;
yorder = 5;
%Regressors and outputs for identification
%GP equation symbols
symbols{1} = {'+','*'};
for i = 1:yorder,
  symbols{2}{i} = sprintf('x%i',i);
end
for j = 1:uorder,
  symbols{2}{i+j} = sprintf('sin(x%i)',j);
end


%Initial population
popusize = 40;
maxtreedepth = 5;
popu = gpols_init(popusize,maxtreedepth,symbols);
%first evaluation
opt = [0.8 0.7 0.3 2 2 0.2 25 0.01 1 0];
popu = gpols_evaluate(popu,[1:popusize],X,Y,[],opt(6:9));
%info
disp(gpols_result([],0));
disp(gpols_result(popu,1));
%GP loops
for c = 2:20,
  %iterate 
  popu = gpols_mainloop(popu,X,Y,[],opt);
  %info  
  disp(gpols_result(popu,1));
end
%Result
[s,tree] = gpols_result(popu,2);
disp(s);
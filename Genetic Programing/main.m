% Simple example for GP-OLS
%  Static function identification
% (Append the GpOls directory to the path)
%
clear all
%Regression matrix
#{
ndata = 100;
nvar = 3;
X = rand(ndata,nvar);
%Output vector (y = 10*x1*x2+5*x3)
Y = 10*X(:,1).*X(:,2) + 5*X(:,3);
Y = Y + randn(size(Y))*0.01; %some 'measurement' noise
#}
load('dataset.txt');
X = [dataset(1:16,1:5)];
##X = featureNormalize(X);
Y = dataset(1:16,6);
##[Y mu sigma] = featureNormalize(Y);
##X = [X sin(X) cos(X) log(X) exp(X)];
##X = [X sin(X)];
%symbols{1} = {'+','*','/','^','+cos','*cos','-cos','/cos','+sin','*sin','-sin','/sin','+tan','*tan','-tan','/tan','+log','*log','-log','/log','+exp','*exp','-exp','/exp'};

symbols{1} = {'+','*','/','sin'};
m = size(X,2);
%GP equation symbols
for i = 1:5,
  symbols{2}{i} = sprintf('x%i',i);
end
##for i = 1:5,
##  symbols{2}{5+i} = sprintf('sin(x%i)',i);
##end
##symbols{3} = {'sin','cos','log','exp'};

##symbols{2} = {'x1'};  %length(symbols{2}) = size(X,2) !

%Initial population
popusize = 1000;
maxtreedepth = 10;
popu = gpols_init(popusize,maxtreedepth,symbols);
%first evaluation

% Remark:
%     opt(1): ggap, generation gap (0-1)
%     opt(2): pc, probability of crossover (0-1)
%     opt(3): pm, probability of mutation (0-1)
%     opt(4): selection type (integer, see gpols_selection)
%     opt(5): rmode, mode of tree-recombination (1 or 2)
%     opt(6): a1, first penalty parameter
%     opt(7): a2, second penalty parameter (0 if there is not penalty)
%     opt(8): OLS treshhold real 0-1 or integer >= 2
%     opt(9): if == 1 -> polynomial evaluation
%     opt(10): if == 1 -> evaluate all indv.s not only new offsprings
%
opt = [0.8 0.5 0.5 2 1 0.2 30 0.05 1 0];
popu = gpols_evaluate(popu,[1:popusize],X,Y,[],opt(6:9));
%info
disp(gpols_result([],0));
disp(gpols_result(popu,1));
%GP loops
for c = 2:500,
  %iterate 
  popu = gpols_mainloop(popu,X,Y,[],opt);
  %info  
  disp(gpols_result(popu,1));
end
%Result
[s,tree] = gpols_result(popu,2);
disp(s);
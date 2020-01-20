function [Y,del] = soln(X,y,mu=0, sigma=0)
m = size(X,1);
Y = zeros(m,1);
Z = zeros(m,1);
del = zeros(m,1);
for i = 1:m
  x1 = X(i,1);
  x2 = X(i,2);
  x3 = X(i,3);
  x4 = X(i,4);
  x5 = X(i,5);
  Y(i) = 1.151865 * ((x1)/tan((x2)*(x4))) + 0.786789 * ((x3)/log(((x1)*(x4))/tan(x5))) +16.029434;
  Z(i)= ((x1)/tan((x4)*(x2)))+((x3)/log(((x1)*(x4))/tan(x5))) %92.05
  Y(i) = abs(Y(i));
  ##  Y(i) = abs(Y(i).*sigma .+ mu);
endfor

del = Y-y;

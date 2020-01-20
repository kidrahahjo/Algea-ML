function W = randInitializeWeights(L_in, L_out)

eps = 6^5/(L_in+L_out)^0.5;
W = rand(L_out, 1 + L_in)*2*eps - eps;

end

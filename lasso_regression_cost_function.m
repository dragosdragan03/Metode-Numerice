function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
 
   Error = 0;
   for i = 1 : rows(FeatureMatrix)
     h = 0;
    for j = 1 : columns(FeatureMatrix) % asta este pentru h(x)
       h = FeatureMatrix(i,j) * Theta(j + 1,1) + h;      
     endfor
     Error = (Y(i,1) - h )^2 + Error;
   endfor
   sum = sum(abs(Theta));
   Error = Error * 1/ (rows(FeatureMatrix)) + lambda * sum;
 
endfunction
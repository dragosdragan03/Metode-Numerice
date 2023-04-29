function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  
   Error = 0;
   for i = 1 : rows(FeatureMatrix)
     h = 0;
    for j = 1 : columns(FeatureMatrix)% asta este pentru h(x)
       h = FeatureMatrix(i,j) * Theta(j + 1,1) + h;      
     endfor
     Error = (h - Y(i,1))^2 + Error;
   endfor
   Error = Error * 1/ ( 2* rows(FeatureMatrix));
  % TODO: linear_regression_cost_function implementation
endfunction
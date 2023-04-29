function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
 
 b = FeatureMatrix' * Y;
 A = FeatureMatrix' * FeatureMatrix;
 Theta = zeros(columns(FeatureMatrix), 1);
 x = Theta;
 r_prev = b - A * x; %la momentul 0
 
 if !all(eig(A) > 0)
   Theta = zeros(columns(FeatureMatrix) + 1, 1);
 endif
 
 v_k = r_prev; % v la momentul 1
 tol = tol^2;
 k = 1;
 
 while k <= iter && r_prev' * r_prev > tol
   t = (r_prev' * r_prev)/(v_k' * A * v_k);
   x = x + t * v_k;
   r = r_prev - t * A * v_k;
   s = (r' * r)/(r_prev' * r_prev);
   v_k = r + s * v_k;
   k++;
   r_prev = r;
 endwhile
 
 Theta = x;
 Theta = [0;Theta];
 
 
endfunction
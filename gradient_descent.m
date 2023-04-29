function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  k = 1;
  sum = 0;
  Theta = zeros(columns(FeatureMatrix), 1);
 for l = 1 : iter
   h = FeatureMatrix * Theta;
    for k = 1:columns(FeatureMatrix)
      for i = 1 : rows(FeatureMatrix)
       Auxiliar(i, 1) = (h(i, 1) - Y(i, 1)) * FeatureMatrix(i,k); %vector coloana
      endfor
      s = 0;
     for i = 1:rows(Auxiliar)
       s = s + Auxiliar(i, 1);
     endfor
    Aux(k,1) = s/rows(Auxiliar);
   endfor   
   Theta = Theta - alpha*Aux;
 endfor
  Theta = [0;Theta];
  % TODO: gradient_descent implementation
endfunction
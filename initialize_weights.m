function [matrix] = initialize_weights(L_prev, L_next)
  
  e = sqrt(6)/sqrt(L_prev + L_next)
  e_negativ = -e;
  matrix = e - (e - e_negativ)*rand(L_next, L_prev + 1);
  
endfunction

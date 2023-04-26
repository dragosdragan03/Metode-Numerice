function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  
  steps = 0;
  x = zeros(rows(G), 1);
  
  while steps <= max_steps
    x = G*x0 + c;
    err = norm(x-x0);
    x0 = x;
    steps++;
    
    if err < tol
      break;

    endif
  endwhile
  
endfunction

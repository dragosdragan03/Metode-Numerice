function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  
  m = rows(X); 
  perm  = randperm(m);
  X = X(perm, :);
  y = y(perm, :);
  
  X_train = X(1 : percent * rows(X), :);
  X_test = X(percent * rows(X) + 1 : m, :);
  
  y_train = y(1 : percent * rows(y), :);
  y_test = y(percent * rows(y) + 1 : m, :);
  
endfunction

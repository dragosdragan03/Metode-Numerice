function [decoded_path] = decode_path(path, lines, cols)
  
   decoded_path = zeros(length(path) - 1, 2);
   
  for i = 1:length(path) - 1
    row = floor((path(i,1)-1) / cols) + 1;
    col = mod(path(i,1)-1, cols) + 1;
    decoded_path(i, :) = [row, col];
  endfor
  
endfunction

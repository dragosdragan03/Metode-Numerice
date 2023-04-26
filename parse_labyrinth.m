function [Labyrinth] = parse_labyrinth(file_path)
  in = fopen(file_path, "r");
  m = fscanf(in, "%d", 1);
  n = fscanf(in, "%d", 1); %dimensiunile fisierului
  
  for i = 1:m
    for j = 1:n
      Labyrinth(i,j) = fscanf(in, "%d", 1);
    endfor
  endfor
  fclose(in);
endfunction

function [Y, InitialMatrix] = parse_data_set_file(file_path)

    in = fopen(file_path, "r");
    m = fscanf(in, "%d", 1);
    n = fscanf(in, "%d", 1);
    InitialMatrix = cell(m,n); % aloc o matrice cu mxn celule
    
  for i = 1 : m
    for j = 1: n
      if j == 1
        Y(i, 1) = fscanf(in, "%d", 1);
      endif
     InitialMatrix(i, j) = fscanf(in, "%s", 1);
    endfor
  endfor
  
  fclose(in);
endfunction
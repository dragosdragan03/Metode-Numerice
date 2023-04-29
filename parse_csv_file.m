function [Y, InitialMatrix] = parse_csv_file(file_path)
  
  in = fopen(file_path, "r");
  line = fscanf(in, "%s", 1);%e prima linie din fisier cu headul
  line = fscanf(in, "%s", 1); %prima linie de trebuie sa o retin
  InitialMatrix = cell();
  Y = cell();
  i = 1;
  while line != -1
    [token, rem] = strtok(line, ',');
    Y(i,1) = strtok(line, ',');
    j = 1;
    [token, rem] = strtok(rem, ',');
    while !isempty(token)
      InitialMatrix(i,j) = token;
      j++;
      [token, rem] = strtok(rem, ',');
    endwhile
    line = fscanf(in, "%s", 1);
    i++;
  endwhile
 Y = cell2mat(cellfun(@str2double, Y, 'UniformOutput', false));
endfunction
function [Adj] = get_adjacency_matrix(Labyrinth)
  
  m = rows(Labyrinth);
  n = columns(Labyrinth);
  
  Adj = sparse(m, n);
%  Adj = zeros(m * n + 2);
  contor = 1;
  
  for i = 1 : m
    for j = 1 : n
    bin = dec2bin(Labyrinth(i,j), 4);
      if  mod(str2double(bin(end)), 10) == 0 %daca b0 este 0 inseamna ca n am perete la stanga
        if j == 1
          Adj(contor, m * n + 2) = 1; %coloana de LOSE
        else
          Adj(contor, contor - 1) = 1;
        endif
      endif
      
      if  mod(str2double(bin(end - 1)), 10) == 0 %daca b1 este 0 inseamna ca n am perete in dreapta
        if j == n
          Adj(contor, m * n + 2) = 1;
        else
          Adj(contor, contor + 1) = 1;
        endif
      endif
      
      if  mod(str2double(bin(end - 2)), 10) == 0 %daca b2 este 0 inseamna ca n am perete in jos
        if i == m
          Adj(contor, m * n + 1) = 1; %coloana de WIN
        else
          Adj(contor, contor + n) = 1;
        endif
      endif
      
      if  mod(str2double(bin(end - 3)), 10) == 0 %daca b3 este 0 inseamna ca n am perete in sus
        if i == 1
          Adj(contor, m * n + 1) = 1; %coloana de WIN
        else
          Adj(contor, contor - n) = 1;
        endif
      endif
      contor++;
    endfor
  endfor
  
    Adj(m * n + 2, m * n + 2) = 1;
    Adj(m * n + 1, m * n + 1) = 1;

endfunction

function [Link] = get_link_matrix(Labyrinth)
  
 
  Link = get_adjacency_matrix(Labyrinth);
  m = rows(Link);
  n = columns(Link);
  
  for i = 1:m
      elem = nnz(Link(i,:)); %elemente diferite de 0
    for j = 1:n
      if Link(i,j) != 0
      Link(i,j) = Link(i,j) / elem;
      endif
    endfor
  endfor

endfunction

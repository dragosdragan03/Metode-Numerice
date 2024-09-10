function [path] = heuristic_greedy(start_position, probabilities, Adj)

  path(1,1) = start_position;
  probabilities(rows(Adj) - 1,1) = 1;
  visited(1, 1) = start_position;
  j = 2;
  index_vizitati = 2;
  while rows(path)
    position = path(rows(path),1); % iau ultimul nod din path
    
    if position == columns(Adj) - 1
      break;      
    endif
    
    dif_zero = nnz(Adj(position,1:columns(Adj) -1)); %cate noduri am
    x = find(Adj(position,1:columns(Adj) -1)); %vector care returneaza idexii nodurilor
   vecini = setdiff(x, visited); %retin numerele nodurilor nevizitate
   k = length(vecini);
    
     if k == 0 %nu mai am nod nevizitat
      path = path(1:end-1,1); %sterge ultimul element 
      j--;
     endif
     
     if k > 0 %am noduri nevizitate
       %retin vecinul nevizitat cu probabilitatea cea mai mare
       neigh = find(probabilities == max(probabilities(vecini, 1))); 
       visited(1, index_vizitati) = neigh;
       path(j, 1) = neigh;
       index_vizitati++;
       j++;
     endif
  endwhile
endfunction

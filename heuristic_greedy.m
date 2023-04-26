function [path] = heuristic_greedy(start_position, probabilities, Adj)

  path(1,1) = start_position;
  probabilities(rows(Adj) - 1,1) = 1;
  visited(1, 1) = start_position;
  j = 2;
  index_vizitati = 2;
  while isempty(path) != 1
    position = path(rows(path),1); % iau ultimul nod din path
    
    if position == 10
      break;      
    endif
    
    k = 1; %presupun ca n am niciun nod nevizitat
    dif_zero = nnz(Adj(position,1:columns(Adj) -1)); %cate noduri am
    x = find(Adj(position,1:columns(Adj) -1)); %vector care returneaza idexii nodurilor
    for i = 1 : dif_zero
      if ismember(x(i), visited) == 0 %inseamna ca am nod nevizitat
        vecini(k, 1) = x(i); %retin numerele nodurilor
        k++;
      endif
    endfor 
    
     if k == 1 %nu mai am nod nevizitat
      path = path(1:end-1,1); %sterge ultimul element 
      j--;
     endif
     
     if k > 1 %am noduri nevizitate
       for i = 1:k-1
         index_probabilitati(i, 1) = probabilities(vecini(i,1), 1);
       endfor
       neigh = find(probabilities == max(index_probabilitati));
       visited(1, index_vizitati) = neigh;
       path(j, 1) = neigh;
       index_vizitati++;
       j++;
     endif
  endwhile
endfunction

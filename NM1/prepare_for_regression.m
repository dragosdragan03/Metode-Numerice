function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
 
  strings = cell(3,1);
  strings = {'semi-furnished'; 'unfurnished'; 'furnished'};
  FeatureMatrix = InitialMatrix;
  
 %parucrg pe linii matricea mea
 j = 1;
 while j <= columns(FeatureMatrix)
   ok = 0;
  for i = 1 : rows(FeatureMatrix)
    if (ismember(FeatureMatrix{i,j}, strings) == 1 && ok == 0)
      FeatureMatrix(:, end+1) = {0};
      FeatureMatrix = [FeatureMatrix(:,1:j), repmat({''}, size(FeatureMatrix,1), 1), FeatureMatrix(:,j+1:end-1)];
     ok = 1;
    endif  
     %display(FeatureMatrix(i,j));
      if strcmp(FeatureMatrix{i,j}, 'no') == 1
        FeatureMatrix{i,j} = '0';
      endif
     if strcmp(FeatureMatrix{i,j}, 'yes') == 1
        FeatureMatrix{i,j} = '1';
     endif  
     
     if strcmp(FeatureMatrix{i,j}, 'semi-furnished') == 1
        FeatureMatrix{i,j} = '1'; 
        FeatureMatrix{i,j + 1} = '0';
     endif
     
      if strcmp(FeatureMatrix{i,j}, 'unfurnished') == 1
        FeatureMatrix{i,j} = '0';
        FeatureMatrix{i,j + 1} = '1';
     endif
     
      if strcmp(FeatureMatrix{i,j}, 'furnished') == 1
        FeatureMatrix{i,j} = '0';  
        FeatureMatrix{i,j + 1} = '0';        
      endif
      
    endfor
    if ok == 1
      j++;
    endif
    j++;
  endwhile
  FeatureMatrix = cellfun(@str2num, FeatureMatrix);
endfunction
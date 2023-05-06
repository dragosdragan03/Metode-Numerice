function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

   s1 = input_layer_size;
   s2 = hidden_layer_size;
   s3 = output_layer_size;
  Theta1 = reshape(params(1 : s2 * (s1 + 1)), s2, s1 + 1);
  Theta2 = reshape(params(1 : s3 * (s2 + 1), 1), s3, s2 + 1);
  delta_1 = zeros(rows(Theta1), columns(Theta1));
  delta_2 = zeros(rows(Theta2), columns(Theta2));
  for i = 1 : rows(X)
    
    a_1 = [1 ; X(i, :)'];
    z_2 = Theta1 * a_1
    a_2 = sigmoid(z_2);
    a_2 = [1; a_2];
    z = Theta2 * a_2;
    a = sigmoid(z);
    
    matrix(end+1,:) = a';
    
    a(y(i, 1), 1) = a(y(i, 1), 1) - 1;
    delta_2 = delta_2 + a * a_2';
    a = Theta2' * a .* [1 ; (sigmoid(z_2).*(1 - sigmoid(z_2)))];
    
    delta_1 = delta_1 + a * a_1';
    
    break;
    
   % matrix = matrix[1 : i, ];   
  endfor
    
  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
  
  % TODO: cost_function implementation

  % TODO1: get  and Theta2 (from params). Hint: reshape
  
  % TODO2: Forward propagation
  
  % TODO3: Compute the error in the output layer and perform backpropagation
  
  % TODO4: Determine the gradients
  
  % TODO5: Final J and grad

endfunction

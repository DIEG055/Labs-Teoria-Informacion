function [r_decode,d,errors] = decodificacion (r,P,H_t,S)
  
  r_decode = r; 
  n = size(r,1);
  m = size (H_t,1);
  
#Se decodifica el Sindrome

  errors = zeros(n, 1);
  # vector que almacena las posiciones donde hay error
  for i = 1:n
    for j = 1:m
      if (isequal( S(i,:), H_t(j,:)) == 1)
         errors(i,1) = j;
         break
      endif
    endfor
  endfor
  
#Se corrigen los errores
  for i = 1:n
    if errors(i,1) != 0
      r_decode(i,errors(i,1)) = !r_decode(i,errors(i,1));
    endif
  endfor
  
  d = r_decode(:, 1:size(P,2));
  
endfunction

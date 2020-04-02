function X = Sa(a)
  #--- Funcion Rectangular frecuencia ---
  #
  #---  VARIABLES ---
  # t = Vector del tiempo
  # a = Ancho de el intervalo de 1 desde cero
  # X = Vector resultado 

  if a == 0
    X=1;
  else 
    X=sin(a)./a;
  endif
  
  
 
 
endfunction
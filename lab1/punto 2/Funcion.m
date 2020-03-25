function X = Funcion(t,a)
  #--- Funcion Rectangular ---
  #
  #---  VARIABLES ---
  # t = Vector del tiempo
  # a = Ancho de el intervalo de 1 desde cero
  # X = Vector resultado 

  X = ( t < a ) & ( t > -a );
 
endfunction
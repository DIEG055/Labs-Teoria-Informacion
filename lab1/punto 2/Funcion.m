function X = Funcion(t,a)
  #--- Funcion Rectangular ---
  #
  #---  VARIABLES ---
  # t = Vector del tiempo
  # a = Ancho de el intervalo de 1 desde cero
  # X = Vector resultado 

  X=zeros(1,length(t));
  for i=1:length(t)
    if abs(t(i))<=a
      X(i)=1;
    endif
    
  endfor
  
 
 
endfunction
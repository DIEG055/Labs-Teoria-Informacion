function X = LPF(y,w1,td=0)
  #--- FILTRO LPF ---
  # Este filtro se comporta asi
  # 1, si -w1 <= y(i) <= w1 
  # 0, en otro caso
  #
  #---  VARIABLES ---
  # y = Vector de las frefuencia
  # w1 = Ancho de el filtro desde cero
  # X = Vector resultado del filtro
  
  len=length(y);
  y1=abs(y);
  X=zeros(1,len);
  for i=1:len
    if y1(i) <= w1
      X(i)=1+ exp(-j*y(i)*td);
    endif
  endfor
 
endfunction

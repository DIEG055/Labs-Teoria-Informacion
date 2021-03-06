function X = HPF(y,w1,td=0)
  #--- FILTRO HPF ---
  # Este filtro se comporta asi
  # 0, si -w1 < y(i) < w1 
  # 1, en otro caso
  #
  #---  VARIABLES ---
  # y = Vector de las frefuencia
  # w1 = Ancho de el filtro desde cero
  # X = Vector resultado del filtro

  len=length(y);
  y1=abs(y);
  X=zeros(1,len);
  for i=1:len
    if y1(i) >= w1
      X(i)=1+exp(-j*y(i)*td);
    endif
  endfor
 
endfunction

function X = BPF(y,w1,w2,td=0)
  #--- FILTRO BPF ---
  # Este filtro se comporta asi
  # 1, si -w1 <= y(i) <= -w2
  # 1, si w1 <= y(i) <= w2
  # 0, en otro caso
  #
  #---  VARIABLES ---
  # y = Vector de las frefuencia
  # w1 = Limite izq del filtro 
  # w2 = Limite der del filtro
  # X = Vector resultado del filtro
  
  len=length(y);
  y1=abs(y);
  X=zeros(1,len);
  for i=1:len
    if (y1(i) <= w2) && (y1(i) >= w1 )
      X(i)=1+exp(-j*y(i)*td);
    endif
  endfor
 
endfunction

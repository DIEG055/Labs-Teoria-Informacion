function y = primerPunto(inputstr)
  input = []
  for i=1 : length(inputstr)
    input(i)=str2num(inputstr(i))  
  endfor
  n = 6
  k = 3
  #Construyendo matriz generadora  
  Ik = eye(k)
  P = [1,0,1;1,1,1;1,1,0]
  Pt = transpose(P)
  G = cat(2,Ik,Pt)
  #Definiendo los posibles d_i
  d1 = [0,0,0]
  d2 = [0,0,1]
  d3 = [0,1,0]
  d4 = [0,1,1]
  d5 = [1,0,0]
  d6 = [1,0,1]
  d7 = [1,1,0]
  d8 = [1,1,1]
  #Calculando los Ci
  C1 = mod(d1*G,2)
  C2 = mod(d2*G,2)
  C3 = mod(d3*G,2)
  C4 = mod(d4*G,2)
  C5 = mod(d5*G,2)
  C6 = mod(d6*G,2)
  C7 = mod(d7*G,2)
  C8 = mod(d8*G,2)
  if length(input) == 3
    display("---------CODIFICACION---------")
    switch (input)
      case d1
        display(C1)
      case d2
        display(C2)
      case d3 
        display(C3)
      case d4
        display(C4)
      case d5
        display(C5)
      case d6
        display(C6)
      case d7
        display(C7)
      case d8
        display(C8)
      otherwise
    endswitch
  elseif length(input) == 6
    Ht = cat(1,Pt,Ik)
    switch (input)
      case C1
        display(d1)
      case C2
        display(d2)
      case C3
        display(d3)
      case C4
        display(d4)
      case C5
        display(d5)
      case C6
        display(d6)
      case C7
        display(d7)
      case C8
        display(d8)
      otherwise
        min = 2
        if (distancia(input,C1) < min)
          disp("---------DECODIFICACION---------")
          disp(d1)
        elseif (distancia(input,C2) < min)
          disp("---------DECODIFICACION---------")
          disp(d2)
        elseif (distancia(input,C3) < min)
          disp("---------DECODIFICACION---------")
          disp(d3)
        elseif (distancia(input,C4) < min)
          disp("---------DECODIFICACION---------")
          disp(d4)
        elseif (distancia(input,C5) < min)
          disp("---------DECODIFICACION---------")
          disp(d5)
        elseif (distancia(input,C6) < min)
          disp("---------DECODIFICACION---------")
          disp(d6)
        elseif (distancia(input,C7) < min)
          disp("---------DECODIFICACION---------")
          disp(d7)
        elseif (distancia(input,C8) < min)
          disp("---------DECODIFICACION---------")
          disp(d8)
        else
          disp("HAY MAS DE UN ERROR EN LA ENTRADA")
        endif    
    endswitch
  else 
    disp("Longitud de input invalida")
  endif
endfunction

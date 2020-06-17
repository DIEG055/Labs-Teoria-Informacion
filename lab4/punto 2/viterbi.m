

function retval = viterbi ()  
  inf = 1000; # valor grande de referencia para calculos (infinito)
  input = ["11"; "00"; "00"; "01"; "11"]; # entrada
  n = rows(input) # devuelve el numero de filas de input (valores horizontales del diagrama)

  states = [0, 2, 1, 3]; #valores para el algoritmo
  next = [0, 0, 1, 1; 2, 2, 3, 3];
  output = [0, 3, 1, 2; 3, 0, 2, 1];
  dp = ones(4, n+1) * inf; # diagrama de pesos
  parents = ones(4, n+1) * -2; # matrices para calculos del camino
  parents_bit = ones(4, n+1) * -1; # matrices para calculos del camino y obtener bits
  dp(1,1) = 0; # se establece el primer peso como 0
  for t = 1:n # recorre horizontalmente el diagrama (r)
    for st = 1:4 # recorre verticalmente el diagrama(a,b,c,d)
      if (dp(st, t) == inf) # si el peso que se evalua es infinito, termina el ciclo de pesos
         continue;
      endif
      for bit = 1:2
        
        newstate = next(bit, states(st)+1)+1;
        newstate = states(newstate)+1;
        out = output(bit, states(st)+1);
        dist = hamdist(dec2bin(out,2), input(t,[1:2])) + dp(st,t); #distancia de hamilton que se 
        if (dp(newstate, t+1) >= dist) # si el peso calculado de hamilton es menos que el peso actual
          if ( dp(newstate, t+1) == dist && rand() >= 0.5) # se lanza la moneda si los caminos tienen el mismo peso
            continue;
          endif
          #en caso de que se cambie el valor, se asigna dist
          dp(newstate, t+1) = dist;
          parents(newstate, t+1) = st;
          parents_bit(newstate,t+1) = bit-1;
        endif
      endfor
    endfor
  endfor

  
  # al final de la matriz de pesos queda peso acumulado del camino
  dp
  min = dp(1,n+1);
  posMin = 1;
  current = 1;
  
  # se selecciona el camino del menor peso acumulado
  for i = 2:4
    if (dp(i, n+1) < min) # si el peso acumulado actual es menor que min
      min = dp(i, n+1);
      posMin = i;
    endif
  endfor
  
  
  path = []; # array path numerico
  path_bit = []; # array path bits
  current = posMin;
  i = n+1;
  
  # devolverse en el camino con base en parents y parents_bit
  while parents(current,i) != -2
    path = [path, current]; # obtener camino (a,b,c,d)
    path_bit = [path_bit, parents_bit(current,i)]; # bit del camino (1,0)
    current = parents(current, i);
    i = i-1;
  end
  
  # camino en numeros
  path = [path, current]

  i = length(path); #el ciclo recorre todo path
  while (i>=1)
    fprintf("%c", letter(path(i))); # define el camino a seguir en el diagrama de Trelli
    i = i-1;
  end
  
  fprintf("\n");
  path_bit = fliplr(path_bit) # convierte en un array e imprime la palabra original
  
  
endfunction



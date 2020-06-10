  num = input("Ingrese la cantidad de simbolos\n"); # Recibe la cantidad de simbolos
  simb = zeros(1, num);  # Crea matriz de ceros con tamaño num para los simbolos
  prob = zeros(1, num);  # Crea matriz de ceros con tamaño num para las probabilidades
  
  for i = 1: num
    simb(1, i) = num2str(i); # Se llena con valores incrementales correspondientes al numero identificador del simbolo
  endfor
    
  for i = 1: num
    printf("Ingrese la probabilidad para el simbolo %c", simb(1,i));  
    prob(1, i) = input("\n");    # Se ingresan las probabilidades
  endfor

  
  
  # Algoritmo de ordenamiento (simbolo y probabilidad), 
  # es necesario que la posición del simbolo m sea la misma que la de la probabilidad del simbolo m
  for i = 1: num
    for j = i+1: num
      if(prob(1,j)-prob(1,i) > 0) # Se verifica si el numero en la posición j es mayor que i, en dado caso, se intercambian
        auxSimb = simb(1, i); # variable auxiliar para guardar valor de la pos i de simbolo
        auxVal = prob(1, i); # variable auxiliar para guardar valor de la pos i de probabilidad
        
        # para simbolo
        prob(1,i) = prob(1, j); # se intercambia i con j
        prob(1,j) = auxVal; # se asigna valor de i
       
        # para probabilidad
        simb(1,i) = simb(1, j);
        simb(1,j) = auxSimb;
      endif
    endfor
  endfor
  
  probMat = zeros(num, num-1); # se crea matriz para probabilidades
  posMat = zeros(num, num-1); # se crea matriz para posiciones (simbolos asociados con las probabilidades)
  simbMat = {};   # se crea matriz para codificacion
  
  # se inicializan los valores de simbMat
  for i = 1: num
    for j = 1: num-1
      simbMat{i,j} = "";
    endfor
  endfor
  
  # se llena la primera columna de la matriz con las probabilidades ingresadas por el usuario
  for i = 1: num
    probMat(i, 1) = prob(1, i);
  endfor
  
  
  
  pos = num;  
  
  #desde la columna 2 hasta la penultima columna
  for j = 2: num-1    
    val = probMat(pos, j-1) + probMat(pos-1, j-1); # suma la probabilidad de la ultima fila (pos) y la penulti
    posAux = 1; # para cambiar de fila
    while(probMat(posAux, j-1) >= val) # termina hasta que el elemento en la columna anterior sea mayor que val
      # se asigna el mismo elemento en la posicion posAux de la columna j-1
      probMat(posAux, j) = probMat(posAux, j-1); 
      posMat(posAux, j) = posAux; 
      posAux = posAux + 1; 
    endwhile
    # asignar el valor calculado val 
    probMat(posAux, j) = val; # se asigna el valor calculado val
    posMat(posAux, j) = -1; # se indica que en esa posición esta val
    posIzq = posAux; # fila en la que se dejo de copiar de la anterior columna
    posAux = posAux + 1; # fila en la que continua la columna actual
    
    # asignar los valores restantes
    while(posIzq < pos-1) #  termina en la penultima columna
      probMat(posAux, j) = probMat(posIzq, j-1);
      posMat(posAux, j) = posIzq;
      posAux = posAux + 1;
      posIzq = posIzq + 1;      
    endwhile
    
    pos = pos-1; # dismuye el tamaño de la siguiente columna
  endfor
   
  
  
  posDev = 1;
  for j = num-1:-1:1 # recorre desde la cantidad de simbolos, decrementalmente hasta 2
    simbMat{posDev, j} = cstrcat(simbMat{posDev, j}, "0"); # se concatena al final del string 0
    simbMat{posDev+1, j} = cstrcat(simbMat{posDev+1, j}, "1"); # se concatena al final del string 1
    
      for row = 1: num
        if(posMat(row, j) == -1) # en caso de que la probabilidad sea suma de otras dos
          simbMat{posDev+1, j-1} = simbMat{row, j}; # fila +1 de la anterior columna se le asigna el mismo codigo
          simbMat{posDev+2, j-1} = simbMat{row, j}; # fila +2 de la anterior columna se le asigna el mismo codigo
        elseif(posMat(row,j) != 0) # en caso contrario
          simbMat{posMat(row, j), j-1} = simbMat{row, j}; # se asigna el mismo codigo
        endif
      endfor
    
    posDev = posDev + 1; #varia el numero de elementos en la columna
  endfor  
  
  
  
  #calculo entropía
 H = Entropia(prob,prob);
 
 # Calculo de L
 L = 0;
 
 for i = 1: num
    L += prob(1,i)*length(simbMat{i,1}); #se realiza la sumatoria P(xi)*ni
 endfor  
 
 # calculo de eficiencia
 n = H/L;
  
  
  printf("\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  
  
  #se imprimen los códigos
  printf("\n\n");
  for i = 1: num
    printf("Simbolo %c -> Probabilidad %.2f -> Codificacion %s\n", simb(1, i), prob(1, i), simbMat{i,1});
  endfor
  
  printf("\n\n\nH = %.2f\n", H);
  printf("L = %.2f\n", L);
  printf("n = %.2f\n", n);

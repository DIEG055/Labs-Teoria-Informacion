  num = input("Ingrese la cantidad de simbolos\n");
  simb = zeros(1, num);  
  prob = zeros(1, num);
  
  for i = 1: num
    simb(1, i) = num2str(i);
  endfor
    
  for i = 1: num
    printf("Ingrese la probabilidad para el simbolo %c", simb(1,i));
    prob(1, i) = input("\n");    
  endfor
  
  abs = 0.00001;
  for i = 1: num
    for j = i+1: num
      if(prob(1,j)-prob(1,i) > abs)
        auxSimb = simb(1, i);
        auxVal = prob(1, i);
        
        prob(1,i) = prob(1, j);
        prob(1,j) = auxVal;
       
        simb(1,i) = simb(1, j);
        simb(1,j) = auxSimb;
      endif
    endfor
  endfor
  
  probMat = zeros(num, num-1);
  posMat = zeros(num, num-1);
  simbMat = {};  
  
  for i = 1: num
    for j = 1: num-1
      simbMat{i,j} = "";
    endfor
  endfor
  for i = 1: num
    probMat(i, 1) = prob(1, i);
  endfor
  
  pos = num;  
  for j = 2: num-1    
    val = probMat(pos, j-1) + probMat(pos-1, j-1);
    posAux = 1;
    while(probMat(posAux, j-1) >= val)
      probMat(posAux, j) = probMat(posAux, j-1);
      posMat(posAux, j) = posAux;
      posAux = posAux + 1;
    endwhile
    probMat(posAux, j) = val;
    posMat(posAux, j) = -1;
    posIzq = posAux;
    posAux = posAux + 1;
    while(posIzq < pos-1)
      probMat(posAux, j) = probMat(posIzq, j-1);
      posMat(posAux, j) = posIzq;
      posAux = posAux + 1;
      posIzq = posIzq + 1;      
    endwhile
    
    pos = pos-1;
  endfor
   
  posDev = 1;
  for j = num-1:-1:1
    simbMat{posDev, j} = cstrcat(simbMat{posDev, j}, "0");
    simbMat{posDev+1, j} = cstrcat(simbMat{posDev+1, j}, "1");
    
    if(j > 1)
      for row = 1: num
        if(posMat(row, j) == -1)
          simbMat{posDev+1, j-1} = simbMat{row, j};
          simbMat{posDev+2, j-1} = simbMat{row, j};
        elseif(posMat(row,j) != 0)
          simbMat{posMat(row, j), j-1} = simbMat{row, j};
        endif
      endfor
    endif
    
    posDev = posDev + 1;
  endfor  
  
  for i = 1: num
    printf("Simbolo %c -> Codificacion %s\n", simb(1, i), simbMat{i,1});
  endfor

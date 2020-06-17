
#Se lee la matriz de datos D
while(true)
  try 
   d =  input ('ingrese la matriz de datos: ');

    break;
  catch
    printf("Favor ingresar un funcion valida\n");
  end_try_catch
endwhile 


#Se lee el matriz de errores
while(true)
  try 
   err =  input ('ingrese el matriz de errores: ');

    break;
  catch
    printf("Favor ingresar un funcion valida\n");
  end_try_catch
endwhile 


printf("______________________________________________\n \n \n ");  
#Matriz de Paridad propuesta para caso de prueba
P = [1 0 1;
     1 1 1;
     1 1 0];
printf("Matriz de Paridad \n \n");
disp(P);
printf("______________________________________________\n \n \n ");  




#Se codifica la matriz de datos D
I = eye(size(P,2));
G = [ I P']; # Matriz Generadora
C = codificacion(d,G);
printf("Matriz Generadora \n \n");
disp(G);
printf("\n \n")
printf("....................CODIFICACION....................\n \n \n ");  
printf("Matriz de Codificacion \n \n");
disp(C);
printf("______________________________________________\n \n \n ");  




#Construccion de todas las posible palabras del codigo 
k = 3  ;
printf("Posibles Palabras del Codigo \n \n");
printf("--------------------------------------\n");  
printf("%10s %10s %10s \n","di","ci","w(ci)");
printf("--------------------------------------\n");  
c = [];# posibes palabras
for i=0:(2**k-1)
  [di,s_di]= toBinary(i,k);
  ci = multiplicacionBinaria(di,G);
  c = [c; ci];
  h = pesoHamming(ci);
  s_c = '';
  for j= 1:length(ci)
    s_c = strcat(s_c,num2str(ci(j)));
  endfor
    printf("%5d = %1s %10s %7d \n",i,s_di,s_c,h);
endfor
printf("--------------------------------------\n \n \n");   
printf("______________________________________________\n \n \n ");  




# se imita el comportamiento de un Discrete Memoryless Channel
r = sumaBinaria(C,err);# se recibe C mas un error  | C + err

    # r = [0 1 0 1 1 1];% MENSAJE RECIBIDO  | EJEMPLO CLASE%
 
H_t = [     P'; 
       eye(size(P,2))]; 
S = multiplicacionBinaria(r,H_t); # Sindrome   
[r_ne,r_d,err] = decodificacion(r,P,H_t,S);
printf("Matriz  Recibida | Palabras que se reciben del DMC \n \n");
disp(r);
for i = 1:length(err)
  printf("fila %d, error en la posicion: %d \n",i,err(i));
endfor
printf("______________________________________________\n \n \n ");
printf("Matriz de Chequeo de Paridad \n \n");
disp(H_t);
printf("\n \n")
printf("....................DECODIFICACION 1....................\n \n \n ");  
printf("Sindrome de Decodificacion \n \n");
disp(S);
printf("______________________________________________\n \n \n ");  
printf("Matriz de Codigo Recibida Correcta \n \n");
disp(r_ne);
printf("______________________________________________\n \n \n ");  
printf("Matriz Recibida Decodificada | Bits de Datos \n \n");
disp(r_d);
printf("______________________________________________\n \n \n \n \n ");

printf("....................DECODIFICACION 2....................\n \n \n ");  
printf("Regla de Decodificacion Distancia Minima \n \n");

r2 = [];
for j = 1:size(r,1)
  printf("Palabra %d \n",j);
  minpos = 1;
  min = Inf
  for i = 1:size(c,1)
     dis = distHamming(c(i,:),r(j,:));
     if dis < min
       min = dis;
       minpos = i;
     endif
     printf("d(r,c%d) = %d \n",i,dis);
  endfor
  printf("Distancia Minima con d(r,c%d) = %d \n",minpos,min);
  c(minpos,:)
  r2 = [ r2; c(minpos,:)];
  printf("\n");
endfor

printf("______________________________________________\n \n \n ");  
printf("Matriz Recibida segun Metodo Distancia Minima  \n \n");
disp(r2);
printf("______________________________________________\n \n \n ");  
printf("Matriz Decodificada | Bits de Datos \n \n");
r2_d = r2(:, 1:size(P,2));
disp(r2_d);

# quedamos en decodificacion de sindromes del Decoder




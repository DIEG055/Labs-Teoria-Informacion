
clear

#Leer el valor a
ok = false;
while (~ok)
  try
    a=input("Ingrese el ancho del pulso cuadrado. ");
    
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#leer T
ok = false;
while (~ok)
  try
    T=input("Ingrese valor T. ");
    
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#leer Ts
ok = false;
while (~ok)
  try
    Ts=input("Ingrese valor Ts. ");
    
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Leer el valor Wc
ok = false;
while (~ok)
  try
    Wc=input("Ingrese valor Wc. ");
    
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Leer el valor Wc 1
ok = false;
while (~ok)
  try
    Wc_1=input("Ingrese valor Wc 1. ");
    
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Leer el valor Wc 2
ok = false;
while (~ok)
  try
    Wc_2=input("Ingrese valor Wc 2.");
    
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile



#Tiempo
t = ( -T : Ts : T );
#Frecuencia
w = t( 1 : 2 : end );


#-------  FUNCIONES -----



#Funcion rectangular
rec = Funcion(t,a);

#Funcion frecuencia analitica
rec_fr = 2*a*Sa(w.*a);
#Pasar al dominio de la frecuencia para poder aplicar los filtros
f_rec=fftshift( fft(rec) * Ts )( 1 : 2 : end );

#-------  FILTROS  -------
#Se multiplican las funciones termino a termino para aplicar el filtro


#Filtro LPF y pasar al dominio del tiempo con ifft(x)
LPF_fre=rec_fr.*LPF(w,Wc);
LPF_tiem=ifftshift(ifft(LPF_fre));

#Filtro HPF
HPF_fre=rec_fr.*HPF(w,Wc);
HPF_tiem=ifftshift(ifft(HPF_fre));

#Filtro BPF
BPF_fre=rec_fr.*BPF(w,Wc_1,Wc_2);
BPF_tiem=ifftshift(ifft(BPF_fre));

#Filtro BSF
BSF_fre=rec_fr.*BSF(w,Wc_1,Wc_2);
BSF_tiem=ifftshift(ifft(BSF_fre));

#---------  GRAFICAS  ---------



#FFT
figure(1);
subplot(2,1,2); plot( w, f_rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion con fft'); grid;
subplot(2,1,1); plot( w, rec_fr , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion con analitica'); grid;

printf("Presione una tecla para ver la siguiente grafica\n\n");
kbhit();

#LPF
figure(2);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\t'); ylabel('X(\w)'); title('Funcion original en tiempo'); grid;
subplot(4,1,2); plot( w, abs(LPF_tiem)  ); xlabel('\t'); ylabel('X(\w)'); title('PASA BAJAS en tiempo'); grid;
subplot(4,1,3); plot( w, rec_fr , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, abs(LPF_fre)); xlabel('\w'); ylabel('X(\w)'); title('PASA BAJAS en frecuencia'); grid;

printf("Presione una tecla para ver la siguiente grafica\n\n");
kbhit();

#HPF
figure(3);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\t'); ylabel('X(\w)'); title('Funcion original en tiempo')
subplot(4,1,2); plot( w, abs(HPF_tiem)); xlabel('\t'); ylabel('X(\w)'); title('PASA ALTAS en tiempo'); grid;
subplot(4,1,3); plot( w, rec_fr , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, abs(HPF_fre) ); xlabel('\w'); ylabel('X(\w)'); title('PASA ALTAS en frecuencia'); grid;

printf("Presione una tecla para ver la siguiente grafica\n\n");
kbhit();

#BPF
figure(4);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en tiempo')
subplot(4,1,2); plot( w, abs(BPF_tiem)); xlabel('\w'); ylabel('X(\w)'); title('PASA BANDAS en tiempo'); grid;
subplot(4,1,3); plot( w, rec_fr , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, abs(BPF_fre)  ); xlabel('\w'); ylabel('X(\w)'); title('PASA BANDAS en frecuencia'); grid;

printf("Presione una tecla para ver la siguiente grafica\n\n");
kbhit();

#BSF
figure(5);
subplot(4,1,1); plot( t, rec , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en tiempo')
subplot(4,1,2); plot( w, abs(BSF_tiem) ); xlabel('\w'); ylabel('X(\w)'); title('SUPRIME BANDAS en tiempo'); grid;
subplot(4,1,3); plot( w, rec_fr , '-r' ); xlabel('\w'); ylabel('X(\w)'); title('Funcion original en Frecuencia'); grid;
subplot(4,1,4); plot( w, abs(BSF_fre)  ); xlabel('\w'); ylabel('X(\w)'); title('SUPRIME BANDAS en frecuencia'); grid;




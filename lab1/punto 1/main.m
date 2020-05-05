clc
pkg load signal

#Se lee la funcion definida por el usuario
while(true)
  try 
   f =  input ('ingrese la funcion con parametro t: ', 's');

    break;
  catch
    printf("Favor ingresar un funcion valida\n");
  end_try_catch
endwhile 

#Se lee el periodo T definido por el usuario
while(true)
  try 
   T= input ('ingrese el periodo T: ');
   T= T+0;
    break;
  catch
    printf("Favor ingresar un valor valido\n");
  end_try_catch
endwhile 

#Se lee el N definido por el usuario
while(true)
  try 
  N= input('ingrese N: ');
  N= N+0;
    break;
  catch
    printf("Favor ingresar un valor valido\n");
  end_try_catch
endwhile 

# con base en el periodo se define un arreglo con abscisas que permitan discretizar la funcion
t= [-T/2:0.01:T/2]; 

#funcion que contiene la logica de la serie de fourier
serie_fourier= fourier(f,T,t,N);

# se grafican los resultados
g = arrayfun(inline(f),t);
plot(t,g,t,( serie_fourier),'r');
title(['serie de Fourier trigonometrica para ', f]); grid on; %grafico de la serie de Fourier contra la funcion f(t)
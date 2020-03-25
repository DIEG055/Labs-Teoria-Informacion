clc
pkg load signal
#Se lee el tamaño de la matriz A
while(true)
  try 
    N = input("Ingrese N: ");
    N = N+0;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

while(true)
  try 
    T0 = input("Ingrese el valor de T0: ");
    T0 = T0+0;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

while(true)
  try 
    funcion_periodica=input( "Ingrese la funcion periodica: ", "S" );
    
    break;
  catch
    printf("Favor ingresar una funcion valida\n");
  end_try_catch
endwhile 




sum=0;
W0=2*pi/T0;
t = [-2*T0: 0.001 :2*T0];
ak=0;
bk=0;

for k = 1 : N
  [ak, bk] = coeficiente_fourier_trig(funcion_periodica, W0, T0, k );
  sum += (ak * cos( k * W0 * t )) + (bk * sin( k * W0 * t ));
endfor


[a0,b0]=coeficiente_fourier_trig( funcion_periodica,W0, T0, 0 );
sum=sum+a0/2;
f_funcion_periodica = inline(funcion_periodica, "t" );

clf;
%square(t) co T0=2   -> square(3*t)
plot( t, [sum; square(3*t)], ['-r'; '-g'] );
xlabel('t'); 
ylabel('x(t)');
title('Serie de Fourier');
legend( 'Aproximacion de la funcion', strcat( "funcion: ", funcion_periodica)) ; 

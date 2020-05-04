function demodulador(t,f,T,y_niveles_binario)
  f_s=length(y_niveles_binario);
  sum=0;
  f=1/T;
w_m=2*pi*f; # f_m es la frecuencia
for i=0:2*T #T es el periodo
  fun=f(i*f_s)*(sin(w_m.*(t-i*f_s))/w_m.*(t-i*f_s)); #f_s frecuencia de muestreo   t Arreglo para el muestreo
  sum=sum+fun;
endfor

figure(5);
plot(t,sum); title('Recuperacion de la señal');
endfunction

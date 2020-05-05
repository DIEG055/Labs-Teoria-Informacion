function demodulador(t,f,T,y_niveles_binario)
  f_m=1/T; #Frecuencia 
  f_s=length(y_niveles_binario);
  sum=0;
  w_m=2*pi*f_m; 
  for i=0:2*T 
    fun=f(i*f_s)*(sin(w_m.*(t-i*f_s))/w_m.*(t-i*f_s)); #f_s frecuencia de muestreo   t Arreglo para el muestreo
   sum=sum+fun;
  endfor

  figure(4);
  plot(t,sum); title('Señal Recuperada');

endfunction

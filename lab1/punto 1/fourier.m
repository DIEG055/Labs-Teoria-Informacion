function serie_fourier = fourier( f,T,t,N )
  # se define la frecuencia angular con base en el periodo
  W0 = 2*pi/T;
  #variable donde se acumalara el resultado de cada iteracion
  serie_fourier=0;
  for n=1:N
    f_a=inline(["(" f ").*cos(" num2str(W0) ".*t.*" num2str(n) ")"]);
    f_b=inline(["(" f ").*sin(" num2str(W0) ".*t.*" num2str(n) ")"]);
    # calculo del coeficiente a
    a=(2/T)*quad(f_a,-T/2,T/2); 
    #calculo del coeficiente b
    b=(2/T)*quad(f_b,-T/2,T/2); 
    # se acumulan los resultados para la sumatoria de fourier
    serie_fourier +=  (a*cos(W0*t*n) + b*sin(W0*t*n));
  end

  # se tiene en cuenta el caso especial de a0
  a0= 2/T.*quad(inline(f),-T/2,T/2);
  serie_fourier += (a0/2);
  return;
endfunction

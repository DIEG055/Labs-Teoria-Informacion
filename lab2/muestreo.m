function t = muestreo(x,f,T)
  #abscisas para la funcion original
  f_m=1/T;
  f_s=2*f_m; 
  t_s=[0:0.02:2*T];
  t=[0:f_s:2*T];

figure(1);
  subplot(2,1,1),
  plot(t_s,f(t_s),'k');
  title('Funcion original f(t)');
  grid;
  subplot(2,1,2),stem(t,f(t),'k');
  title('Funcion muestreada f(t)');
  grid;

endfunction

function y = codificacion(n,t,f,xq,xmax)
  pulsos_binarios = n; 
num_total_pulsos = length(f(t))*pulsos_binarios; 
x_pulsos = [0:num_total_pulsos-1]; 
y_niveles= get_nivel(xq,n,xmax);   
  y = [];
  for i=1 : length(y_niveles)
    for j=0 : pulsos_binarios-1
      y(length(y)+1) = [bitget(y_niveles(i),pulsos_binarios-j)];
    endfor
  endfor
disp(["Codificacion del mensaje con ", num2str(n), " pulsos binarios por cada muestreo de la señal"])

  
endfunction

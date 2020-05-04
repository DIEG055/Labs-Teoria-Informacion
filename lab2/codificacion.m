function y_niveles_binario = codificacion(n,t,f,xq,xmax)
  pulsos_binarios = n; 
num_total_pulsos = length(f(t))*pulsos_binarios; 
x_pulsos = [0:num_total_pulsos-1]; 
y_niveles= get_nivel(xq,n,xmax);   
y_niveles_binario = convertir_10(y_niveles,pulsos_binarios); 

disp(["Codificacion del mensaje con ", num2str(n), " pulsos binarios por cada muestreo de la señal"])
y_niveles_binario;

  
endfunction

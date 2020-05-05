function y = codificacion(n,t,f,xq,xmax)

niveles= get_nivel(xq,n,xmax);   
  y = [];
  for i=1 : length(niveles)
    for j=0 : n-1
      #se guarda la representacion binaria del nivel i
      y(length(y)+1) = [bitget(niveles(i),n-j)];
    endfor
  endfor

  
endfunction

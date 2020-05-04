function y = convertir_10(x,nbits)
  y = [];
  for i=1 : length(x)
    for j=0 : nbits-1
      y(length(y)+1) = [bitget(x(i),nbits-j)];
    endfor
  endfor
endfunction
function y = distancia(a,b)
  y = 0
  for i=1 : length(a)
    if(a(i) != b(i))
      y = y+1
    endif
  endfor
endfunction

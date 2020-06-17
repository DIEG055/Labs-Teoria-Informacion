function  n = pesoHamming (H)
  n=0;
  for i= 1:length(H)
    if H(i) == 1
      n=n+1;
    endif
  endfor
endfunction

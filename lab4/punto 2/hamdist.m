function retval = hamdist (input1, input2)
  n = 0;
  for i = 1:2
    if input1(i) != input2(i)
      n = n+1;
    endif
  endfor
  retval = n;
endfunction
function y = get_nivel(x,n,xmax)
  y = [];
  niveles = 2^n;
  delta = 2*xmax/niveles;
  for a = 1 : length(x)
    val = -xmax;
    for j=0 : niveles+1
      if (x(a) >= val && x(a) < (val+delta))
        y(a) = j;
        break;
      endif
      val = val + delta;
    endfor
  endfor
endfunction

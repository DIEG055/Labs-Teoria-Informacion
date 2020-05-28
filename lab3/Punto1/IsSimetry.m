function bool = IsSimetry (Py_dado_x)
  bool_diag_pri = (Py_dado_x(1,1) == Py_dado_x(2,2));
  bool_diag_seg = (Py_dado_x(2,1) == Py_dado_x(1,2));
  
  bool = bool_diag_pri & bool_diag_seg;
endfunction

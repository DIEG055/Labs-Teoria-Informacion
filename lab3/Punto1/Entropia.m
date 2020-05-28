function H = Entropia(Ph_p,Ph_log)

  mul = Ph_p.*log2(Ph_log);
  mul(isnan(mul))=0;
  H = -sum(sum(mul));

endfunction



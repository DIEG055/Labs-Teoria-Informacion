function [coeficiente_a, coeficiente_b] = coeficiente_fourier_trig( funcion_periodica, W0, T0, k )
  funcion_por_coseno = inline( strcat(funcion_periodica,".*cos(k.*W0.*t)"), "t" );
  funcion_por_seno = inline( strcat(funcion_periodica,".*sin(k.*W0.*t)"), "t" );
  
  coeficiente_a = ( 2 / T0 ) .* quad( funcion_por_coseno, -T0 / 2, T0 / 2 );
  coeficiente_b = ( 2 / T0 ) .* quad( funcion_por_seno, -T0 / 2, T0 / 2 );
  return;
endfunction

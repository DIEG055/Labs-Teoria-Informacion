function xq = quantizacacionUniforme(t,f,xmax,n)
  x=f(t);
  L=2^n;
  Delta=(2*xmax)/L;
  q=floor(L*((x+xmax)/(2*xmax)));          
  i=find(q>L-1); q(i)=L-1;               
  i=find(q<0); q(i)=0;            
  xq=(q*Delta)-xmax+(0.5*Delta);
  
  figure(2);
  stem(t,xq,'k');
  title('Funcion cuantizada f(t)');
  xlabel('nT_s');
  ylabel('x(nT_s)');
  grid;

endfunction

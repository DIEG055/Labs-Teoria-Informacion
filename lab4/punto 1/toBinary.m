function [x,x_s] = toBinary (in,size)
x = [];
y = 2;

if in >=(2^16 -1)
   fprintf('This number is too big')
else
   ii = 1;
   while in > 0
        r = logical(rem(in,y^ii));
        x = [r x];
        in = in - r*2^(ii-1);
        ii = ii+1;
   end
end
s = length(x);
if s<size
  dif = size - s;
  for i = 1:dif
    x = [0 x];
  endfor
endif
  x_s = '';
  for j= 1:length(x)
    x_s = strcat(x_s,num2str(x(j)));
  endfor

endfunction

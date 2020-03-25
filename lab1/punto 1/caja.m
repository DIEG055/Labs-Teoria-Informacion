function y = caja(x,T0)
  h=T0/2
% We'll inspect every value of the vector
for i = 1 : length(x)
    % Total length of high and low values are pi
    if mod(x(i),T0)>=h;
        % if x(i) is in the last half, we set a -1
        y(i) = 1;
    else
        % if x(i) is in the first half, we set a +1
        y(i) = 0;
    end
end
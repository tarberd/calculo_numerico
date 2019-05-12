function [quotient remainder] = briot_ruffini(dividend, divisor_factor)

  quotient(1) = dividend(1);

  for i = 2 : length(dividend) - 1
      quotient(i) = dividend(i) + divisor_factor*quotient(i-1);
  end

  remainder = dividend(end) + divisor_factor*quotient(end);
end

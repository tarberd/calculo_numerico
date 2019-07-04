function y = my_erf(x)

  f = @(x) exp(-1 .* x .^ 2)

  [integral _ _] = fGm(10, 0, x, f);

  y = (2 / sqrt(pi)) * integral;
end

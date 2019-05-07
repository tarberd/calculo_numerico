xi = [1; -1]

y1 = @(x) exp(x(1)) + x(2) - 1
y2 = @(x) x(1) * x(1) + x(2) * x(2) - 4


x = sysnewton(xi, y1, y2)

residuo = max(abs([y1(x) y2(x)]))

%erro menor que 1e-15

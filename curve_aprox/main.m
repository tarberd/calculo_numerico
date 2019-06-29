x = [1:8];
y = [0.1 0.4 0.9 0.95 0.8 0.6 0.6 0.7];

% g(x) = a(1)sin(x) + a(2)cos(x) + a(3)
a = fcoef1(x, y)

g1 = @(x) a(1) .* sin(x) .+ a(2) .*cos(x) .+ a(3);

xp = min(x) : 0.01 : max(x);
yp = g1(xp);

soma_desvios_modulo = sum(abs(g1(x) .- y))

plot(x, y, 'o', xp, yp, '-k')
pause

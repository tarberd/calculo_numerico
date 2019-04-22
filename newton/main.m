A = 0
B = 3 * pi

f = @(x) x .* tan(x) .- 1

x = newton(f, A, B, 1e-4)

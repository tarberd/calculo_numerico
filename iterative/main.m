format long;
xi = [0 0 0]
xe = [1 1 1]
tol = 1e-3
x = jacobi(xi, tol)

erro = max(abs(x .- xe))

x_exact = jacobi(xi, tol*tol)

erro_es = max(abs(x.- x_exact))

x = gauss_seidel(xi, tolerance)

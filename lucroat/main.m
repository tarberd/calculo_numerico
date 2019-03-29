A = [0 1 3;
     1 -1 3;
     2 2 2;]

B = [4; 1; 2;]

n = length(A);

[L, U, B] = lower_upper_croat(n, A,B);

C = solve_lower(n, L, B)
X = solve_upper(n, U, C)

%residuo_max = max(abs(A*x-B))

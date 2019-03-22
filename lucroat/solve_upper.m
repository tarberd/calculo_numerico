function x = solve_upper(n, upper, c)

    x(n) = c(n);

    for i = n-1: -1 : 1
        x(i) = c(i) - sum(upper(i, i+1:n) .* x(i+1:n));
    end

end

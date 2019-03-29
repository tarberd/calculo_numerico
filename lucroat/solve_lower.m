function c = solve_lower(n, lower, b)

    c(1) = b(1)/lower(1,1);

    for i = 2 : n
        c(i) = (b(i) - sum(lower(i, 1:i-1) .* c(1:i-1)) )/lower(i,i);
    end

    % TODO tratar sistemas indeterminados e impossiveis
end

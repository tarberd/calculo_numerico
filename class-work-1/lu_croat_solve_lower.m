function domain = lu_croat_solve_lower(lower, image)
    dim = length(image);

    domain(1) = image(1) / lower(1, 1);

    for i = 2 : dim
        domain(i) = (image(i) - sum(lower(i, 1 : i - 1) .* domain(1 : i - 1)))/lower(i, i);
    end
end

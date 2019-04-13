function domain = lu_croat_solve_upper(upper, image)
    dim = length(image);

    domain(dim) = image(dim);

    for i = dim - 1 : -1 : 1
        domain(i) = image(i) - sum(upper(i, i + 1 : dim) .* domain(i + 1 : dim));
    end
end

function [domain float_operations] = lu_croat_solve_upper(upper, image)
    float_operations = 0;
    dim = length(image);

    domain(dim) = image(dim);

    for i = dim - 1 : -1 : 1
        domain(i) = image(i) - sum(upper(i, i + 1 : dim) .* domain(i + 1 : dim));
        float_operations += 1 + 2 * sum(i + 1 : dim);
    end
end

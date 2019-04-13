function [domain float_operations] = lu_croat_solve_lower(lower, image)
    float_operations = 0;
    dim = length(image);

    domain(1) = image(1) / lower(1, 1);
    float_operations += 1;

    for i = 2 : dim
        domain(i) = (image(i) - sum(lower(i, 1 : i - 1) .* domain(1 : i - 1)))/lower(i, i);
        float_operations += 1 + 2 * sum(i : i - 1) + 1;
    end
end

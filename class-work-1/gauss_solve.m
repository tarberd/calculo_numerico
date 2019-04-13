function [domain float_operations] = gauss_solve(t, r, d, image)
    float_operations = 0;
    dim = length(image);

    for i = 2 : dim
        aux = t(i) / r(i - 1);
        float_operations += 1;
        r(i) -= aux * d(i - 1);
        float_operations += 1;
        image(i) -= aux * image(i - 1);
        float_operations += 1;
    end

    for i = dim
        domain(i) = image(i) / r(i);
        float_operations += 1;
    end

    for i = dim - 1 : -1: 1
        domain(i) = (image(i) - d(i) * domain(i + 1)) / r(i);
        float_operations += 1 + 1 + 1;
    end
end

function [domain iter_count] = gauss_seidel_solve(t, r, d, image, seed, tolerance, relaxation_factor)
    dim = length(image);

    delta = 100000;
    domain = seed;

    iter_count = 0;
    iter_count_max = 100000;
    while tolerance < delta && iter_count < iter_count_max
        for i = 1
            domain(i) = (1 - relaxation_factor) * seed(i) + relaxation_factor * (image(i) - (d(i) .* seed(i + 1)))/r(i);
        end

        for i = 2 : dim - 1
            domain(i) = (1 - relaxation_factor) * seed(i) + relaxation_factor * (image(i) - (t(i) .* domain(i - 1) + d(i) .* seed(i + 1)))/r(i);
        end

        for i = dim
            domain(i) = (1 - relaxation_factor) * seed(i) + relaxation_factor * (image(i) - (t(i) .* domain(i - 1)))/r(i);
        end

        delta = max(abs(domain .- seed));
        seed = domain;
        iter_count += 1;
    end
end

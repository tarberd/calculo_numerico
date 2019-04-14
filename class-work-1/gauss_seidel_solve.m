function [domain iter_count] = gauss_seidel_solve(t, r, d, image, seed, tolerance)
    dim = length(image);

    relaxing_factor = 1;

    delta = 100000;
    domain = seed;

    iter_count = 0;
    while tolerance < delta
        for i = 1
            domain(i) = (1 - relaxing_factor) * seed(i) + relaxing_factor * (image(i) - (d(i) .* seed(i + 1)))/r(i);
        end

        for i = 2 : dim - 1
            domain(i) = (1 - relaxing_factor) * seed(i) + relaxing_factor * (image(i) - (t(i) .* domain(i - 1) + d(i) .* seed(i + 1)))/r(i);
        end

        for i = dim
            domain(i) = (1 - relaxing_factor) * seed(i) + relaxing_factor * (image(i) - (t(i) .* domain(i - 1)))/r(i);
        end

        delta = max(abs(domain .- seed));
        seed = domain;
        iter_count += 1;
    end
end

function [lower upper image] = lu_croat(transform, image)
    dim = length(image);

    lower(dim, dim) = 0;
    upper(dim, dim) = 0;

    % k = 1
    for i = 1 : dim;
        lower(i, 1) = transform(i, 1);
        upper(i, i) = 1;
    end

    for j = 2 : dim;
        upper(1, j) = transform(1, j)/lower(1, 1);
    end

    % k = 2 : n - 1
    for k = 2 : dim - 1
        for i = k : dim
            j = k;
            lower(i, j) = transform(i, j) - sum(lower(i, 1 : j - 1) * upper(1 : j - 1, j));
        end
        for j = k + 1 : dim
            i = k;
            upper(i, j) = (transform(i, j) - sum(lower(i, 1 : i - 1) * upper(1 : i - 1, j)))/lower(i, i);
        end
    end

    k = dim;
    i = k;
    j = k;
    lower(i, j) = transform(i, j) - sum(lower(i, 1 : j -1) * upper(1 : j - 1, j));
end

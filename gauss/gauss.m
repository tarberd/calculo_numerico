function X = gauss(matrix, vector)

    n = length(matrix);

    matrix = [matrix vector];

    for k = 1 : n - 1
        for i = k +1 : n
            aux = matrix(i, k) / matrix(k, k);

            for j = 1 : n + 1
                matrix(i, j) -= aux * matrix(k, j);
                % Li <- Li - (Aik / Akk) * Lk
            end
        end
    end

    X(n) = matrix(n, n+1) / matrix(n, n);


    for i = n - 1 : -1 : 1
        soma = sum(matrix(i, (i + 1) : n) .* X((i + 1) : n));
        X(i) = (matrix(i, n + 1) - soma) / matrix(i, i);
    end

    X = transpose(X);
end

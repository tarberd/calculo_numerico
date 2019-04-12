function [lower upper image] = lu_croat(transform, image)
    dim = length(image)

    for i = 1 : dim
        for j = 1 : dim
            if (i == j)
                lower(i, j) = transform(i, j);
                upper(i, j) = 1;
            elseif (i > j)
                upper(i, j) = 0;

                if (j == 1)
                    lower(i, j) = transform(i, j);
                end

            elseif (i < j)
                lower(i, j) = 0;

                upper(i, j) = transform(i, j)/lower(i, i);
            end
        end
    end

end

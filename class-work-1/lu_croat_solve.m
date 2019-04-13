function [domain float_operations] = lu_croat_solve(transform, image)

    [lower upper row_swaped_image float_operations1] = lu_croat(transform, image);

    [intermidiate_domain float_operations2] = lu_croat_solve_lower(lower, row_swaped_image);

    [domain float_operations3] = lu_croat_solve_upper(upper, intermidiate_domain);

    float_operations = float_operations1 + float_operations2 + float_operations3;
end

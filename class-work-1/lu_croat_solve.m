function domain = lu_croat_solve(transform, image)

    [lower upper row_swaped_image] = lu_croat(transform, image);

    intermidiate_domain = lu_croat_solve_lower(lower, row_swaped_image);

    domain = lu_croat_solve_upper(upper, intermidiate_domain);
end

function roots = roots_polynomial_newton_with_multiplicity(polynome_coefficients, real_domain_step, tolerance)
  roots = [];

  roots_seeds = locate_polynomial_roots(polynome_coefficients, real_domain_step);

  for i = 1 : length(roots_seeds)
    initial_solution = roots_seeds(i);

    dx = tolerance;

    iter_count = 0;
    while abs(dx) >= tolerance && iter_count < 1000
      [quotient remainder_1] = briot_ruffini(polynome_coefficients, initial_solution);

      [_ remainder_2] = briot_ruffini(quotient, roots_seeds(1));

      dx = -remainder_1/remainder_2;

      initial_solution = initial_solution + dx;

      iter_count += 1;
    end

    new_root = initial_solution;

    roots = [roots new_root];

    [polynome_coefficients _] = briot_ruffini(polynome_coefficients, roots(end));

  end
end

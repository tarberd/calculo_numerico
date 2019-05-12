function [roots multiplicities] = roots_polynomial_newton_with_multiplicity(polynome_coefficients, real_domain_step, tolerance, multiplicity_tolerance)
  roots = [];
  multiplicities = [];

  roots_seeds = locate_polynomial_roots(polynome_coefficients, real_domain_step);

  roots_seeds_index = 1;

  roots_count = 0;
  roots_total = length(polynome_coefficients) - 1;
  while roots_count < roots_total
    initial_solution = roots_seeds(roots_seeds_index);

    dx = tolerance;

    iter_count = 0;
    while abs(dx) >= tolerance && iter_count < 100

      quotient = polynome_coefficients;
      remainder = [];
      for j = 1 : length(polynome_coefficients)
        [quotient new_remainder] = briot_ruffini(quotient, initial_solution);
        remainder = [remainder new_remainder];
      end

      multiplicity = 1;
      remainder_sum = abs(remainder(1) + remainder(2));
      while remainder_sum < multiplicity_tolerance
        multiplicity += 1;
        remainder_sum += abs(remainder(multiplicity + 1));
      end

      dx = -remainder(multiplicity)/(multiplicity * remainder(multiplicity+1));

      initial_solution = initial_solution + dx;

      iter_count += 1;
    end

    roots_count += multiplicity;
    roots_seeds_index += 1;

    new_root = initial_solution;
    new_multiplicity = multiplicity;
    roots = [roots new_root];
    multiplicities = [multiplicities new_multiplicity];

    for j = 1 : multiplicity
      [polynome_coefficients _] = briot_ruffini(polynome_coefficients, roots(end));
    end
  end
end

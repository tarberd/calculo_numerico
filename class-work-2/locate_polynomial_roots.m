function roots = locate_polynomial_roots(polynome_coefficients, real_domain_step)

  max_domain_radius = 1 + max(abs(polynome_coefficients(2 : end)))/abs(polynome_coefficients(1));

  real_domain = [-max_domain_radius max_domain_radius];

  real_domain_partitions = real_domain(1):real_domain_step:real_domain(2);

  % use horner solve to save on multiplications
  image = horner(polynome_coefficients, real_domain_partitions);

  roots = [];

  % find real roots
  for i = 1 : (length(real_domain_partitions) - 1)
    satisfies_bolzano_theorem = image(i)*image(i + 1) <= 0;

    if satisfies_bolzano_theorem
      new_root = (real_domain_partitions(i) + real_domain_partitions(i + 1))/2;
      roots = [roots new_root];
    end

  end

  % use dummy complex root to fill the rest
  for i = length(roots) + 1 : +2:  length(polynome_coefficients) - 1
    new_complex_root = complex(max_domain_radius/2, max_domain_radius/2);
    roots = [roots new_complex_root];
    new_complex_root = complex(max_domain_radius/2, -max_domain_radius/2);
    roots = [roots new_complex_root];
  end

end

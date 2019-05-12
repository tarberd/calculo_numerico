function roots = roots_newton(f, domain, domain_step, image_step_factor, tolerance)
  roots = [];

  roots_seeds = locate_real_roots(f, domain, domain_step, image_step_factor);

  for i = 1 : length(roots_seeds)
    initial_solution = roots_seeds(i);
    image = f(initial_solution);

    dx = tolerance;

    iter_count = 0;
    while abs(dx) >= tolerance && iter_count < 1000
      df = (f(initial_solution + dx) - f(initial_solution)) / dx;

      dx = -f(initial_solution)/df;

      initial_solution = initial_solution + dx;

      iter_count += 1;
    end
    roots = [roots initial_solution];
  end
end

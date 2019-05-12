function roots = locate_real_roots(f, domain, domain_step, image_step_factor)

  domain_partitions = domain(1):domain_step:domain(2);

  image = f(domain_partitions);

  roots = [];

  for i = 1 : (length(domain_partitions) - 1)
    max_image_range = image_step_factor * domain_step;

    is_continuous = abs(image(i + 1) - image(i)) < max_image_range ;

    satisfies_bolzano_theorem = image(i)*image(i + 1) <= 0;

    if satisfies_bolzano_theorem && is_continuous
      new_root = (domain_partitions(i) + domain_partitions(i + 1))/2;
      roots = [roots new_root];
    end
  end
end

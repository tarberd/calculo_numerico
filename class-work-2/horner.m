function image = horner(polynome_coefficients, domain)
  % solve polynome for domain with less multiplications

  image = polynome_coefficients(1) .* domain .+ polynome_coefficients(2);

  for i = 3 : length(polynome_coefficients)
    image = (image .* domain) .+ polynome_coefficients(i);
  end
end

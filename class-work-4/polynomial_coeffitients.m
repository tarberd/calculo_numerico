function a = polynomial_coeffitients(x, y)
  n = length(x) - 1;

  for i = 1 : n + 1
    for j = 1 : n + 1
      A(i, j) = sum(x .^ (i+j-2));
    end
    B(i, 1) = sum(x .^ (i - 1) .* y);
  end

  a = A \ B;
end

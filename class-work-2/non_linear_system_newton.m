function solution = non_linear_system_newton(f, g, initial_value, tolerance)
  dx = [tolerance; tolerance];

  iter_count = 0;
  while max(abs(dx)) >= tolerance && iter_count < 100
    jacob(1, 1) = (f( [initial_value(1)+dx(1); initial_value(2);] ) - f(initial_value))/dx(1);
    jacob(1, 2) = (f( [initial_value(1); initial_value(2)+dx(2);] ) - f(initial_value))/dx(2);
    jacob(2, 1) = (g( [initial_value(1)+dx(1); initial_value(2);] ) - g(initial_value))/dx(1);
    jacob(2, 2) = (g( [initial_value(1); initial_value(2)+dx(2);] ) - g(initial_value))/dx(2);

    image = -[f(initial_value); g(initial_value);];

    dx = jacob\image;

    initial_value = initial_value .+ dx;
    iter_count += 1;
  end
  solution = initial_value;
end

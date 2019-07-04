function a = sin_cos_coeffitients(x, y)
    % solve coefitient derivate system

    A(1, 1) = sum(sin(x) .* sin(x));
    A(1, 2) = sum(sin(x) .* cos(x));
    A(1, 3) = sum(sin(x));

    A(2, 1) = A(1, 2);
    A(2, 2) = sum(cos(x) .* cos(x));
    A(2, 3) = sum(cos(x));

    A(3, 1) = A(1, 3);
    A(3, 2) = A(2, 3);
    A(3, 3) = length(x);

    B(1, 1) = sum(y .* sin(x));
    B(2, 1) = sum(y .* cos(x));
    B(3, 1) = sum(y);

    a = A \ B;
end

function Gm = gauss(m, a, b, f)

    C = [1 1;];

    t = [-1/sqrt(3) 1/sqrt(3);];

    x = 0.5*(b - a).*t .+ 0.5.*(b + a);

    y = f(x);

    Gm = 0.5*(b-a)* sum( C(1:m) .* y(1:m) );
end

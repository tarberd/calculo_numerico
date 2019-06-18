function Gm = gauss(m, a, b, f)

    % corrigir para m > 2
    C = [1 1;];
    t = [-1/sqrt(3) 1/sqrt(3);];

    x = 0.5*(b - a).*t(m, 1:m) .+ 0.5.*(b + a);

    y = f(x);

    Gm = 0.5*(b-a)* sum( C(m, 1:m) .* y(1:m) );
end

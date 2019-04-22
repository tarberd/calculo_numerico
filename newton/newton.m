function x = newton(f, A, B, tolerancia)

    % achar raizes
    xi = localizar_raiz_real(f, A, B)

    for i = 1 : length(xi)

        diff = 10;
        max_it_count = 0;
        while diff > tolerancia && max_it_count < 100
            df = tan(xi(i)) + xi(i) * sec(xi(i)) * sec(xi(i));

            delta_x = -f(xi(i))/df;

            x(i) = xi(i) + delta_x;

            xi(i) = x(i);

            diff = abs(delta_x);

            max_it_count += 1;
        end

    end


end

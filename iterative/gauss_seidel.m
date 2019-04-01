function x = gauss_seidel(xi, tolerance)

    difference = 1;

    x = xi;

    it_cout = 0;
    while (difference > tolerance) && (it_cout < 150)
        x(1) = (3 + x(2) - x(3))/3;
        x(2) = (5 - x(1) - x(3))/3;
        x(3) = (4 - x(1) - x(2))/2;

        difference = max(abs(x .- xi));
        xi = x;
        it_cout += 1;
    end

end

function x = jacobi(xi, tolerance)

difference = 1;

    while difference > tolerance
        x(1) = (3 + xi(2) - xi(3))/3;
        x(2) = (5 - xi(1) - xi(3))/3;
        x(3) = (4 - xi(1) - xi(2))/2;

        difference = max(abs(x .- xi));

        xi = x;
        x;
    end

end

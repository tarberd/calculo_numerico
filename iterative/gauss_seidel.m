function x = gauss_seidel(xi, tolerance)

    difference = 1;

    x = xi

    while difference > tolerance
        x(1) = (3 + x(2) - x(3))/3;
        x(2) = (5 - x(1) - x(3))/3;
        x(3) = (4 - x(1) - x(2))/2;

        difference = max(abs(x .- xi));
    end

end

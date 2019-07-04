function a = sin_cos_inside_coefficients(x, y)
    % solve coefitient derivate system

    ai = [
            1;
            1;
            1;
            1;
            1;
         ];

    a = fNewtonNumSist(5, ai, x, y);

end

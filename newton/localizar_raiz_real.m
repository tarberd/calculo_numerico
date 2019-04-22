function xi = localizar_raiz_real(f, A, B)

    h = 0.1;
    x = A : h : B;
    y = f(x);

    % plot(x, y)
    % grid on
    % axis([A B -10 +10])
    % while true
    % end

    xi = [];
    for i = 1 : length(x) - 1
        if y(i)*y(i + 1) < 0 && abs(y(i) + y(i+1)) < 2
            xi = [xi (x(i) + x(i+1))*0.5];
    end

end

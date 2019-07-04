function Y=Fa(a, x, y)
    Y(1) = sum((a(1).*sin(a(2).*x) .+ a(3).*cos(a(4).*x) .+ a(5) .- y) .* sin(a(2).*x));
    %Y(2) = sum((a(1).*sin(a(2).*x) .+ a(3).*cos(a(4).*x) .+ a(5) .- y) .* a(1) .* cos(a(2).*x) .* x);
    Y(2) = sum((a(1).*sin(a(2).*x) .+ a(3).*cos(a(4).*x) .+ a(5) .- y) .* cos(a(2).*x) .* x);
    Y(3) = sum((a(1).*sin(a(2).*x) .+ a(3).*cos(a(4).*x) .+ a(5) .- y) .* cos(a(4).*x));
    %Y(4) = sum((a(1).*sin(a(2).*x) .+ a(3).*cos(a(4).*x) .+ a(5) .- y) .* a(3) .* (-sin(a(4).*x)) .* x);
    Y(4) = sum((a(1).*sin(a(2).*x) .+ a(3).*cos(a(4).*x) .+ a(5) .- y) .* (-sin(a(4).*x)) .* x);
    Y(5) = sum(a(1).*sin(a(2).*x) .+ a(3).*cos(a(4).*x) .+ a(5) .- y);
end

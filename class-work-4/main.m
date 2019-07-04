% 1. Determine pelo menos 3 aproximações g(x), de famílias diferentes, para representar os m=10 pontos por ajuste de curvas pelos mínimos quadrados:
%
% x=[ 1.0 2.1  3.0 3.9 5.0 6.0  7.2 8.1  9.2 10.4]
%
% y=[ 1.5 0.1 -0.4 0.2 1.7 2.2 1.6  0.4 -0.4  0.5 ]

x = [1.0 2.1  3.0 3.9 5.0 6.0  7.2 8.1  9.2 10.4]

y = [1.5 0.1 -0.4 0.2 1.7 2.2 1.6  0.4 -0.4  0.5]

%
% Teste funções aproximadoras g(x) polinomiais e de diferentes combinações de seno com cosseno.

aproximation_function_sin_cos = @(a, x) a(1) .* sin(x) .+ a(2) .* cos(x) .+ a(3)

aproximation_function_sin_cos_inside = @(a, x) a(1) .* sin(a(2) .* x) .+ a(3) .* cos(a(4) .* x) .+ a(5)

aproximation_function_polynomial = @(a, x) a(1) .+ a(2) .* x .+ a(3) .* x .^ 2 .+ a(4) .* x .^ 3 .+ a(5) .* x .^ 4 .+ a(6) .* x .^ 5 .+ a(7) .* x .^ 6 .+ a(8) .* x .^ 7 .+ a(9) .* x .^ 8 .+ a(10) .* x .^ 9

%
% Analise os resultados e justifique qual seria melhor aproximação que você obteve;

sin_cos_a = sin_cos_coefficients(x, y)

sin_cos_y = aproximation_function_sin_cos(sin_cos_a, x)

sin_cos_squared_sum = sum(abs(sin_cos_y .- y))

sin_cos_inside_a = sin_cos_inside_coefficients(x, y)

sin_cos_inside_y = aproximation_function_sin_cos_inside(sin_cos_inside_a, x)

sin_cos_inside_squared_sum = sum(abs(sin_cos_inside_y .- y))

polynomial_a = polynomial_coefficients(x, y)

polynomial_y = aproximation_function_polynomial(polynomial_a, x)

polynomial_squared_sum = sum(abs(polynomial_y .- y))

result = [
            sin_cos_squared_sum;
            sin_cos_inside_squared_sum;
            polynomial_squared_sum;
         ];

[min_square_sum min_square_sum_index] = min(result);

if min_square_sum_index == 1
  disp("The bether aproximation was from:");
  aproximation_function_sin_cos
  disp("With squared difference of:");
  min_square_sum
elseif min_square_sum_index == 2
  disp("The bether aproximation was from:");
  aproximation_function_sin_cos_inside
  disp("With squared difference of:");
  min_square_sum
elseif min_square_sum_index == 3
  disp("The bether aproximation was from:");
  aproximation_function_polynomial
  disp("With squared difference of:");
  min_square_sum
end

%
% 2.
%
% a). Crie uma função erf2(x), com precisão double (erro na O(1e-15), que calcule erf(x),
%     na sua forma integral usando o Método de Gauss-Legendre: http://www.wolframalpha.com/input/?i=erf(x).
%     Calcule o erro exato para qualquer x entre [0;1];

my_erf_result = my_erf(0.5)

erf_result = erf(0.5)

erro_erf = my_erf_result - erf_result

%
% b). Crie um polinômio de 1º grau (reta) que passe sobre os m=2 pontos gerados na Integração de Gauss-Legendre com m=2 pontos.
%     Integre-o analiticamente e compare com o resultado da formula de integração de Gauss-Legendre com m=2 pontos
%     (esses resultados devem ser exatamente os mesmos);

f = @(t) (2 ./ sqrt(pi)) .* exp(-1 .* t .^ 2)

[integral x y] = fGm(2, 0, 1, f)

integral_gm_2 = integral;

y =  y

line_tangent = ((y(2) - y(1)) / (x(2) - x(1)))

line_linear = y(1)

% line_function = @(t) line_tangent .* t .+ line_linear

integral_line_function = @(t) line_tangent .* ((t .^ 2) / 2 .- x(1) .* t) .+ line_linear .* t

integral_by_line = integral_line_function(1) - integral_line_function(0)

erro = integral_by_line - integral_gm_2


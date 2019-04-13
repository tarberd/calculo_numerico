% Dado o sistema linear abaixo para n=40 equações:
%
% para  i=1;                                  x(i)+x(i+1)=1.50;
%
% para  i=2:n/2                  x(i-1)+4*x(i)+x(i+1)=1.00;
%
% para  i=n/2+1:n-1           x(i-1)+5*x(i)+x(i+1)=2.00;
%
% para  i=n;                       x(i-1)+x(i)            =3.00;

% a). Armazene o sistema acima em forma de matriz completa;
n = 40;

for i = 1 : n
    for j = 1 : n
        A(i,j) = 0;
    end
end

for i = 1 : n
    if (i == 1)
        A(i, i) = 1;
        A(i, i+1) = 1;
        B(i) = 1.5;
    elseif (i == n)
        A(i, i - 1) = 1;
        A(i, i) = 1;
        B(i) = 3;
    elseif (i <= n/2)
        A(i, i - 1) = 1;
        A(i, i) = 4;
        A(i, i + 1) = 1;
        B(i) = 1.0;
    elseif (i > n/2)
        A(i, i - 1) = 1;
        A(i, i) = 5;
        A(i, i + 1) = 1;
        B(i) = 2.0;
    end
end

% a1). Resolva o sistema acima por um método direto completo (Eliminação Gaussiana (ECV) ou LU-Crout (CCO));

[lu_croat_solve float_ops] = lu_croat_solve(A, B);

image_by_lu_croat = lu_croat_solve * A;

% a2). Imprima somente a 1º e última incógnitas e o resíduo máximo;
printf("X(1) solved by lu_croat");
lu_croat_solve(1)

printf("X(40) solved by lu_croat");
lu_croat_solve(n)

printf("Residuo maximo by lu_croat");
residuo_max = max(abs(lu_croat_solve * A - B))

% a3). Calcule o número total de operações em PONTO FLUTUANTE utilizadas e calcule o número de operações teórico;
printf("lu_croat float operations count");
float_ops



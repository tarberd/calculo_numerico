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

T = [1 2 3;
     4 5 6;
     7 8 9;]

B = [1; 2; 3]

[L U B2] = lu_croat(A, B)


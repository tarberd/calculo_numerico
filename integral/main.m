a = 1;
b = 5;

f = @(x) 1./x;

I = log(b) - log(a)

%metodo dos trapesios
n = 32

Tn = fTm(n, a, b, f)

erroTn = abs(Tn - I)

erroTnEstimado = abs(Tn - fTm(2*n, a, b, f))

%metodo das parabolas ou de simpson
n = 8

Sn = fSm(n, a, b, f)

erroSn = abs(Sn - I)

erroSnEstimado = abs(Sn - fSm(2*n, a, b, f))

%metodo de gauss-legendre
m = 2

Gm = gauss(m, a, b, f)

erro_gauss = abs(Gm - I)

% erro_gaus_estimado = abs(Gm - gauss(m, a, b, f))

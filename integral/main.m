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

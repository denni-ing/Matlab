
clear
close all
clc
format long

%Implementazione menù scelta-------------------
exe = menu('SCELTA FUNZIONE',...
    '1) f(x)=x^2-2', ...
    '2) atan(x)', ...
    '3) xatan(x)' , ...
    '4) x^8-2',...
    '5) (exp(x)-1)^2');

switch exe
    case 1
        f=@(x) x.^2-2;
        df=@(x) 2*x;
        a=0; b=5;
    case 2
        f=@(x)atan(x);
        df=@(x)(x*0+1)./(1+x.^2);
        a=-10; b=10;
    case 3
        f=@(x)x.*atan(x);
        df=@(x)atan(x)+x./(1+x.^2);
        a=-5; b=5;
    case 4
        f= @(x)x.^8-2;
        df=@(x) 8*x.^7 ;
        a=0; b=5;
    case 5
        f=@(x)(exp(x)-1).^2;
        df =@(x)   2*exp(x).*(exp(x)-1);
        a=0; b=5;
end

%Dati in input---------------------------------

x0=input('Inserisci innesco x0: ');
toll=input('Inserisci tolleranza toll: ');
nmax=80;
errors=zeros(1, nmax);

%Richiamo funzione-----------------------
[x, i, errors]=newton(f, df, x0, toll, nmax, errors, a, b);

%Risultati
disp('=========================================================')
if i >= nmax
    disp('raggiunto numero max iterazioni')
end
disp('====================================================')
disp(['Numero max iterazioni consentite = ', num2str(nmax)])
disp(['Tolleranza = ', num2str(toll)])
disp(['Numero iterazioni = ', num2str(i)])
disp(['Soluzione ottenuta = ', num2str(x(end))])
disp('====================================================')


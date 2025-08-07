clear
clc

format long;
for N=[10 100 1000]
    h=1/N;
    i=linspace(0,N,N); %%%%%
    x=i*h; %%%%%

    f=@(x) 1./(1+x);
    y=f(x);

    z=trapz(x,y);

    Z=integral(f,0,1);

    disp('n: '); disp(N);

    disp('Risultato integrale: ');
    disp(Z);

    disp('Risultato formula dei trapezi: ');
    disp(z);

    error=abs(z-log(2));
    disp('Errore trapezi: ');
    disp(error);

    errorint=abs(Z-log(2));
    disp('Errore integrale: ');
    disp(errorint);
    disp('======================================')
end
clear
close all
clc

y=@(x) sin(2*pi*x);
a=-1; b=1;

FileID=fopen('errore.txt','w');

for n=3:2:9
    A=coeff(n, y, a, b);

    fprintf(FileID,'Errore relativo al polinomio P(%d)\n',n);
    [P,t]=pol(A, a, b, y, FileID);
    fprintf(FileID,'\n');

    f=y(t);

    figure(n);
    hold on;
    grid on;

    plot(t,f,'b-','DisplayName','Funzione f');
    plot(t,P,'r--','DisplayName','Polinomio interpolante');
    scatter(t, f, 'ko','DisplayName','Punti');
    xlabel('Asse x'); ylabel('Asse y');
    title('polinomi per approssimazione');
    legend show;

end

fclose(FileID);

function A=coeff(n, y, a, b)
    m=20;

    i=0:m;
    h=(b-a)/m;
    x=a+i*h;
    
    f=y(x);

    B=zeros(m+1,n+1);
    for i=1:m+1
        for j=0:n
            B(i,j+1)=x(i)^j;
        end
    end
    A=(B'*f')\(B'*B);
end

function [P,t]=pol(A, a, b, y, FileID)
    t=linspace(a, b, 200);
    P=zeros(1,length(t));
    f=y(t);
    
    for k=1:length(t)
        x=t(k);
        Pn=A(end);
        for j=length(A)-1:-1:1
            Pn=Pn*x+A(j);
        end
        P(k)=Pn;
    end
    Error=sqrt(sum((f-P).^2));
    fprintf(FileID,'Errore: %f\n',Error);
end


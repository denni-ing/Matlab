clear
clc

M=menu('Scegli operazione','det','norma 2',...
        'norma inf','inversa','K di norma 2',...
        'K di norma inf','raggio spettrale');

switch M
    case 1
       for n=[10 100 1000 2000 3000 5000]
            H=hilb(n);
    
            tic
            ris=det(H);
            t=toc;
    
            disp('n=');disp(n);
            disp('tempo calcolo del determinante: ');disp(t);
            disp('===============================')
       end 
    case 2
        for n=[10 100 1000 2000 3000 5000]
            H=hilb(n);
    
            tic
            ris=norm(H,2);
            t=toc;
    
            disp('n=');disp(n);
            disp('tempo calcolo norma 2: ');disp(t);
            disp('===============================')
        end
    case 3
        for n=[10 100 1000 2000 3000 5000]
            H=hilb(n);
    
            tic
            ris=norm(H,inf);
            t=toc;
    
            disp('n=');disp(n);
            disp('tempo calcolo norma infinito: ');disp(t);
            disp('===============================')
        end
    case 4
        for n=[10 100 1000 2000 3000 5000 10000]
            H=hilb(n);
    
            tic
            ris=inv(M);
            t=toc;
    
            disp('n=');disp(n);
            disp('tempo calcolo inversa: ');disp(t);
            disp('===============================')
        end
    case 5
        for n=[10 100 1000 2000 3000]
            H=hilb(n);
    
            tic
            ris=cond(H,2);
            t=toc;
    
            disp('n=');disp(n);
            disp('tempo calcolo di K(norma 2): ');disp(t);
            disp('===============================')
        end
    case 6
        for n=[10 100 1000 2000 3000]
            H=hilb(n);
    
            tic
            ris=cond(H,inf);
            t=toc;
    
            disp('n=');disp(n);
            disp('tempo calcolo di K(norma inf): ');disp(t);
            disp('===============================')
        end
    case 7
        for n=[10 100 1000 2000 3000 5000]
            H=hilb(n);
    
            tic
            ris=max(abs(eig(H)));
            t=toc;
    
            disp('n=');disp(n);
            disp('tempo calcolo raggio spettrale: ');disp(t);
            disp('===============================')
        end
end




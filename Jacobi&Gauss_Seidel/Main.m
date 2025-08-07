clear
clc

%A=[4 0 1 -1; -1 0 1 -2; -3 1 1 0; 0 0 0 -1];
n=5;
%creo la matrice
A=diag(2*ones(1,n))-diag(ones(1,n-1),1)-diag(ones(1,n-1),-1);

%creo b
xx=ones(n,1);
b=A*xx;

nmax=1000; %numero massimo di iterazioni
toll=10^(-6); %tolleranza
X0=zeros(n,1);

[X, error, i]=Jacobi(A, b, X0, nmax, toll); %chiamata funzione jacobi
[xn, ni, errn] = gauss_seidel_v2(A, b, X0, nmax, toll); %chiamata funzione gauss_seidel

%OUTPUT JACOBI
disp('Soluzione JACOBI:');
disp(X);
disp(['Errore: ', num2str(error)]);
disp(['Numero di iterazioni: ', num2str(i)]);
disp('==========================================')
%OUTPUT GAUSS
disp('Soluzione GAUSS-SEIDEL:');
disp(xn);
disp(['Errore: ', num2str(errn)]);
disp(['Numero di iterazioni: ', num2str(ni)]);


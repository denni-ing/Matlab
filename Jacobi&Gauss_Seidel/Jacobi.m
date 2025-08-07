%FUNZIONE Jacobi
function [X, error, i]=Jacobi(A, b, X0, nmax, toll)
    L=tril(A,-1); U=triu(A,1); 
    d=diag(A);
    D=diag(d);
    
    D_inv=diag(1./d);
    i=1;
    
    %calcolo delle matrici necessarie
    P=D_inv*(-L-U);
    q=D_inv*b;

    %inizializzazione
    X=X0;
    error=toll + 1; %garantisce la prima iterazione
    
    while i<nmax && error>toll
        i=i+1;
        X_new = P*X+q;
        error=norm(X_new-X,2); %calcolo errore
        X=X_new;
    end

    if i == nmax
        disp('Raggiunto il numero massimo di iterazioni.');
    end
    
end
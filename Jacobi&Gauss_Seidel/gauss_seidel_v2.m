function [xn, n, errn] = gauss_seidel_v2(A, b, x0, nmax, tol)

    M = tril(A);
    N = -triu(A,1);
    
    % Risolve LD * GS = U :   GS = LD \U
    n = 0;
    v = N*x0+b;
    xn = M\v;
    errn = norm(xn-x0);
    while n<=nmax && errn>tol
        x0 = xn;
        v = N*x0+b;
        xn = M\v;
        errn = norm(xn-x0);
        n = n+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       ESEMPIO COMPRESSIONE DI IMMAGINI CON SVD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear
clc
imchoice = menu('Scelta Immagine', 'Peperoni', 'Lena');
switch imchoice
    case 1
        A=imread('wpeppers.jpg');
    case 2
        A=imread('Lenna.jpg');
end
% Conversione in scala di grigi
X = double(rgb2gray(A));
% altezza immagine
nx=size(X,1);
% larghezza immagine
ny=size(X,2);
% Rappresentazione immagine originale
i=1; subplot(2,2,i)
imagesc(X)
colormap gray; hold off
title(['Immagine iniziale mn = ', num2str(nx*ny)],'Interpreter','latex')
% SVD
[U,S,V] = svd(X);
s = diag(S);


% Compsessione con  'r'valori singolari
Vt =V';
for r =[ 5 20 60]
    i = i+1;
    ind =1:r;
    Xappr = U(:,ind)*S(ind,ind)*Vt(ind,:);
    subplot(2,2,i)
    imagesc(Xappr)
    colormap gray; hold off
    dim = r*nx+r*ny+r;
    title(['Immagine compressa con r= ', num2str(r), ', con rm+rn+r=',num2str(dim)],'Interpreter','latex') 
    risparmio =100*(1-dim/(nx*ny));
    xlabel([ 'risparmio = ', num2str(risparmio),'%, err =', num2str(s(r+1))])
   
end

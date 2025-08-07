clear
close all
clc

matrici = menu('scelta matrice','A1', 'A2', 'A3');

switch matrici
    case 1
        A= [4 -1 1 0 0;
            1 3 -1 0 0;
            0 1 1 0 0;
            0 0 0 2 1;
            0 0 0 1 8];
        caso='scelta 1';
    case 2
        scelta = menu('scelta n','3','4','5');
        switch scelta
            case 1
                n=3;
            case 2
                n=4;
            case 3
                n=5;
        end
        caso='scelta 2';
        Ik=eye(n);
        A=[Ik 2*Ik -2*Ik;
            Ik Ik Ik;
            2*Ik 2*Ik Ik];
    case 3
        v=[0 1 1 2]';
        n=4;
        I=eye(n);
        A=3*I+v*v';
        caso='scelta 3';
end

n=length(A);
r=zeros(1,n);
t=linspace(0,2*pi,1000);

%calcolo cerchi riga
figure(Name='Gerschgorin');
subplot(2,1,1);
hold on;
for i=1:n

    %centro
    C=A(i,i);
    
    %raggio
    r=sum(abs(A(i,:)))-abs(A(i,i));

    % Coordinate del cerchio
    x = r * cos(t) + C; % Centro del cerchio sull'asse x
    y = r * sin(t);     % Estensione sull'asse y

    fill(x,y,'yellow',Edgecolor='black',LineWidth=1,FaceAlpha=0.5);
end
%configurazione
axis equal;
xlabel('Re');
ylabel('Im');
title('Cerchi riga');
grid on;

subplot(2,1,2);
hold on
for j=1:n
    
    %centro
    C=A(j,j);
    
    %raggi
    r=sum(abs(A(:,j)))-abs(A(j,j));
    
    % Coordinate del cerchio
    x = r * cos(t) + C; % Centro del cerchio sull'asse x
    y = r * sin(t);     % Estensione sull'asse y

    fill(x,y,'blue',Edgecolor='black',LineWidth=1,FaceAlpha=0.5);
end
axis equal;
xlabel('Re');
ylabel('Im');
title('Cerchi colonna');
grid on;

%apertura file
fileID=fopen('risultati.txt','w');
fprintf(fileID, 'Valori dei minori principali della %s:\n',caso);

%Verifico minori principali matrice
pos=true;
for i=1:n
    a=A(1:i, 1:i);
    d=det(a);
    fprintf(fileID, 'minore %dx%d: %f\n', i, i, d);
    if d<=0
        fprintf(fileID, 'La matrice non è definita positiva.\n');
        pos=false;
        disp('esecuzione bloccata per matrice definita negativa');
        break;
    end
end

if pos
    fprintf(fileID, 'La matrice è definita positiva.\n');
end

fclose(fileID);
disp('Valori dei minori principali salvati nel file "risultati.txt".');
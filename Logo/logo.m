clear
close all
clc

%cerchio esterno
t=linspace(0,2*pi,1000);
x1=2.*cos(t);
y1=2.*sin(t);

fill(x1,y1,'green','EdgeColor', 'black', LineWidth=2);
hold on

%curva rodonea
x2=2.*cos(6*t).*cos(t);
y2=2.*cos(6*t).*sin(t);

fill(x2,y2,'yellow','EdgeColor','black',LineWidth=2);

%cerchio interno
x3=1/3.*cos(t);
y3=1/3.*sin(t);

fill(x3,y3,'red',EdgeColor='black',LineWidth=2);

axis equal;

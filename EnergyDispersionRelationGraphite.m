% see Saito, Dresselhaus - "Phisical properties of carbon nanotubes" pages
% 27 and 28

clc
clear all;
close all;

%phi_a = 1;
%phi_b = 1;
nano = 10^-9;
a = 1;
e2p = 0;
t = -3.033;
s = 0.129;

k_x = -2*pi/(sqrt(3)*a) : 0.1 : 2*pi/(sqrt(3)*a);
%k_y = -3/2*pi/a : 0.1 : 3/2*pi/a;
k_y = -2*3/(sqrt(2)*a) : 0.1 : 2*3/(sqrt(2)*a);
for i = 1:length(k_y)
   for j = 1:length(k_x)
        omega = sqrt(1+4*cos(sqrt(3)*k_x(j)*a/2)*cos(k_y(i)*a/2)+ 4*cos(k_y(i)*a/2)*cos(k_y(i)*a/2));
        Eg2Dn (i,j) = (e2p + t*omega)/(1 + s*omega);
        Eg2Dp (i,j) = (e2p - t*omega)/(1 - s*omega);
   end
end
figure ('Name','Energy Dispersion Relation 2D Graphite','NumberTitle','off');
subplot('Position',[0 0.25 1 0.75]);
title("Energy Dispersion Relation 2D Graphite");
surf(k_x, k_y,  Eg2Dn);
hold on;
surf(k_x, k_y, Eg2Dp);
colorbar;
xlabel ('k_x');
ylabel ('k_y');
text(0,0, max(Eg2Dp,[], 'all')+0.1*(max(Eg2Dp,[], 'all')), '\Gamma');
min_E = min(Eg2Dp,[], 'all');
index = find(Eg2Dp == min_E);
text(k_x(index), k_y(index), Eg2Dp(index), 'K');
min_ky = min(k_y(fix((end+3)/2):end)); %solo k_y > 0
index = find(k_y == min_ky);
text(pi, 0, Eg2Dp(index), 'M');

%hexagon1(a, 0, 0);
[x, y] = hexagon2(a, 0, 0);
subplot('Position',[0.4 0.1 0.15 0.15]);
title("Unit cell");
plot(x,y);
text(0,0, '\Gamma');
text(a*sqrt(3)*0.5, 0.5, 'K');
text(a*sqrt(3)*0.5, 0, 'M');
clc 
p = 1000;
c = 0.850;
a = 0.07;
b = 0.24;
v = (pi/4)*a^2*b;
thruster_mz=p*c*v;

a = 0.24/2;
b = 0.07/2;
v = (pi*4/3)*b^2*a;
c = 0.1104;

thruster_mx=p*c*v;

a =  0.7/2;
l =  0.24;
c = 1;

thruster_Iy = ((l^3)/3)*p*c*pi*a^2;
thruster_Iz = thruster_Iy;


Mas_trhuster = [thruster_mx 0 0 0 0 0;0 0 0 0 0 0;
                0 0 thruster_mz 0 0 0;0 0 0 0 0 0;
                0 0 0 0 thruster_Iy 0 ;
                0 0 0 0 0 thruster_Iz]
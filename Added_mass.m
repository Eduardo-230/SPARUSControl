clc

p = 1000;
c= 1;
r = 0.115;
l=1.2;
m22az = p*c*pi*r^2*l
m22ay = p*c*pi*r^2*l


b = 0.22;
l = 0.28;
c= 1-(r/b)^2+(r/b)^4;
m22by = p*c*pi*r^2*l;
m22bz = p*c*pi*b^2*l;


l=1.49;
r =  -(0.0075*l^3)/3 + (0.0205*l^2)/2 + 0.0975*l;
one = p*c*pi*r^2;
l=1.60;
r =  -(0.0075*l^3)/3 + (0.0205*l^2)/2 + 0.0975*l;
two = p*c*pi*r^2;


m22cz = two-one;
m22cy = m22cz;

m22y = m22ay+m22by+m22cy
m22z = m22az+m22bz+m22cz






x = -.59
y = 0.17
z = 0
m = 0.32215625



Ix = 0.005637734



Iy = 0.001776557



Iz = 0.001776557




Ig = [Ix 0 0;0 Iy 0;0 0 Iz];

ssqueare = [y^2+z^2 -x*y -x*z;-x*y x^2+z^2 -y*z; -x*z -y*z x^2+y^2]

Io = Ig-m*ssqueare
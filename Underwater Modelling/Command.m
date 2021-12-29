function [Out] = Command(PosE,VitB,AccB)

%Thrust=[0 0 0]:[VerticalThruster, LeftHorizontalThruster, RightHorizontalThruster]

set_h = 5;

Kd = 180;
Kp = 45;
delta_h = set_h - PosE(3);
thrust_h  = -Kp*delta_h+Kd*VitB(3);
Thrust=[thrust_h 0 0];


if (delta_h<0.2&&delta_h>-0.2)
set_s = 20;
Kd =  180;
Kp = 45;
delta_s = set_s - PosE(1);
thurst_s = -Kp*delta_s + Kd*VitB(1);

Thrust=[thrust_h thurst_s thurst_s];
end    

Out=Thrust;

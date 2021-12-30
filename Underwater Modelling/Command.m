function [Out] = Command(PosE,VitB,AccB)

%Thrust=[0 0 0]:[VerticalThruster, LeftHorizontalThruster, RightHorizontalThruster]

set_h = 5;

Kd = 400; %Initial Value: 180
Kp = 45;
delta_h = set_h - PosE(3);
thrust_h  = Kp*delta_h-Kd*VitB(3);

if (delta_h<0.2&&delta_h>-0.2&&PosE(1)<19) %if  SParus arrived to a depth of 5m, move foward 20m. 
    set_vs = 1;
    Kd =  100;
    Kp = 500; %Initial Value: 360
    Ki = 0.3;
    delta_s = set_vs - VitB(1);
    thrust_s = Kp*delta_s - Kd*AccB(1) + Ki*PosE(1);
    thrust_h = 0.8*thrust_h;

elseif (PosE(1)>19)  
    set_s = 20;
    Kd = 180;
    Kp = 25;
    delta_s = set_s - PosE(1);
    thrust_s  = Kp*delta_s-Kd*VitB(1);
else                   
    set_s = 0;
    Kd = 180;
    Kp = 25;    %Initial Value:25
    delta_s = set_s - PosE(1);
    thrust_s  = Kp*delta_s-Kd*VitB(1);
end    
Thrust=[thrust_h thrust_s thrust_s];

Out=Thrust;
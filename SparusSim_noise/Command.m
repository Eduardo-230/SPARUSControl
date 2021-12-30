function [Out] = Command(PosE,VitB,AccB)



% commande nulle
set_h = 5;

Kd = 180;
Kp = 45;
delta_h = set_h - PosE(3);
thrust_h  = -Kp*delta_h+Kd*VitB(3);



if (delta_h<0.2&delta_h>-0.2&PosE(1)<19) %if  Sparus arrived to a depth of 5m, move foward 20m with a vel of 1ms 
    set_vs = 1;
    Kd =  100;
    Kp = 360;
    Ki = 0.3;
    delta_s = set_vs - VitB(1);
    thrust_s = -Kp*delta_s + Kd*AccB(1) - Ki*PosE(1);

elseif (PosE(1)>19)  % beofore arriving to 20m change to pos control to stay at 20m. 
    set_s = 20;
    Kd = 180;
    Kp = 25;
    delta_s = set_s - PosE(1);
    thrust_s  = -Kp*delta_s+Kd*VitB(1);
else                   
    thrust_s = 0;
end    
Thrust=[thrust_h thrust_s thrust_s];
Out=Thrust;

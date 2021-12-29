function [Out] = Command(PosE,VitB,AccB)



% commande nulle
set_h = 5;

Kd = 180;
Kp = 45;
delta_h = set_h - PosE(3);
thrust_h  = -Kp*delta_h+Kd*VitB(3);



if (delta_h<0.2&delta_h>-0.2&PosE(1)<12) %if  SParus arrived to a depth of 5m, move foward 20m. 
set_s = 1;
Kd =  100;
Kp = 260;
Ki = 0.3;
delta_s = set_s - VitB(1);
thurst_s = -Kp*delta_s + Kd*AccB(1) - Ki*PosE(1);

elseif (PosE(1)>20&PosE(1)<20.4)  %short (400ms) reverse pulse on motors to break inertia
    thurst_s = 11;

else                   
    thurst_s = 0;
end    
Thrust=[thrust_h thurst_s thurst_s];
Out=Thrust;

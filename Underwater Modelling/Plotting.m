%% here you can implement the code in order to have some figures ...
%%
%time = linspace(0,10,1001);
time = (1:size(PosE,1))*0.01;

figure(1)
title('Position on X Axis')
hold on
grid on
plot(time,PosE_S(:,1))

figure(2)
title('Position on Y Axis')
hold on
grid on
plot(time,PosE_S(:,2))

figure(3)
title('Position on Z Axis')
hold on
grid on
plot(time,PosE_S(:,3))

figure(4)
title('Angular Position on X Axis')
hold on
grid on
plot(time,PosE_S(:,4))

figure(5)
title('Angular Position on Y Axis')
hold on
grid on
plot(time,PosE_S(:,5))

figure(6)
title('Angular Position on Z Axis')
hold on
grid on
plot(time,PosE_S(:,6))

figure(7)
title('Thruster Forces')
hold on
grid on
plot(time,Thrust_S(:,:))

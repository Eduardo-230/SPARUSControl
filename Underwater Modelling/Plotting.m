%% here you can implement the code in order to have some figures ...
%%
time = (1:size(PosE,1))*0.01;

figure
title('Position on X, Y and Z Axis')
hold on
grid on
plot(time,PosE_S(:,1));
plot(time,PosE_S(:,2));
plot(time,PosE_S(:,3));
legend('X','Y','Z');

figure
title('Angular Position on X, Y and Z Axis')
hold on
grid on
plot(time,PosE_S(:,4));
plot(time,PosE_S(:,5));
plot(time,PosE_S(:,6));
legend('X','Y','Z');

figure
title('Velocity on X, Y and Z Axis')
hold on
grid on
plot(time,VitB_S(:,1));
plot(time,VitB_S(:,2));
plot(time,VitB_S(:,3));
legend('X','Y','Z');

figure
title('Thruster Forces')
hold on
grid on
plot(time,Thrust_S(:,:))
legend('X','Y','Z');

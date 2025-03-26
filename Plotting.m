%% here you can implement the code in order to have some figures ...
%%
close all;
time = (1:size(PosE,1)) * 0.01;

% Positions
figure(1) 
subplot(3, 2, 1)
plot(time, PosE_S(:, 1))
hold on
plot(time, PosE_S(:, 2))
plot(time, PosE_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Position')
xlabel('time (s)')
ylabel('position (m)')

subplot(3, 2, 2)
plot(time, rad2deg(PosE_S(:, 4)))
hold on
plot(time, rad2deg(PosE_S(:, 5)))
plot(time, rad2deg(PosE_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Euler angles')
xlabel('time (s)')
ylabel('angle (deg)')

% Velocities
subplot(3, 2, 3)
plot(time, VitB_S(:, 1))
hold on
plot(time, VitB_S(:, 2))
plot(time, VitB_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Linear velocities')
xlabel('time (s)')
ylabel('velocity (m/s)')

subplot(3, 2, 4)
plot(time, rad2deg(VitB_S(:, 4)))
hold on
plot(time, rad2deg(VitB_S(:, 5)))
plot(time, rad2deg(VitB_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Angular velocities')
xlabel('time (s)')
ylabel('omega (deg/s)')

% Accelerations
subplot(3, 2, 5)
plot(time, AccB_S(:, 1))
hold on
plot(time, AccB_S(:, 2))
plot(time, AccB_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Linear accelerations')
xlabel('time (s)')
ylabel('acceleration (m/s^2)')

subplot(3, 2, 6)
plot(time, rad2deg(AccB_S(:, 4)))
hold on
plot(time, rad2deg(AccB_S(:, 5)))
plot(time, rad2deg(AccB_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Angular accelerations')
xlabel('time (s)')
ylabel('angular accel. (deg/s^2)')



figure(2) 
subplot(2, 1, 1)
plot(time, PosE_S(:, 1))
hold on
plot(time, PosE_S(:, 2))
plot(time, PosE_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Position')
xlabel('time (s)')
ylabel('position (m)')

subplot(2, 1, 2)
plot(time, rad2deg(PosE_S(:, 4)))
hold on
plot(time, rad2deg(PosE_S(:, 5)))
plot(time, rad2deg(PosE_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Euler angles')
xlabel('time (s)')
ylabel('angle (deg)')

figure(3) 
plot(time, PosE_S(:, 1))
hold on
plot(time, PosE_S(:, 2))
plot(time, PosE_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Position')
xlabel('time (s)')
ylabel('position (m)')


figure(4)
subplot(2, 2, 1)
plot(PosE_S(:, 1),PosE_S(:, 3), '-b')
xlabel("X position")
ylabel("Z position")
set(gca,'YDir','reverse')
title('Trajectory')
grid on

subplot(2, 2, 2)
plot(time, rad2deg(PosE_S(:, 4)))
hold on
plot(time, rad2deg(PosE_S(:, 5)))
plot(time, rad2deg(PosE_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Euler angles')
xlabel('time (s)')
ylabel('angle (deg)')

% Accelerations
subplot(2, 2, 3)
plot(time, AccB_S(:, 1))
hold on
plot(time, AccB_S(:, 2))
plot(time, AccB_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Linear accelerations')
xlabel('time (s)')
ylabel('acceleration (m/s^2)')

subplot(2, 2, 4)
plot(time, rad2deg(AccB_S(:, 4)))
hold on
plot(time, rad2deg(AccB_S(:, 5)))
plot(time, rad2deg(AccB_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Angular accelerations')
xlabel('time (s)')
ylabel('angular accel. (deg/s^2)')




figure(5)
subplot(2, 2, 1)
plot(PosE_S(:, 1),PosE_S(:, 2), '-b')
xlabel("X position")
ylabel("Y position")
set(gca,'YDir','reverse')
title('XY Trajectory')
grid on

subplot(2, 2, 2)
plot(time, rad2deg(PosE_S(:, 4)))
hold on
plot(time, rad2deg(PosE_S(:, 5)))
plot(time, rad2deg(PosE_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Euler angles')
xlabel('time (s)')
ylabel('angle (deg)')

% Accelerations
subplot(2, 2, 3)
plot(time, AccB_S(:, 1))
hold on
plot(time, AccB_S(:, 2))
plot(time, AccB_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Linear accelerations')
xlabel('time (s)')
ylabel('acceleration (m/s^2)')

subplot(2, 2, 4)
plot(time, rad2deg(AccB_S(:, 4)))
hold on
plot(time, rad2deg(AccB_S(:, 5)))
plot(time, rad2deg(AccB_S(:, 6)))
hold off
grid on
legend('Roll', 'Pitch', 'Yaw')
title('Angular accelerations')
xlabel('time (s)')
ylabel('angular accel. (deg/s^2)')


figure(6)
subplot(1, 2, 1)
plot(time, PosE_S(:, 1))
hold on
plot(time, PosE_S(:, 2))
plot(time, PosE_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Position')
xlabel('time (s)')
ylabel('position (m)')

subplot(1, 2, 2)
plot(time, VitB_S(:, 1))
hold on
plot(time, VitB_S(:, 2))
plot(time, VitB_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Linear velocities')
xlabel('time (s)')
ylabel('velocity (m/s)')


figure(7)
plot(time, VitB_S(:, 1))
hold on
plot(time, VitB_S(:, 2))
plot(time, VitB_S(:, 3))
hold off
grid on
legend('Surge', 'Sway', 'Heave')
title('Linear velocities')
xlabel('time (s)')
ylabel('velocity (m/s)')
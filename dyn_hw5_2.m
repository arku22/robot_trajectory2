%Robot Dynamics HW5, Q2(a)

clc;clear all;close all;
%%
% Mass 1
q0 = 30.66; qf = 98.04;
v0 = 0; vf = 0;
t0 = 1; tf = 5;
b = [q0; v0; qf; vf];
M = [1 t0 t0^2 t0^3;...
    0 1 2*t0 3*t0^2;...
    1 tf tf^2 tf^3;...
    0 1 2*tf 3*tf^2];
a = inv(M)*b;
t = linspace(t0, tf, 100*(tf-t0));
c = ones(size(t));
qd = a(1).*c + a(2).*t + a(3).*t.^2 + a(4).*t.^3;
vd = a(2).*c + 2*a(3).*t + 3*a(4).*t.^2;
ad = 2*a(3).*c + 6*a(4).*t;

subplot(1,3,1);
hold on
plot(t, qd, 'k');
hold on
title('Mass 1: Time vs Position graph');
ylabel('Position(deg)');
xlabel('Time(sec)');
hold off

subplot(1,3,2);
hold on
plot(t, vd);
hold on
title('Mass 1: Time vs Velocity graph');
ylabel('Velocity(deg/sec)');
xlabel('Time(sec)');
hold off

subplot(1,3,3);
hold on
plot(t, ad, 'r');
hold on
title('Mass 1: Time vs Acceleration graph');
ylabel('Acceleration(deg/sec^2)');
xlabel('Time(sec)');
hold off

%%
%Mass 2
q0 = 51.31; qf = 51.31;
v0 = 0; vf = 0;
t0 = 1; tf = 5;
b = [q0; v0; qf; vf];
M = [1 t0 t0^2 t0^3;...
    0 1 2*t0 3*t0^2;...
    1 tf tf^2 tf^3;...
    0 1 2*tf 3*tf^2];
a = inv(M)*b;
t = linspace(t0, tf, 100*(tf-t0));
c = ones(size(t));
qd = a(1).*c + a(2).*t + a(3).*t.^2 + a(4).*t.^3;
vd = a(2).*c + 2*a(3).*t + 3*a(4).*t.^2;
ad = 2*a(3).*c + 6*a(4).*t;

subplot(1,3,1);
hold on
plot(t, qd);
hold on
title('Time vs Position graph');
ylabel('Position(deg)');
xlabel('Time(sec)');
legend('Mass 1', 'Mass 2','north');
hold off

subplot(1,3,2);
hold on
plot(t, vd);
hold on
title('Time vs Velocity graph');
ylabel('Velocity(deg/sec)');
xlabel('Time(sec)');
legend('Mass 1','Mass 2','north');
hold off

subplot(1,3,3);
hold on
plot(t, ad);
hold on
title('Time vs Acceleration graph');
ylabel('Acceleration(deg/sec^2)');
xlabel('Time(sec)');
legend('Mass 1','Mass 2','north');
hold off

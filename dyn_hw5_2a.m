%Robot Dynamics HW5, Q2(a) continued

clc;clear all;close all;

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

%Plotting the graph
for t=0:0.08:5
    qd = a(1) + a(2)*t + a(3)*t^2 + a(4)*t^3;
    syms t1 t2
    t1 = qd; t2 = 51.61;
    l1 = 300; l2 =300;
    A1 = [cosd(t1) -sind(t1) 0 l1*cosd(t1);...
          sind(t1) cosd(t1) 0 l1*sind(t1);...
          0 0 1 0;...
          0 0 0 1];
    A2 = [cosd(t2) -sind(t2) 0 l2*cosd(t2);...
          sind(t2) cosd(t2) 0 l2*sind(t2);...
          0 0 1 0;...
          0 0 0 1];
    T = A1 * A2;
    position = T(1:2, 4);
    xpos = position(1);
    ypos = position(2);
    plot(xpos, ypos,'*');
    hold on
end
figure(1)
axis ([-400 400 0 700])
grid on
title('End effector trajectory(Task space)');
hold off


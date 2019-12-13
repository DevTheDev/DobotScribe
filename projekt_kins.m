syms x y z theta1 theta2 theta3 t
syms x1 x2 x3 y1 y2 y3 z1 z2 z3
syms L1 L2 L3

p0t=[x;y;z]
r1=[cos(theta1) -sin(theta1) 0
    sin(theta1) cos(theta1) 0
    0 0 1]
r2=[cos(theta2) 0 sin(theta2)
    0 1 0
    -sin(theta2) 0 cos(theta2)]
r3=[cos(theta3) 0 sin(theta3)
    0 1 0
    -sin(theta3) 0 cos(theta3)]
p01=[0;0;L1]
p12=[(cos(pi/4))*L2
    0
    (cos(pi/4))*L2]
p2t=[(cos(pi/4))*L3
    0
    -(cos(pi/4))*L3]

p0t=p01+r1*r2*(p12+r3*p2t)%forward kinematics

x1=diff(p0t(1), theta1)
x2=diff(p0t(1), theta2)
x3=diff(p0t(1), theta3)
y1=diff(p0t(2), theta1)
y2=diff(p0t(2), theta2)
y3=diff(p0t(2), theta3)
z1=diff(p0t(3), theta1)
z2=diff(p0t(3), theta2)
z3=diff(p0t(3), theta3)
J=[x1 x2 x3
    y1 y2 y3
    z1 z2 z3]



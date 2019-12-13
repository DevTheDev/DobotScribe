%forward kinematics for the projekt
function[ pos ]=projekt_forward(theta)
syms L1 L2 L3

L1= 145;%mm
L2= 135;%mm
L3= 160;%mm

r1=[cos(theta(1)) -sin(theta(1)) 0
    sin(theta(1)) cos(theta(1)) 0
    0 0 1];
r2=[cos(theta(2)) 0 sin(theta(2))
    0 1 0
    -sin(theta(2)) 0 cos(theta(2))];
r3=[cos(theta(3)) 0 sin(theta(3))
    0 1 0
    -sin(theta(3)) 0 cos(theta(3))];
p01=[0;0;L1];
p12=[(cos(pi/4))*L2
    0
    (cos(pi/4))*L2];
p2t=[(cos(pi/4))*L3
    0
    -(cos(pi/4))*L3];

pos=p01+r1*r2*(p12+r3*p2t);%forward kinematics
end
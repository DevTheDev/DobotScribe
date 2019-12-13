function[ theta ]=getIK(x, y, z)
%%% PROBLEM: No checking for out of workspace, so if you give it bad coords
%%% it just takes forever and then returns nothing.
syms L1 L2 L3

L1= 145;%mm
L2= 135;%mm
L3= 160;%mm

syms theta1 theta2 theta3
thet=[theta1;theta2;theta3];
equations= projekt_forward(thet)-[x;y;z];

vars= [theta1 theta2 theta3];
range=[-pi/2 pi/2;-pi/4 pi/2;-pi/4 pi/3];
sol=vpasolve(equations,vars,range);
theta=[sol.theta1 sol.theta2 sol.theta3].';
end
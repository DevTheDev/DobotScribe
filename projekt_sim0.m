clearvars
clc
close all
tspan=[0 1];
ic0=[0;0;0];
charles=input('number: ', 's')
char=10*(projekt_chars(charles));

for col=1:size(char,2)
char(1,col)=char(1,col)+200;
end

pos0=projekt_forward(ic0)

alex=(char(:,1)-pos0);%path vector input
[t, x]= ode15s(@projekt_kins_f, tspan, ic0, [], alex(1), alex(2), alex(3));

figure(1)
hold off
plot(t, x)
hold on

carl=[];
for i=1:size(x,1)
    anna=(projekt_forward(x(i,:))).';
    carl=[carl;anna];
end
plot(t,carl)
legend('theta1','theta2','theta3','x','y','z')
figure(11)
plot3(carl(:,1),carl(:,2),carl(:,3))
figure(12)
plot(carl(:,1),carl(:,2))

for i=2:size(char,2);
    icc=x(size(x,1),:);%from previous path
    posn=projekt_forward(icc)
    chris=(char(:,i)-posn);%path vector input
    [t, x]=ode15s(@projekt_kins_f, tspan, icc, [], chris(1), chris(2), chris(3));
    
    figure(i)
    hold off
    plot(t, x)
    hold on
    
    carl=[];
    for i=1:size(x,1)
        anna=(projekt_forward(x(i,:))).';
        carl=[carl;anna];
    end
    
    plot(t,carl)
    legend('theta1','theta2','theta3','x','y','z')
    figure(11)
    hold on
    plot3(carl(:,1),carl(:,2),carl(:,3))
    figure(12)
    hold on
    plot(carl(:,1),carl(:,2))
end
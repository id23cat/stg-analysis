x=[0.1 0.2 0.4 0.5 0.6 0.8 1.2];
y=[-3.5 -4.8 -2.1 0.2 0.9 2.3 3.7];
plot(x,y,'ko')
p4=polyfit(x,y,4);
p5=polyfit(x,y,5);
p6=polyfit(x,y,6);
t = 0.1:0.01:1.2;
P4 = polyval(p4,t);
P5 = polyval(p5,t);
P6 = polyval(p6,t);
hold on
plot(t,P4,'k-', t,P5,'k:', t,P6,'k-.')
legend('tab data','n=4','n=5','n=6')
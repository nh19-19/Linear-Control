%% 7

clear; clc;

s = tf('s');
w = logspace(-2,2,1000);

G1 = 1/(s+1);
G2 = (s+1);
G3 = exp(-0.2*s);
G4 = (s+1)/(s^2+0.1*s+1);
G5 = (s^2+1)/(s+1)^2;


f = freqresp(G5,w);
magnitude = abs(f(1,:));
phase = angle(f(1,:));
figure
semilogx(w,20*log10(magnitude))
%ylim([-2,2])
title('magnitude')
figure
semilogx(w,(phase)*180/pi)
title('phase')

figure
bode(G5)

%% 8

clear; clc;

Ts = 0.01;
t = 0:Ts:15;
sz = size(t);

h1 = (2<t&t<3)*1 + (3<t&t<4)*-2 + (4<t&t<5)*1;
u1 = (0<t&t<7)*1;
y1 = conv(u1,h1)*Ts;
y1 = y1(1:sz(2));
%plot(t,y1,t,u1,t,h1)
%legend('y1','u1','h1')

h2 = (0<t&t<1).*t + (1<t&t<2)*1 + (2<t&t<3).*(3-t);
u2 = (0<t&t<1)*1;
y2 = conv(u2,h2)*Ts;
y2 = y2(1:sz(2));
%plot(t,y2,t,u2,t,h2)
%legend('y2','u2','h2')

h3 = (0<t&t<1).*t + (1<t&t<2).*(1-t);
u3 = (1<t&t<2).*sin(pi*t);
y3 = conv(u1,h1)*Ts;
y3 = y3(1:sz(2));
plot(t,y3,t,u3,t,h3)
legend('y3','u3','h3')

%% 9

clear;  clc;

s = tf('s');
tau1 = 3*2;
tau2 = 3/(0.5*1);

T1 = 1/(2*s+1);
T2 = 1/(s^2+s+1);

G1 = 1/(2*s+1) * (1-exp( -tau1*s )*exp( -tau1*0.5 ));
a = (-1-sqrt(3)*1i)/2;
b = (-1+sqrt(3)*1i)/2;
G2 = 1i/sqrt(3) * ( 1/(s-a) - 1/(s-b) - 1/(s-a)*exp(a*tau2)*exp(-tau2*s) + 1/(s-b)*exp(b*tau2)*exp(-tau2*s) );

figure
impulse(G2)
figure
step(G2)
figure
bode(G2)


%% 10 

output = out.simout;
t = out.tout;

w = linspace(0.01,100,length(output));
%h = reshape(bode(tf(1,[1,1]) ,w) , size(w));
%h = reshape(bode(tf(1,[1,0.2,1]) ,w) , size(w));
h = reshape(bode(tf([1,0,1],[1,2.5,1]) ,w) , size(w));
semilogx(w, 20*log10(output));
hold on
semilogx(w, 20*log10(h));
legend('chirp','bode')

%% 2
clc; clear;

s = tf('s');
L = 1400/(s*(s+10)*(s+14));
L1 = 203.5*(s+0.143)/(s*(s+10)*(s+14)*(s+0.02));
hold on
bode(L)
bode(L1)
hold off
grid on

figure
step(L1/(1+L1))
stepinfo(L1/(1+L1));

%% 3
clear; clc;

s = tf('s');
L = 100*(s+1)*(s+0.01)/((s+10)*(s^2+2*s+2)*(s^2+0.02*s+0.0101));
G = (s-2.1)/(s-6.1);
hold on
%bode(L)
%step(L*G/(1+L*G)/10)
rlocus(L)

%% 4

clear; clc;

s0 = tf('s');
s2 = s0/4.82;
T2 = 1/(s2^2+1.82*s2+1)/4.82;
s3 = s0/4.04;
T3 = 1/(s3^3+1.9*s3^2+2.2*s3+1)/4.04;
s4 = s0/4.81;
T4 = 1/(s4^4+2.2*s4^3+3.5*s4^2+2.8*s4+1)/4.81;
s5 = s0/5.43;
T5 = 1/(s5^5+2.7*s5^4+4.9*s5^3+5.4*s5^2+3.4*s5+1)/5.43;
s6 = s0/6.04;
T6 = 1/(s6^6+3.15*s6^5+6.5*s6^4+8.7*s6^3+7.55*s6^2+4.05*s6+1)/6.04;

% step(T2)
% hold on
% step(T3)
% step(T4)
% step(T5)
% step(T6)
% hold off

bode(T2)
hold on
bode(T3)
bode(T4)
bode(T5)
bode(T6)
hold off

legend('T2','T3','T4','T5','T6')

%%
clc; clear;

s = tf('s');
L = 4000/(s*(s+10)*(s+20));
L = 4000*2*(s+11.2)/(s*(s+10)*(s+20)*(s+33.7));
bode(L)

%% 7

G1 = tf([1],[10,1]);
G2 = tf([1],[1,0.1,1]);
G3 = tf([1],[1,0.1,1,0]);
G4 = tf([1],[1,0,0,0,-1,0]);
%% 7_plots

hold on
step(G3*C3_P/(1+G3*C3_P))
step(G3*C3_PD/(1+G3*C3_PD))
step(G3*C3_PI/(1+G3*C3_PI))
step(G3*C3_PID/(1+G3*C3_PID))
hold off


%% 8 

engine = tf([1,17,40],[1,3,27,25]);
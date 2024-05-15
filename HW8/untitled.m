clear; clc;

s = tf('s');
L = 1/(s^2-1);
nyquist(L)

%% 2
clear; clc;

s = tf('s');
L = 1/((0.1*s^2+20)*(12*s+48));
T = L/(L+1);

bode(L)
hold on
bode(T)


%% 4
clear; clc;

syms s
T = 2;

for n=2:6
    f1 = exp(-s*T/2);
    T1 = taylor(f1,s,'Order',n);
    f2 = exp(s*T/2);
    T2 = taylor(f2,s,'Order',n);
    transferF = tf(sym2poly(T1),sym2poly(T2));
    figure
    %bode(transferF)
    step(transferF)
end


%%

s = tf('s');
L = 8000*(s+8.7)/((s+26.3)*(s+20)*(s+10)*s);
%L1 = 24000*(s+8.7)*(s+20.65)/((s+26.3)*(s+20)*(s+10)*s*(s+10.32));

hold on
bode(L)
bode(L1)
hold off

L1 = 24000*(s+8.7)*(s+20.65)/((s+26.3)*(s+20)*(s+10)*s*(s+10.32));

%% 4
clear; clc;

syms s
T = 2;

for n=1:4
    f1 = exp(-s*T);
    T1 = pade(f1,'Order',[n n+1]);
    [NT, DT] = numden(sym(T1));
    transferF = tf(sym2poly(NT),sym2poly(DT));
    figure
    %bode(transferF)
    step(transferF)
end


%% 5
clear; clc;

s = tf('s');
T = 0.1;
P = 2;
poles=[];
L = exp(-T*s)/(s+P);

for k = 0:0.1:20
    T = feedback(k*L,1);
    poles = [poles;pole(T)];
end

 %% 5_d
r= 1./(s*ones(200,1)+poles);
% rlocus(r)
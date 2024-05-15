%% data1
tout = out.tout;
simout = out.simout;

%% data2
simin = out.simin;

%% 5_a

syms K T s
step_res1 = ilaplace(K/(T*s+1) * (1/s));

%% 5_d

K2 = 1;
T2 = 1.28;

step( tf([K2],[T2,1]) )

%% 5_f

K3 = 3;
T3 = 1.3;

step( tf([K3],[T3,1]) )

%% 5_g_1

syms K T s
step_res2 = ilaplace(K/(T*s+1) * (1/(s^2+1)));

%% 5_g_2

K4 = 1.24;
T4 = 1.58;

fplot( ilaplace( (K4/(T4*s+1))*(1/(s^2+1)) ) )
xlim([0 10])


%% 5_i

syms K T s a
step_res3 = ilaplace(K/(T*s+1) * (1/(a*s+1)) * (1/s));


%% 5_k_1

syms K T1 T2 s
step_res4 = ilaplace( K/((T1*s+1)*(T2*s+1)) * (1/s));


%% 5_k_2

step( tf([1],[1.2*0.68 , 1.2+0.68 , 1]) )
xlim([0 10])

%% 6_h

step( tf([4.25],[1 , 5.228 , 4.238]) )

%% suggested

syms K T1 T2 s a
step_res3 = ilaplace(K/((T1*s+1)*(T2*s+1)) * (1/(s+1)) * (1/s));



%% 2

syms s
k0 = 10;
Gs = (2*s^3 + s^2 + s -1)/(s^3 - 5*s^2 + 2*s + 8);
step_response = ilaplace( (k0*Gs/(1+k0*Gs) ) * (1/s));
fplot(step_responce)
xlim([0 40])

%% 3

s = tf('s');
syms t 

%step( 1/(s+1) )
%step( 1/(s-1) )
%step( 1/(s^2+1) )
%step( 1/(s+1)^2 )


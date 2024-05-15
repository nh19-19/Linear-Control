%% 6_1
clc; clear;

dt = 0.001;
t = 0:dt:10;

a = [-1 1];
b = [2 3 1];

impls = (1/dt)*(t==0);
sys = tf(a,b);
y1 = lsim(sys, impls, t, 0);

plot(t,y1)

%% 6_2

syms s
num = poly2sym(a, s);
den = poly2sym(b, s);

isys = ilaplace(num/den);

fplot(isys, [0 15])

%% 6_3

syms t
[A,B,C,D] = tf2ss(a,b);
e = expm(A.*t);
y2 = C*e*B;

fplot(y2, [0 15])

%% 6_4

impulse(sys)

%% 6_6

eA = ilaplace( inv(s*eye(size(A))-A) );
y3 = C*eA*B;
fplot(y3 , [0 15])


%%
e
eA

%% 8

k = 10;
m = 1;
M = 1;
Kp = 5;

A =[0 1 0 0;-2*k/m -1/m 2*k/m 0;
    0 0 0 1; (2*k-Kp)/M 0 -2*k/M -1/M];
B = [0;0;0;Kp/M];
C = [1 0 0 0;0 1 0 0];

syms s t
T =  C*(s*eye(size(A))-A)^(-1)*B; 
T1 = C*(s*eye(size(A))-A)^(-1)*B * 1/s;
y_1 = ilaplace(T1);

k = 10;
m = 1;
M = 1;
Kp = 1;

A =[0 1 0 0;-2*k/m -1/m 2*k/m 0;
    0 0 0 1; (2*k-Kp)/M 0 -2*k/M -1/M];
B = [0;0;0;Kp/M];
C = [1 0 0 0;0 1 0 0];

syms s t
T =  C*(s*eye(size(A))-A)^(-1)*B; 
T1 = C*(s*eye(size(A))-A)^(-1)*B * 1/s;
y_2 = ilaplace(T1);

k = 10;
m = 10;
M = 1;
Kp = 5;

A =[0 1 0 0;-2*k/m -1/m 2*k/m 0;
    0 0 0 1; (2*k-Kp)/M 0 -2*k/M -1/M];
B = [0;0;0;Kp/M];
C = [1 0 0 0;0 1 0 0];

syms s t
T =  C*(s*eye(size(A))-A)^(-1)*B; 
T1 = C*(s*eye(size(A))-A)^(-1)*B * 1/s;
y_3 = ilaplace(T1);
figure
subplot(2,2,1)
fplot(y_1)
title("Kp=5 k=10 m=1 M = 1")
xlim([0 25])
subplot(2,2,2)
fplot(y_2)
title("Kp=1 k=10 m=1 M = 1")
xlim([0 25])
subplot(2,2,3)
fplot(y_3)
title("Kp=5 k=10 m=10 M = 1")
xlim([0 10])
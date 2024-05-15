%% 7_1
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.1;
t = t_start:Ts:t_end;
x = sin(t/2);

plot(t,x)

%% 7_2
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.01;
t = t_start:Ts:t_end;
x = cos(2*pi*t);

plot(t,x)


%% 7_3
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.01;
t = t_start:Ts:t_end;
a=1;
x =  a*( (t>4)&(t<7) );

plot(t,x)
ylim([0 2])

%% 7_4
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.1;
t = t_start:Ts:t_end;
x = 1-exp(-t);

plot(t,x)


%% 7_5
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.01;
t = t_start:Ts:t_end;
x = t.*log(t)-2*t;

plot(t,x)


%% 7_6
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.01;
t = t_start:Ts:t_end;
x = (t.^3 - 8*(t.^2) + 13).^(1/3);

plot(t,x)


%% 7_7
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.01;
t = t_start:Ts:t_end;
x = dirac(t);
idt = x == Inf; x(idt) = 1;

plot(t,x)

%% 7_8
clc; clear;
t_start = 0;
t_end = 10;
Ts = 0.01;
t = t_start:Ts:t_end;
a=1; b=-1;
x = a*( (t>2)&(t<4) ) + b*( (t>6)&(t<8) );

x1 = F(t-2)-F(t-4)-F(t-6)+F(t-8);
plot(t,x1,t,x)
ylim([-1.5 1.5])


%% 8
clc; clear;
y0 = [1;1.5;2;3;4];
tspan = [0 10];
for i=1:length(y0)
    [t, y] = ode45(@myODE, tspan, y0(i));
    figure
    plot(t,y)
end


%% 9_1
clc; clear;
sys = tf(1, [0.02, 0.2, 1]);
Ts = 0.01;
t = 0:Ts:10;
t_step = 0:Ts:1;
sz = size(t_step);
sz = sz(:,2)-1;
u = [zeros(1,2*sz) ones(1,2*sz) zeros(1,2*sz) -1.*ones(1,2*sz) zeros(1,2*sz) 0];
y = lsim(sys,u,t);

plot(t,y)
title("Using lsim function")

%% 9_2
clc; clear;
Ts = 0.01;
t = 0:Ts:10;
U = heaviside(t-2) - heaviside(t-4) - heaviside(t-6) + heaviside(t-8);
Y = zeros(size(t));
h = Ts;
for i = 2:length(t)
    if (i == 2)
        Y(i) = (2 * Y(i - 1) + 15 * h * Y(i - 1) + 50 * h^2 * U(i)) / (50 * h^2 + 15 * h + 1);
    else
        Y(i) = (2 * Y(i - 1) + 15 * h * Y(i - 1) - Y(i - 2) + 50 * h^2 * U(i)) / (50 * h^2 + 15 * h + 1);
    end
end

plot(t,Y)
title("Using Backward Euler")
ylim([-2,2])

%% functions

function data = F(t)
    data = ( 1 - 2*exp(-5*t) + exp(-10*t) ).*( t>0 );
end

function dydt = myODE(t, y)
dydt = y.^2 - 3.*y;
end
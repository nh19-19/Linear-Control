%% 6 (example)
clear; clc;

sys = tf([1,2,3],[1,7,8,9]);
type = "O";
[A, B, C] = canonicalForms(sys, type)

%% 7
clear; clc;

A = [-1 1 0 0 0 ; 0 -1 0 0 0 ; 0 0 -2 0 0 ; 0 0 0 -1 1 ; 0 0 0 -1 -1];
B = [0 1 1 0 1]';
C = [1 1 1 1 0];
D = 0;
sys = ss(A,B,C,D);

t = 0:0.01:10;
u = 1*( (t>2)&(t<4) ) + -1*( (t>6)&(t<8) );
x0 = [0 0 0 0 0];

[y, tOut, x] = lsim(sys, u, t, x0);
figure
plot(tOut,y,tOut,x)
legend({'x_1','x_2','x_3','x_4','x_5','y'},'Location','northeast')

%% 8
clear; clc;

A = [-1 1 0 0 0 ; 0 -1 0 0 0 ; 0 0 -2 0 0 ; 0 0 0 -1 1 ; 0 0 0 -1 -1];
B = [0 1 1 0 1]';
C = [1 1 1 1 0];
D = 0;

Ts = 0.01;
t = 0:0.01:10;
u = 1*( (t>2)&(t<4) ) + -1*( (t>6)&(t<8) );

X = zeros([length(A), length(t)]);
x0 = [0;0;0;0;0];
X(:, 1) = x0;

Y = zeros(size(t));
Y(1) = C * x0;

for i=2:length(t)
    X(:, i) = X(:, i-1) + Ts * (A * X(:, i-1) + B * u(i-1));
    Y(i) = C * X(:, i) + D * u(i);
end

plot(t,Y,t,X)
legend({'x_1','x_2','x_3','x_4','x_5','y'},'Location','northeast')

%% 9
clear; clc;

Ts = 0.1;
t = 0:Ts:500;
u = 5*( (t>100)&(t<200) ) + -5*( (t>300)&(t<400) ) + 25;

x0 = [0;0;0];
X = zeros([length(x0), length(t)]);
X(:, 1) = x0;
Y = zeros(size(t));

for i=2:length(t)
    X(:, i) = X(:, i-1) + Ts * f(X(:, i-1), u(i-1));
    Y(i) = g(X(:, i));
end

plot(t,Y,t,X)
legend({'x_1','x_2','x_3','y'},'Location','northeast')
ylim([-5 35])

%% function

function [A, B, C] = canonicalForms(sys, type)

    [num,den] = tfdata(sys,'v');
    n=length(den)-1;
    num_flip = flip(num);
    den_flip = flip(den);
    if type == "C"
        A = [zeros(n-1,1) eye(n-1) ; -den_flip(1:n)];
        B = [zeros(n-1,1) ; 1];
        C = num_flip(1:n);
    elseif type == "O"
        A = [(-den(2:n+1))' , [eye(n-1);zeros(1,n-1)]];
        B = num(2:n+1)';
        C = [1 zeros(1,n-1)];
    end

end


function dxdt = f(x, u)
    M = 0.48*( ((1-0.02*x(3))*x(2)) / (1.2+x(2)+(x(2)^2)/22) );

    dxdt = [-0.15*x(1) + x(1)*M ; 0.15*(u-x(2)) - 2.5*M*x(1) ; -0.15*x(3) + (2.2*M+0.2)*x(1)];
end

function y = g(x, u)
    y = x(3);
end
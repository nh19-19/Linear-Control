%% c
clear; clc;

s = tf('s');

Gs1 = (s^2+2*s+2)/(s*(s^2 + 0.25));
Gs2 = (s^2)/(s^2 - 1)^2;

[baway, rootl, crootl, notbelong] = breakaway(Gs1)



function [Baway, rootl, crootl ,notbelong] = breakaway(Gs)

    TF = Gs;

    num = TF.Numerator;
    den = TF.Denominator;

    syms s
    aS = poly2sym(num{1,1},s);
    bS = poly2sym(den{1,1},s);

    Baway = vpasolve(aS*diff(bS)-bS*diff(aS));


    realZP = [real( zero(Gs) ) ; real( pole(Gs) )];
    notbelong = [];
    rootl = [];
    crootl = [];
    for i = 1:size(Baway)
        k = 0;
        if imag(Baway(i)) ~= 0
            notbelong = [notbelong Baway(i)];
        else
            for j = 1:size(realZP) 
                k = k+(Baway(i) <= realZP(j));
            end
        if mod(k,2)==0 
            crootl = [crootl Baway(i)];
        else
            rootl = [rootl Baway(i)];
        end
        end
    end
end



function [] = complementRlocus(Gs)
    rlocus(-Gs);
end

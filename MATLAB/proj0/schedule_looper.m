clear; close all;
% this is the case when app1 and app2 have the same access
% both uniform, working set = 3 * cacheline * 0.5
global s1 s2;
% sche_const = [0.01 0.05 0.1 0.3 0.5 0.7 0.9 0.95 0.975 0.99];
% sche_const = [0.01 0.03 0.05 0.07 0.1 0.2 0.3 0.5 0.7 0.9 0.95 0.99];
sche_const = [0.9 0.95 0.975 0.99];
mm = numel(sche_const);
hits1 = zeros(mm, 3); hits2 = zeros(mm, 3);
hit1 = zeros(1, mm); hit1_app1 = zeros(1, mm); hit1_app2 = zeros(1, mm);
hit2 = zeros(1, mm); hit2_app1 = zeros(1, mm); hit2_app2 = zeros(1, mm);

for i = 1 : mm
    hits1(i, : ) = sche_vary_soft(sche_const(i));
    hit1(i) = hits1(i, 1);
    hit1_app1(i) = hits1(i, 2);
    hit1_app2(i) = hits1(i, 3);
    
    hits2(i, : ) = sche_vary_hard(sche_const(i));
    hit2(i) = hits2(i, 1);
    hit2_app1(i) = hits2(i, 2);
    hit2_app2(i) = hits2(i, 3);
    mybeep;
end

load handel.mat;
nBits = 16;
sound(y,Fs,nBits);


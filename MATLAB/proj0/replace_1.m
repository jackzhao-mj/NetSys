function replace_1(si)
% using this function to replace cacheline;
global num_set cl MAX lru_stamp lru x hit num_app1 hit_app1 hit_app2;
global cnt1 cnt3 cnt30; % cnt1 is the number of times of soft-isolation
% cnt3 records the cache line number when soft-isolation happens.

set_num = mod(si, num_set);
base0 = set_num * 16 + 1; % base0 si the starting base of the set

% num_app1 is the work set range of app1
% base is decided by the current working app
if si > num_app1
    base = 8;
else
    base = 0;
end
% when hit happens:
% check the whole set to see if hit
for i = base0 : base0 + 15
    if cl(i) == si;
        if base == 8
            hit_app2 = hit_app2 + 1;
        else 
            hit_app1 = hit_app1 + 1;
        end
        hit  = hit + 1;
        x(i) = MAX;
        lru_stamp(i) = lru;
        lru = lru + 1;
        return;
%     else continue;
    end
end

% when miss happens and empty cachelien exists:
% only check part of the set belonged to current app
for i = base0 + base : base0 + base + 7
    if cl(i) == 0
        cl(i) = si;
        lru_stamp(i) = lru;
        lru = lru + 1;
        x(i) = MAX;
        return;
    end
end

% when miss happens and there is soft-isolatable cacheline
% check the whole set
for i = base0 : base0 + 15
    if x(i) == 0
        cnt3(cnt30) = i;
        cnt30 = cnt30 + 1;
        cnt1 = cnt1 + 1;
        cl(i) = si;
        x(i) = MAX;
        lru_stamp(i) = lru;
        lru = lru + 1;
        return;
%     else continue;
    end
end

% when miss happens, using LRU and hard-isolation
% check the part of set belongs to the current app
ii = getLRU(base0, base);
cl(ii) = si;
x(ii) = MAX;

% for the part of set belongs to the current app
for i = (base0 + base) : (base0 + base + 7)
    if i ~= ii
        x(i) = x(i) - 1;
        x(i) = floor(x(i));
%     else continue;
    end 
end
% for the part of set belongs to the other app
seg_num = 8 - base;
for i = (base0 + seg_num) : (base0 + seg_num + 7)
    x(i) = x(i) * 0.5;
    x(i) = floor(x(i));
end 

lru_stamp(ii) = lru;
lru = lru + 1;



    
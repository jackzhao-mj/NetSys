function replace_1(si)
% using this function to replace cacheline;
global num_set cl MAX lru_stamp lru x hit;
set_num = mod(si, num_set);
set_num = int32(set_num) + 1;
base0 = set_num * 16; % base0 si the starting base of the set

base = -1; % base is decided by which app is running, and used as base in repalacing
% the accessing pattern ensures A1 will access odd, A2 will access even
if (mod(si, 2))
    base = 0;
else
    base = 8;
end
% when hit happens?
for i = base0 : base0 + 15
    if cl(i) == si;
        hit  = hit + 1;
        x(i) = MAX;
        lru_stamp(i) = lru;
        lru = lru + 1;
        return;
    end
end

% when miss happens and empty cachelien exists:
for i = base0 : base0 + 15
    if x(i) == -1
        cl(i) = si;
        lru_stamp(i) = lru;
        lru = lru + 1;
        x(i) = MAX;
        %for j = (set_num + base) : (set_num + base + 8)
        return;
    end
end

% when miss happens and there is soft-isolatable cacheline
for i = base0 : base0 + 15
    if x(i) == 0
        cl(i) = si;
        x(i) = MAX;
        lru_stamp(i) = lru;
        lru = lru + 1;
        return;
    end
end

% when miss happens, using LRU and hard-isolation
ii = getLRU(base0, base);
cl(ii) = si;
x(ii) = MAX;
for i = (base0 + base) : (base0 + base + 7)
    if i ~= ii
        x(i) = x(i) - 1;
    else continue;
    end 
end

seg_num = 8 - base;
for i = (base0 + seg_num) : (base0 + seg_num + 7)
    x(i) = x(i) * 0.5;
    x(i) = int32(x(i));
end 

lru_stamp(ii) = lru;
lru = lru + 1;



    
    

            

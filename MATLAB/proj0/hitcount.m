clear;
access = [200, 300, 400 500, 600, 700];
access = 2 * access;
hit = [315, 485, 642, 798, 956, 1113];

for i = 1 : numel(hit)
    hit_rate(i) = hit(i) /  access(i);
end

figure, plot(access, hit_rate);

% n = 400
MAX = [2, 3, 4, 5, 10, 20, 30]

hit = [650 652 653 648 642 644 643]

hit2 = [233 197 190 ]

% for one APP the number of time accessing one address
i = 800;
MAX = [1 2 3
hit1 = [1287 1287 1287
hit2 = [1287


MAX = [1 2 ]
hit = [14 14 14 14(MAX = 20) ]
hit2 = [15 15 15]



% new hit count:  
% using the evenly distributed access pattern: rand_gen2
% MAX = 40
n = [1000 5000 7500 1e4]
hit1 = [14 102 158 221]
hit2 = [19 111]

% MAX = 5, n = 5000
hit1 = 102


% new parameters:
% cache_size = 512; % set cache size = 512B;(2MB)
% cacheline_size = 1; % set cache line size = 1B;(64B)
% app_mem = 5 * 2^10; % set memory accessing size = 5KB;should be: 100 * cache_size
% num_cl = cache_size / cacheline_size; % total cache line number;
% num_memaccess = app_mem / cacheline_size; % shold be: 100 * num_cl
% set_size = 16; % this is a 16-way set assiciated, every set has 16 cache lines
n = 2e4;
possible app_access = 5120;
MAX = [5 7 10 15 100];
hit = [1653 3990 3991 3991 3991];

MAX = [5 10 15]
hit2 = [3934 3934]

n = 20000;
hit = 3991;
n = 40000
hit = 8014;
n = 60000
hit = 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen2, n = 20,000 %%%%%%%%%%%%%%

hit = [3991]; % always;
hit2 = [3991]; % always;
hitrate  = 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen3,  %%%%%%%%%%%%%%

% n = 60,000:
MAX [5, 30];
hit = [119235, 119235, ];
hit2 = [119252, ];
hitrate = [0.9936, ];

% n = 100,000:
MAX = [3, 30];
hit = [199065, 199071]
hitrate = 0.9953, 0.9954
% MAX still does not affec the hit rate too much;

% want to ger more cases?
% making it larger num_memaccess

% using the rand_gen, the access pattern of app1 and app2 are the same, but
% the hit rate is good, about 82%, still confused.
% n = 60,000
% when the total #mem_access is doubed and other change:
% the probability distribution: [0.7, 0.2, uniforly to the rest]
% hit = 109331,  n = 60000, hitrate = 0.9111;
% test 3: distribution: [0.7, 0.25, 0.05]
% hit = 114624, n = 60000, hitrate = 0.9552;
% this is still almost the same as no-soft isolation case: hit2 = 114292
% but there is improvement in hit rate: improved 0.0028%;

% next TODO with rand_gen: test the diff distribution parameter for better
% performance;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen4, n = 60,000 %%%%%%%%%%%%%%
hit = 119488;
hitrate = 0.9957;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen5, n = 20,000 %%%%%%%%%%%%%%



% now, it seems that rand_gen2, the all uniform distributio case is worse
% and the rand_gen and rand_gen3 are better cases;

% Now, (1)working on rand_gen3 (2)working on the variation fo MAX and the
% effect of MAX on the hit rate.
% Always remember that the improvement of soft-isolation can only be seen
% through comparing them with the hard-isolation case, compare the hit
% rate.




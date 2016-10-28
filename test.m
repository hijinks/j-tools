data = xlsread('C:\Users\sb708\Documents\PhD Work\Projects\autoJ\Mitch_data\test1.xlsx','Sheet1');

%% Allocate imported array to column variable names
w = data(:,1);
ss1 = data(:,2);
bins = data(:,3);
fD1 = data(:,4);

%% Clear temporary variables
clearvars data raw;

w(isnan(w)) = [];
m = mean(w);
stdev = std(w);

sorted_data = sort(w);
ss_data = arrayfun(@(w)((w-m)/stdev),sorted_data);

ss_vars = [-5:.5:5];
[N,edges] = histcounts(ss_data, ss_vars);
fD = N./sum(N);
       
figure
 plot(bins,fD1);
 hold on;
plot(edges(2:end),fD);



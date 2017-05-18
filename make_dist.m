
mu = 90;

stev = 10;

n = 100;

d = [];

for w=1:n
    d = [d, normrnd(mu,stev)];
end

mu = 80;

stev = 20;

n = 100;

d2 = [];

for w=1:n
    d2 = [d2, normrnd(mu,stev)];
end

mu = 70;

stev = 30;

n = 100;

d3 = [];

for w=1:n
    d3 = [d3, normrnd(mu,stev)];
end

mu = 20;

stev = 10;

n = 100;

d4 = [];

for w=1:n
    d4 = [d4, normrnd(mu,stev)];
end


figure;
cdfplot(d);
hold on;
cdfplot(d2);
hold on;
cdfplot(d3);
hold on;
cdfplot(d4);

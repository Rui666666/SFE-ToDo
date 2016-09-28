clear all
close all
clc

S_min   = 50;       % lower bound of Asset Price
S_max   = 150;      % upper bound of Asset Price 
tau_min = 0.05;     % lower bound of Time to Maturity
tau_max = 1;        % upper bound of Time to Maturity
K       = 100;      % exercise price 
r       = 0.01;     % interest rate
sig     = 0.35;     % volatility
d       = 0;        % dividend rate
b       = r - d;    % cost of carry
steps   = 60;

[tau, dump] = meshgrid([tau_min : (tau_max - tau_min)/(steps - 1) : tau_max]);
[dump2, S]  = meshgrid([S_max : -(S_max - S_min)/(steps - 1) : S_min]);

d1    = (log(S/K) + (r - d + sig^2/2).*tau)./(sig.*sqrt(tau));
d2    = d1 - sig.*sqrt(tau);
gamma = normpdf(d1)./(S.*(sig.*sqrt(tau)));
color = gamma.*(r - b + b.*d1./(sig.*sqrt(tau)) + (1 - d1.*d2)./(2.*tau) );

% plot
mesh(tau, S, color/365)
title('Color of call/put option')
ylabel('Asset Price S');
xlabel('Time to Maturity \tau');
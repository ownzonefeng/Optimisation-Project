%% Optimal Decision Making Group Project
% Distributionally Robust Optimization
% function y = p34(train, test, rho)
% Input: 
% - train: training samples
% - test: testing samples
% - rho: Wasserstein radius
% Output:
% - y: utility achieved by the optimal decision

% Fill in the sections marked by '...'
function [y_test, diag, x_opt] = p34(train, test, rho)
%% Utility function, Wasserstein radius and norm for the Wasserstein ball
a1 = 4; b1 = 0;
a2 = 1; b2 = 0;

%% Number of assets and training periods
K = length(train(1,:));
N = length(train(:,1));

%% Decision Variables
x = sdpvar(1, K);
s = sdpvar(1, N);
lambda = sdpvar(1);
rate_of_return = x * train';
%% Objective
obj = lambda * rho^2 + mean(s);
obj = -obj;

%% Constraints
con = [];
for i = 1:N
    for j = 1:N
        con_now = (pdist2(train(i,:), train(j,:), 'squaredeuclidean') * lambda + s(j) <= (a1 * rate_of_return(i) + b1));
        con = [con, con_now];
    end
end

for i = 1:N
    for j = 1:N
        con_now = (pdist2(train(i,:), train(j,:), 'squaredeuclidean') * lambda + s(j) <= (a2 * rate_of_return(i) + b2));
        con = [con, con_now];
    end
end

con = [con, sum(x) == 1, x >=0, lambda <= 0];
    
%% Optimization Settings
ops = sdpsettings('solver', 'Gurobi', 'verbose', 0, 'showprogress', 0);
diag = optimize(con, obj, ops);

%% Retrieve portfolio weights 
x_opt = value(x);
obj = -value(obj);    
%% Evaluate portfolio
rate_of_return_test = x_opt * test';
y_test = mean(min(a1 * rate_of_return_test + b1, a2 * rate_of_return_test + b2));

end
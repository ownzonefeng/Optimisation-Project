%% Optimal Decision Making Group Project
% Sample Average Approximation
% function y = p33(train,test)
% Input: 
% - train: training samples
% - test: testing samples
% Output:
% - y: utility achieved by the optimal decision

% For Exercise 3.3., the input arguments train and test are the same !!!
% Run this function with the matlab variable 'test' obtained by loading
% the file test.mat 
% Fill in the sections marked by '...'
function [y_test, y_train, diag, x_opt] = p33(train,test)
%% Utility function
a1 = 4; b1 = 0;
a2 = 1; b2 = 0;

%% Number of assets and training periods
K = length(train(1,:));
N = length(train(:,1));

%% Decision Variables
x = sdpvar(1, K);
t = sdpvar(1, N);
rate_of_return = x * train';
%% Objective
obj = mean(t);
obj = -obj;

%% Constraints
con = [sum(x) == 1, x >= 0, t <= (a1 * rate_of_return + b1), t <= (a2 * rate_of_return + b2)];

%% Optimization Settings
ops = sdpsettings('solver', 'Gurobi', 'verbose', 0, 'showprogress', 0);
diag = optimize(con, obj, ops);

%% Retrieve portfolio weights 
x_opt = value(x);
    
%% Evaluate portfolio
rate_of_return_test = x_opt * test';
y_test = mean(min(a1 * rate_of_return_test + b1, a2 * rate_of_return_test + b2));
y_train = -value(obj);
end
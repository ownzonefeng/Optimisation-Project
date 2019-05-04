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
function [y_test, y_train] = p33(train,test)
%% Utility function
a1 = 4; b1 = 0;
a2 = 1; b2 = 0;

%% Number of assets and training periods
K = length(train(1,:));
N = length(train(:,1));

%% Decision Variables
x = sdpvar(1, K);
rate_of_return = x * test';
%% Objective
obj = mean(min(a1 * rate_of_return + b1, a2 * rate_of_return + b2));
obj = -obj;

%% Constraints
con = [sum(x) == 1];

%% Optimization Settings
ops = sdpsettings('solver', 'Gurobi', 'verbose', 0, 'showprogress', 1);
diag = optimize(con, obj, ops);

%% Retrieve portfolio weights 
x = value(x);
x
-value(obj)
    
%% Evaluate portfolio
% y_test = mean(...);
y_test = 0;
end
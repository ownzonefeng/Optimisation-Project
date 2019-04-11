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
...

%% Objective
obj = ...

%% Constraints
con = [];
...

%% Optimization Settings
ops = sdpsettings('solver','Gurobi','verbose',0);
diag = optimize(con,...,ops);

%% Retrieve portfolio weights 
... = value(...);
    
%% Evaluate portfolio
y_test = mean(...);

end
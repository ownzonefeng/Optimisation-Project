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
function y = p34(train, test, rho)
%% Utility function, Wasserstein radius and norm for the Wasserstein ball
a1 = 4; b1 = 0;
a2 = 1; b2 = 0;

%% Number of assets and training periods
K = length(train(1,:));
N = length(train(:,1));

%% Decision Variables
...

%% Objective
obj = ...;

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
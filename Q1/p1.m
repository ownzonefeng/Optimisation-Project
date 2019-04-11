%%%%%%%%%%%%%%%%%%%%%% MGT-483 Optimal Decision Making %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Project / Question 1 %%%%%%%%%%%%%%%%%%%%%%%%%%
%%          Wasserstein Distance           %%

%% Prepare the workspace
clear
clc
close all
%% Distributions

P = [1/2, 1/3, 1/6];
Q = [2/5, 3/5];
loc_s = ...;
loc_d = ...;
%% Compute cost function
dist = pdist2(loc_s, loc_d, '...');

%% Optimization problem
% decision variables
trans_map = sdpvar(..., ..., 'full');      
% constraints
con = [];

% objective
obj = ...

% solution
ops = sdpsettings('solver','gurobi','verbose',0);
diag = optimize(con, obj, ops)

% read optimal objective
wass_dist = value(obj); 

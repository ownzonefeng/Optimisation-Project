%%%%%%%%%%%%%%%%%%%%%% MGT-483 Optimal Decision Making %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Project / Question 2 %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%          Color Transfer Using Optimal Transport          %%%%%          

%% Prepare the workspaces
clear
clc
close all

%% Read images
X = imread('....jpg'); %Source image
Y = imread('....jpg'); %Target image
figure()
subplot(1, 2, 1), imshow(X);
title('Source Image')
subplot(1, 2, 2), imshow(Y);
title('Target Image')
%% Normalize images between 0 and 1
X = im2double(X);
Y = im2double(Y);
%% Reshape images in 2D
[w1, h1, d1] = size(...); % Size of the first image
[w2, h2, d2] = size(...); % Size of the second image

n_1  = ...;   % number of pixels in X for one channel
n_2  = ...;   % number of pixels in Y for one channel

X_ = reshape(X, ..., 3); % X_ corresponds to X' in the report
Y_ = reshape(Y, ..., 3); % Y_ corresponds to X' in the report
%% Color Distribution Plot of the Source Image
figure()
sz = 25;             % circle size
scatter3(..., ..., ..., sz, X_, 'filled')
xlabel('Red')
ylabel('Green')
zlabel('Blue')
title('Color Distribution','FontWeight','normal')
grid on
axis equal
view(3)
%% Subsampling

N = 500; % Number of samples for the images

rng(0) % Control random number generation
X_ss = X_(randperm(...,N),:); % Subsampled X', corresponds to X^ in the report
Y_ss = Y_(randperm(...,N),:); % Subsampled Y', corresponds to Y^ in the report

P = ones(..., 1) / ...; %Probability distribution for the first image
Q = ones(..., 1) / ...; %Probability distribution for the second image

%% Compute cost function
dist = pdist2(..., ..., '');

%% Optimization problem
% decision variables
trans_map = sdpvar(..., ..., 'full');       % red sample transport map
% constraints
con = [];

% objective
obj = ...;

% solution
ops = sdpsettings('solver','gurobi','verbose',0);
diag = optimize(..., ..., ...)

% read the optimal value
ot_map = value(...); %Corresponds to pi* in the report


%% Re-color the source image
X_new_ss = N * ... * ...; %X_new_ss corresponds to X^_new in the report
B = pinv(...) * ...;
X_new_ = ... * ...; %X_new_ corresponds to X' in the report
X_new = reshape(..., ..., ..., 3);

figure, imshow(... , [])
title('Re-colored Image')
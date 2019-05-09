clear;
load('test.mat');
load('train.mat');
[y_test, y_train, diag, x_opt] = p33(test,test);

%[y_test, diag, x_opt] = p34(train, test, 0.9);
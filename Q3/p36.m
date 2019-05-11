clear;clc;
load('results.mat');
cum_x = 1/N:1/N:1;
norm_saa = sort(saa / pi);
saa_mean = mean(norm_saa);
saa_std = std(norm_saa);
norm_dro = sort(dro / pi);
dro_mean = mean(norm_dro);
dro_std = std(norm_dro);

fprintf('SAA performance: %0.2f +/- %0.2f\n',saa_mean, saa_std);
fprintf('DRO performance: %0.2f +/- %0.2f\n',dro_mean, dro_std);
fprintf('With the probability of %0.2f: SAA - %0.2f DRO - %0.2f\n',0.95, norm_saa(cum_x == 0.05), norm_dro(cum_x == 0.05));
fprintf('With the probability of %0.2f: SAA - %0.2f DRO - %0.2f\n',0.05, norm_saa(cum_x == 0.95), norm_dro(cum_x == 0.95));
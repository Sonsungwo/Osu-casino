%%
clear
clc
%% warm up problem
% create array 1000 element -5pi from 5pi
x = linspace(-5*pi ,5*pi, 1000 );
y1 = cos(x);
y2 = 2*sin(x-(pi/2));
% make first graph in didfferent shape and color
plot(x,y1,'-.k',x,y2)
% name each graph
xlabel ('"x"');
ylabel ('"y1 and y2"');
% title of grpah
title ('"cos(x) and 2sin(x-pi/2)"');
% label legend y1 first 
legend('Data 1 of y1','Data 2 of y2');
%% problem
% load txt file to use it
pre_industrial = load('CO2_Pre-IR.txt');
post_indusctrial = load('CO2_Post-IR.txt');
% use mathmatic method to calculate each problem
mean_pre_industrial = mean(pre_industrial);
standard_pre_industrial = std(pre_industrial);
max_pre_industrial = max(pre_industrial);
min_pre_industrial = min(pre_industrial);
mean_post_industrial = mean(post_indusctrial);
standard_post_industrial = std(post_indusctrial);
max_post_industrial = max(post_indusctrial);
min_post_industrial = min(post_indusctrial);
fprintf('This is pre-industrial value\n');
fprintf('The mean value for pre-industrial is %.2f ppm\n',mean_pre_industrial);
fprintf('The standard deviation value for pre-industrial is %.2f ppm\n',standard_pre_industrial);
fprintf('The pre-industrial maximum value is %.2f ppm and the minimum value is %.2f ppm\n',max_pre_industrial,min_pre_industrial);
fprintf('This is post-industrial value\n');
fprintf('The mean value for post-industrial is %.2f ppm\n',mean_post_industrial);
fprintf('The standard deviation value for post-industrial is %.2f ppm\n',standard_post_industrial);
fprintf('The post-industrial maximum value is %.2f ppm and the minimum value is %.2f ppm\n',max_post_industrial,min_post_industrial);
%% *Homework4_1*
%% Programmers
% Mohammad Mahdi Elyasi - 9823007
%
% Moein Nasiri - 9823093
%% Clear Workspace
close all;
clear;
clc;
%% 4.1.1
image = imread("./images/lena.png");

imshow(image)

%% 4.1.2
image = im2double(image);

%% 4.1.3
figure('Name', "Lenas Histogram")
imhist(image);

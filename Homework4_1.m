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
%% 4.1.4
enhanced = histeq(image);
figure('Name', "Enhanced Contrast");
subplot(1, 2, 1)
imshow(image(:, :, :));
title('Slice of Original Image');
subplot(1, 2, 2)
imshow(enhanced(:, :, :));
title('Slice of Enhanced Image');

figure('Name', "montage pair");
imshowpair(image, enhanced, 'montage');
%% 4.1.5
figure('Name', "Enhanced Lena Histogram")
imhist(enhanced);
%% 4.2.1, 4.2.2
img2 = imread("./images/Image02.jpg");
noisy = imnoise(img2, 'Gaussian', 0, .04);

figure('Name', "Raw vs Noisy");
subplot(1, 2, 1)
imshow(img2);
title('Original Image');
subplot(1, 2, 2)
imshow(noisy);
title('Noisy Image');

%% 4.2.3
kernel = ones(3, 3) / 9;
filtered = imfilter(noisy, kernel);

figure('Name', "Filtered Image");
subplot(1, 3, 1)
imshow(img2);
title('Original Image');
subplot(1, 3, 2)
imshow(noisy);
title('Noisy Image');
subplot(1, 3, 3)
imshow(filtered);
title('Filtered Image');

%% 4.2.4
kernel = ones(5, 5) / 25;
filtered = imfilter(noisy, kernel);

figure('Name', "Filtered Image");
subplot(1, 3, 1)
imshow(img2);
title('Original Image');
subplot(1, 3, 2)
imshow(noisy);
title('Noisy Image');
subplot(1, 3, 3)
imshow(filtered);
title('Filtered Image');
%% 4.2.5
salt_papper_noisy = imnoise(img2, 'salt & pepper', 0.1);

figure('Name', "Raw vs Noisy");
subplot(1, 2, 1)
imshow(img2);
title('Original Image');
subplot(1, 2, 2)
imshow(salt_papper_noisy);
title('Noisy Image');
%% 4.2.6
kernel = ones(3, 3) / 9;
filtered_salt_pepper = imfilter(salt_papper_noisy, kernel);

figure('Name', "Filtered Image");
subplot(1, 3, 1)
imshow(img2);
title('Original Image');
subplot(1, 3, 2)
imshow(salt_papper_noisy);
title('Noisy Image');
subplot(1, 3, 3)
imshow(filtered_salt_pepper);
title('Filtered Image');
%% 4.2.7
load('filter.mat');
filter_FIR = ftrans2(Num);
figure('Name', "Filtered Image")
subplot(2, 1, 1)
freqz(Num);
subplot(2, 1, 2)
freqz2(filter_FIR);

%% 4.2.8
FIR_gaussian = imfilter(noisy, filter_FIR);
FIR_salt_pepper = imfilter(salt_papper_noisy, filter_FIR);

figure('Name', "Filtered Images")
subplot(2, 2, 1)
imshow(noisy);
title('Noisy Image');
subplot(2, 2, 2)
imshow(FIR_gaussian);
title('FIR Gaussian filter');
subplot(2, 2, 3)
imshow(salt_papper_noisy);
title('Salt & Pepper Noise Image');
subplot(2, 2, 4)
imshow(FIR_salt_pepper);
title('FIR salt & pepper filter');


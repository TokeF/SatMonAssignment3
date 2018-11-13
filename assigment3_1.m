% Load data
data = load('landsat8.mat');
data = cell2mat(struct2cell(data));
%% part 1a
close all
% display one band as greyscale image.
% uint16 is an unsigned 16 bit integer. 
% The range is therefore from 0 to 2^16 = 65536
n = 5;
imshow(data(:,:,n))

figure
J = histeq(data(:,:,n), 65536);
imshow(J)
% J = imadjust(data(:,:,n));
% figure 
% imshow(J)

%% part 1b
close all
% create RGb array, by concatenating the R, G and B channel
bins = 65536;
B = data(:,:,2); G = data(:,:,3); R = data(:,:,4);
R = histeq(R, bins); G = histeq(G, bins); B = histeq(B, bins);
RGB = cat(3, R, G, B);
imshow(RGB)

%% part 1c
figure
NIR = data(:,:,5);
NIR = histeq(NIR, bins);
NIRGB = cat(3, NIR, G, B);
imshow(NIRGB)

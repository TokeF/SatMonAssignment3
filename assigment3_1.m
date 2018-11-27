% Load data
data = load('landsat8.mat');
data = cell2mat(struct2cell(data));
%% part 1a
close all
% display one band as greyscale image.
% uint16 is an unsigned 16 bit integer. 
% The range is therefore from 0 to 2^16 = 65536
n = 1;
imshow(data(:,:,n))

% use histogram equalization. Scale data sp that histogram is approximately
% flat over 65536 bins
figure
J = histeq(data(:,:,n), 65536);
imshow(J)

%% part 1b
close all
% create RGb array, by concatenating the R, G and B channel, after
% histogram equlization
bins = 65536;
B = data(:,:,2); G = data(:,:,3); R = data(:,:,4);
R = histeq(R, bins); G = histeq(G, bins); B = histeq(B, bins);
RGB = cat(3, R, G, B);
imshow(RGB)

%% part 1c
%show the NIR channel
figure
NIR = data(:,:,5);
NIR = histeq(NIR, bins);
NIRGB = cat(3, NIR, G, B);
imshow(NIRGB)

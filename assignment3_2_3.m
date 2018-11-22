%% Part 2a. 
% see report

%% Part 2b NB!!!! load data in the bottom part first
close all
TOA = zeros(1101, 1401, 11);
% convert each channel to TOA, using the given formula
for i = 1 : 11
   TOA(:,:,i) = radMult(i) * data(:,:,i) + radAdd(i);
end

%% Part 2c
% see report. Vegetation has a high response to NIR, and low to red
% thus the color change in 1c

%% part 3a
close all
% use the TOA values to calculate NDVI
NIR = TOA(:,:,5);
RED = TOA(:,:,4);
NDVI = (NIR - RED) ./ (NIR + RED);
eqNDVI = histeq(NDVI, 65536);
figure
imagesc(eqNDVI)

%% part 3b
close all
% use TOA values to calculate NDWI
TIR = TOA(:,:,10);
NDWI = (TIR - RED) ./ (TIR + RED);

% calculate land and sea mask using given treshholds
land = (NDVI > -0.45) & (NDWI < -0.30);
sea = ~land;

figure
imshow(land)
title('Land mask')
figure
imshow(sea)
title('Sea mask')

%% part 3c
% Calculate the sea surface temperature using TOA values and the given
% formula. 10 and 11 is the thermal infrared TIR bands 1 and 2
SST = 5.1424 + 0.9558 * TOA(:,:,10) + 0.8365 * (TOA(:,:,10) - TOA(:,:,11));
figure
imagesc(SST)

%% Load data
data = load('landsat8.mat');
data = double(cell2mat(struct2cell(data)));
% constants from header file. Needed for TOA calibration
radMult(1,1) = 1.2548e-02;
radMult(2,1) = 1.2795e-02;
radMult(3,1) = 1.1716e-02;
radMult(4,1) = 9.9229e-03;
radMult(5,1) = 6.0213e-03;
radMult(6,1) = 1.5171e-03;
radMult(7,1) = 4.9350e-04;
radMult(8,1) = 1.1177e-02;
radMult(9,1) = 2.4744e-03;
radMult(10,1) = 3.3420e-04;
radMult(11,1) = 3.3420e-04;
radAdd(1,1) = -62.73803;
radAdd(2,1) = -63.97628;
radAdd(3,1) = -58.58069;
radAdd(4,1) = -49.61426;
radAdd(5,1) = -30.10648;
radAdd(6,1) = -7.58533;
radAdd(7,1) = -2.46749;
radAdd(8,1) = -55.88732;
radAdd(9,1) = -12.37200;
radAdd(10,1) = 0.10000;
radAdd(11,1) = 0.10000;

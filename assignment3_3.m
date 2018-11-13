%% load data
data = load('landsat8.mat');
data = double(cell2mat(struct2cell(data)));

%% part 3a
close all
NIR = data(:,:,5);
RED = data(:,:,4);
NDVI = (NIR - RED) ./ (NIR + RED);

imshow(NDVI)
figure
J = histeq(NDVI, 65536);
imshow(J)

%% part 3b
close all
SWIR = data(:,:,6);
GRE = data(:,:,3);
TIR = data(:,:,10);
% NDWI = (TIR - RED) ./ (TIR + RED);
% NDWI = (GRE - NIR) ./ (GRE + NIR);
NDWI = (NIR - SWIR) ./ (NIR + SWIR);
imshow(NDWI)
figure
H = histeq(NDWI, 65536);
imshow(J)

land = (NDVI > -0.45) & (NDWI < -0.30);
sea = ~land;

figure
imshow(land)
figure
imshow(sea)
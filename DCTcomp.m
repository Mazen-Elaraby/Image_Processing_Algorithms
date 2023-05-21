%Discrete Cosine Transform based compression

img = imread('baboon.bmp');
img = rgb2gray(img);
img = im2double(img); %required for the DCT2 function

figure(1);
subplot(2,2,1);
imshow(img);

%the two dimensional DCT
y_dct = dct2(img);

subplot(2,2,2);
imshow(abs(y_dct));

%getting number of coefficents
sz = size(y_dct);
no_coeff = sz(1) * sz(2);

%compressing by taking less coefficents
k = 50; %no of taken coefficents
y_dct_comp = zeros(sz(1),sz(2));
y_dct_comp(1:k,1:k)=y_dct(1:k,1:k);

comp = 100 - ( ( (k*k)/no_coeff) * 100); %of the original size(compression)

y_comp = idct2(y_dct_comp);

subplot(2,2,3);
imshow(y_comp);
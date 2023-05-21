%Kmeans algorithm for image segmentation

%Loading RGB image and seperating channels
img = imread('peppers.png');

[n, m, l] = size(img);

img_r = img(:,:,1);
img_g = img(:,:,2);
img_b = img(:,:,3);

%reshaping the channels into flattened feature vectors
vec_r = reshape(img_r, n*m,1);
vec_g = reshape(img_g, n*m,1);
vec_b = reshape(img_b, n*m,1);

ft_mat = [vec_r, vec_g, vec_b]; %feature matrix

%running the built-in kmeans function in matlab
k = 5; %hyperparameter of the algorithm - # of segmented regions
[s_img, ths] = kmeans(double(ft_mat),k);

%displaying segmented areas

x = zeros(n,m);
grp = 1;
idx = find(s_img == grp);
x(idx) = 1;
figure(1);
subplot(2,3,1);
imshow(x);

x = zeros(n,m);
grp = 2;
idx = find(s_img == grp);
x(idx) = 1;
subplot(2,3,2);
imshow(x);

x = zeros(n,m);
grp = 3;
idx = find(s_img == grp);
x(idx) = 1;
subplot(2,3,3);
imshow(x);

x = zeros(n,m);
grp = 4;
idx = find(s_img == grp);
x(idx) = 1;
subplot(2,3,4);
imshow(x);

x = zeros(n,m);
grp = 5;
idx = find(s_img == grp);
x(idx) = 1;
subplot(2,3,5);
imshow(x);

%plotting unsegmented feature space
figure(2);
scatter3(ft_mat(:,1),ft_mat(:,2),ft_mat(:,3))

%plotting segmented output in feature space
figure(3);
hh=find(s_img==1);
scatter3(ft_mat(hh,1),ft_mat(hh,2),ft_mat(hh,3))
hold on
hh=find(s_img==2);
scatter3(ft_mat(hh,1),ft_mat(hh,2),ft_mat(hh,3))
hh=find(s_img==3);
scatter3(ft_mat(hh,1),ft_mat(hh,2),ft_mat(hh,3))
hh=find(s_img==4);
scatter3(ft_mat(hh,1),ft_mat(hh,2),ft_mat(hh,3))
hh=find(s_img==5);
scatter3(ft_mat(hh,1),ft_mat(hh,2),ft_mat(hh,3))

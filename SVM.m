%Image Classification using Support Vector Machine 

img = imread('cameraman.tif'); 
%defining classes
a_idx = find(img>128); 
b_idx = find(img<=128);

a = img(a_idx);
b = img(b_idx);

err = []; %error logs

for n=10:1000:20000 
    %this loop demonstrates the effect of training data size on the
    %accuracy of the prediction. we expect to see decreasing error with
    %increasing training data size

    tr_data = double([a(1:n);b(1:n)]); %training data
    ann = [zeros(n,1); ones(n,1)]; %annotations

    mdl = fitcsvm(tr_data, ann); %returns a trained SVM model object
    
    tst_data = double([a(n+1:end);b(n+1:end)]); %testing data

    rsp = predict(mdl, tst_data); %model response

    %calculating model misclassifications
    gnd_tr = [zeros(length(a)-n,1); ones(length(b)-n,1)];
    er = length(find(gnd_tr ~= rsp)); 
    err = [err er];
end

%plotting learning curve
figure(1);
plot(err)

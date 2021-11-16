function IMG_CHANGE(inputIm)


%% 读入图片
figure(1);
w0 = imread(inputIm);
imshow(w0);



%% 归一化操作 y=x^2操作
I2 = im2double(w0);     %转化为double型 0~1
I2 = I2.^2;             %Y=X^2非线性操作
I2=I2/2*255;       %转换回0~255范围
I2=uint8(I2);


%% 图像分割操作
m=2; %分成m*n块
n=2;
sample_w=size(I2,2); %获取图像宽
sample_h=size(I2,1); %获取图像高

region_h=floor(sample_h/m);%每个区域的高 
region_w=floor(sample_w/n);%每个区域的宽

figure(2);
%4个子块
temp1=I2((1-1)*region_h+1:1*region_h,(1-1)*region_w+1:1*region_w,:);
temp2=I2((1-1)*region_h+1:1*region_h,(2-1)*region_w+1:2*region_w,:);
temp3=I2((2-1)*region_h+1:2*region_h,(1-1)*region_w+1:1*region_w,:);
temp4=I2((2-1)*region_h+1:2*region_h,(2-1)*region_w+1:2*region_w,:);
% 显示子块
subplot(2,2,1);
imshow(temp1);
subplot(2,2,2);
imshow(temp2);
subplot(2,2,3);
imshow(temp3);
subplot(2,2,4);
imshow(temp4);


%% 交换子块顺序
figure(3);
temp=temp1;
temp1=temp4;
temp4=temp;

temp=temp2;
temp2=temp3;
temp3=temp;

% 显示子块
subplot(2,2,1);
imshow(temp1);
subplot(2,2,2);
imshow(temp2);
subplot(2,2,3);
imshow(temp3);
subplot(2,2,4);
imshow(temp4);





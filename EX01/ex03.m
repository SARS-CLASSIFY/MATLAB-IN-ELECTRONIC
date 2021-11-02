clear;
%%读入图片二值化
w0 = imread('2.jpeg');
w1 = rgb2gray(w0);
% imshow(w1);

%%逆时针旋转
w2 = imrotate(w1,90);
figure;
imshow(w2);
title('Rotated Image');
%%save
imwrite(w2, 'D:\rotate.png','png');


%%直方图统计
[Y,X]=size(w1); % Y Row , X column
grayvalue=unique(w1);
imginfo=[];
for i=1:length(grayvalue)
        [ANSy,ANSx]=find(w1==grayvalue(i));
        imginfo.gray(i)=grayvalue(i);
        imginfo.position{i}=[ANSy,ANSx];
        imginfo.count(i)=length(ANSy)/(Y*X);
end
figure;
stem(imginfo.gray,imginfo.count,'Marker','none');%stem(x， y)；绘制以x为横轴、 y为纵轴的脉冲杆图图形
xlabel('灰度'),ylabel('归一化值'),axis([0 255 0 max(imginfo.count)]);
title('直方图统计');

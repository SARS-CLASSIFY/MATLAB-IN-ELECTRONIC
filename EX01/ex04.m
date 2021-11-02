clear;
clear;
%%读入图片
figure(1);
w0 = imread('2.jpeg');
width=size(w0,2); %获取图像宽
length=size(w0,1); %获取图像长
imshow(w0);
hold on;
%鼠标取2点
[x,y] = ginput(2);
% fprintf("%f  %f\r\n",x,y);
if(x(1)>x(2))
    temp = x(1);
    x(1) = x(2);
    x(2) = temp;
    temp = y(1);
    y(1) = y(2);
    y(2) = temp;    
end
%%画'*'
plot(x(1),y(1),'k*');
plot(x(2),y(2),'k*');
%裁剪图片
figure(2);
w1 = imcrop(w0,[x(1) y(1) (x(2)-x(1)) (y(2)-y(1))]);
imshow(w1);
%%save
imwrite(w1, 'D:\imcrop.png','png');


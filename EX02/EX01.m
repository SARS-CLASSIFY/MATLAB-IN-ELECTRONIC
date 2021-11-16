clear;
figure(1);

%% 显示空白图片
axis([0,100,0,700]);  %确定x轴与y轴框图大小
xlabel('x'); %x轴坐标描述
ylabel('y'); %y轴坐标描述

%% 取点循环
[x,y] = ginput(1);
while 1
    [x1,y1] = ginput(1);
    if(x1~=x && y1~=y)
        line([x,x1],[y,y1]); %线性，颜色，标记
        x = x1;
        y = y1;
    end
end
clear;
%% 生成20个随机序列画柱状图动态显示
while 1
    data = round(rand(1,20)*100);
    bar(data,0.7);
    pause(1);
end

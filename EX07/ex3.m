        clear all;
        close all;
        A1 = [2,1,8];
        B1 = 1;
        y1 = impulse(B1,A1,0:0.01:30);
        figure(1)
        plot(0:0.01:30,y1);

        A2 = 1;
        B2 = [2,1,8];
        sys = tf(A2,B2);
        y2 = step(sys,0:0.01:30);
        figure(2)
        plot(0:0.01:30,y2);

        B3=[2 1.8]; 
        A3 =1;
        [H,w]=freqz(B3,A3);
        Hf=abs(H);  %取幅度值实部
        Hx=angle(H);  %取相位值对应相位角
        figure(3)
        plot(w*100/(2*pi),20*log10(Hf))  %幅值变换为分贝单位
        title('幅频特性曲线')
        figure(4)
        plot(w*100/(2*pi),Hx)
        title('相频特性曲线')
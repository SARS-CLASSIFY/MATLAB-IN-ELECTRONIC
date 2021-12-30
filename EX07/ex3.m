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
        Hf=abs(H);  %ȡ����ֵʵ��
        Hx=angle(H);  %ȡ��λֵ��Ӧ��λ��
        figure(3)
        plot(w*100/(2*pi),20*log10(Hf))  %��ֵ�任Ϊ�ֱ���λ
        title('��Ƶ��������')
        figure(4)
        plot(w*100/(2*pi),Hx)
        title('��Ƶ��������')
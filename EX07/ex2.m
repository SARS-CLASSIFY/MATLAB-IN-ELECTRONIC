        clear all;
        close all;
        A1 = [2,1,8];
        B1 = 1;
        figure(1)
        impulse(B1,A1,0:0.01:30);

        A2 = 1;
        B2 = [2,1,8];
        sys = tf(A2,B2);
        figure(2)
        step(sys,0:0.01:30);

        B3=[2 1.8]; 
        A3 =1;
        figure(3);
        freqz(B3,A3);


        clear all;
        close all;
        A1 = [2,1,8];
        B1 = 1;
        [r,p,k] = residue(B1,A1);
        t = 0:0.01:30;
        y1 = r(1)*exp(p(1)*t) + r(2)*exp(p(2)*t);
        figure(1)
        plot(t,y1);
        xlabel('³å»÷ÏìÓ¦');
        A2 = [2,1,8,0];
        B2 = 1;
        [r,p,k] = residue(B2,A2);
        t = 0:0.01:30;
        y2 = r(1)*exp(p(1)*t) + r(2)*exp(p(2)*t) + r(3)*exp(p(3)*t);
        figure(2)
        plot(t,y2);
        xlabel('½×Ô¾ÏìÓ¦');

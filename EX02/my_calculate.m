function [y] = my_calculate(x)
    if x<1
        y = x;
    elseif ((x>=1) && (x<10))
            y = 2*x - 1;
    else
            y = 3*x - 11;
    end
clear
clc
x = [1 2 3];
x(4) = 4;
for i = 1:length(x)
    if x(i) ==2
        x(i)=5;
    end
end
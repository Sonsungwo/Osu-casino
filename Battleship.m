clc
clear
pack = simpleGameEngine('retro_pack.png',16,16,5,[161,108,55]);
boardoutline = [];
board = [856,856,856,856,856,856;856,856,856,856,856,856;856,856,856,856,856,856;856,856,856,856,856,856;856,856,856,856,856,856;856,856,856,856,856,856];

drawScene(pack,board);
i=0;
n=1;
%what row col are you going to put
while i<2
row = input('what row do you want');
col = input('what col do you want');
if board(row,col)==856
    board(row,col) = 810;
    i = i +1;

end

drawScene(pack,board);
end
while n==1
    
    row = input ('where do you want to hit');
    col = input ('where do you wnat to hit');
    board(row,col)=811;
    drawScene(pack,board);
    for i=1:6
        for b =1:6
            if board(i,b)~=810
                disp('yes');
            else
                disp('no')
                n=2;
            end
        end
        
    end

end

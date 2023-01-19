function [final_coins] = slot_son(user_coin)
coins = user_coin; % player starts with 1000 chips
yes = true;
cardshape = simpleGameEngine('retro_pack.png',16,16,5,[0,128,0]);
Board = [1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1017,1014,988,1012,820,703,1,1,1,913;1,625,626,626,626,626,626,626,626,627,1,1,915;1,657,789,789,789,789,789,1,658,659,1,1,763;1,657,671,671,671,671,671,1,1,659,1,1,37;1,657,1,1,1,1,1,1,1,659,1,1,780;1,689,690,690,690,690,690,690,690,691,1,1,335;1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1];
   
drawScene(cardshape,Board);
disp("The rule of the slot machine is to have same picture as much as you can to get higer coin")
    pause (2);
wanttoplay = 'y';
yes2 = true;
disp('Do you want to play?? type ''y'' or ''n''')
while yes2
    wanttoplay=getKeyboardInput(cardshape);
    if wanttoplay=='y' || wanttoplay =='n'
        yes2 = false;
    else
        disp('press ''y'' or ''n !! to chose to play or not')
        yes2 = true;
    end
end
while wanttoplay=='y'
    yes = true;
    slot1=0;
    slot2=0;
    slot3=0;
    slot4=0;
    slot5=0;
    % make the board with the initail board
    Board = [1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1017,1014,988,1012,820,703,1,1,1,913;1,625,626,626,626,626,626,626,626,627,1,1,915;1,657,789,789,789,789,789,1,658,659,1,1,763;1,657,671,671,671,671,671,1,1,659,1,1,37;1,657,1,1,1,1,1,1,1,659,1,1,780;1,689,690,690,690,690,690,690,690,691,1,1,335;1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1];
   
    drawScene(cardshape,Board);

    
    fprintf('To win, get 3 matches or more, or if you get 2 same picture with 2 pair you can keep your bet !! you have %i of coin!\n',coins);
    coinplayer = input('How much do you want to bet??\n');
    % check if the player coin make sense
    while yes
        if coinplayer >coins
            fprintf('you cant bet more than your coin amount %i \n',coins);
            coinplayer = input('How much do you want to bet??\n');
        elseif coinplayer <= coins && coinplayer>=0
            yes = false;
        else
            disp('you should put number !')
            coinplayer = input('How much do you want to bet??\n');
        end
    end
    coins = coins - coinplayer;
    yes = true;
    % set spin number because their is 5 spin
    spinnum = 5;
    disp('push the button to spin the slot!')
    % make user to press the button if not ask again
    while yes
    [r,c] = getMouseInput(cardshape);
        if r==4 && c==9
            yes = false;
        else
            disp('push the button!')
            yes = true;
        end
    end
    a=0;
    b=0;
    f=0;
    d=0;
    e=0;
    Board(4,3)=822;
    Board(4,4)=822;
    Board(4,5)=822;
    Board(4,6)=822;
    Board(4,7)=822;
    drawScene(cardshape,Board);
    disp('press each of the "?" to stop the slot');
    while spinnum~=0
        yes = true;
        % change the slop shape to "?" mark
        slotshape = 0;
        slot = randi(6);
        if slot ==1
            slotshape = 763;
        elseif slot==2
            slotshape =913;
        elseif slot==3
            slotshape = 915;
        elseif slot==4
            slotshape = 37;
        elseif slot==5
            slotshape = 780;
        elseif slot ==6
            slotshape = 335;
        end
        % the a number is to check if the user press it or not. if it was
        % frist time pressing it print the shape
        while yes
            [r,c] = getMouseInput(cardshape);
            if r ==4 && c ==3
                if a~=1
                    Board(6,3)=slotshape;
                    slot1 = slot;
                    drawScene(cardshape,Board);
                    yes = false;
                    spinnum = spinnum -1;
                    a=1;
                else
                    yes=true;
                    disp('you already press it!')
                end
            elseif r==4 && c==4
                if b~=1
                    Board(6,4)=slotshape;
                    slot2 = slot;
                    drawScene(cardshape,Board);
                    yes = false;
                    spinnum = spinnum -1;
                    b=1;
                else
                    yes=true;
                    disp('you already press it!')
                end
            elseif r==4 && c==5
                if f~=1
                    Board(6,5)=slotshape;
                    slot3 = slot;
                    drawScene(cardshape,Board);
                    yes = false;
                    spinnum = spinnum -1;
                    f=1;
                else
                    yes=true;
                    disp('you already press it!')
                end
            elseif r==4 && c==6
                if d~=1
                    Board(6,6)=slotshape;
                    slot4 = slot;
                    drawScene(cardshape,Board);
                    spinnum = spinnum -1;
                    yes = false;
                    d=1;
                else
                    yes=true;
                    disp('you already press it!')
                end
            elseif r==4 && c==7
                if e~=1
                    Board(6,7)=slotshape;
                    slot5 = slot;
                    drawScene(cardshape,Board);
                    spinnum = spinnum -1;
                    yes = false;
                    e=1;
                else
                    yes=true;
                    disp('you already press it!')
                end
            else
                yes=true;
                disp('press the "?" mark!')
            end
        end
       
    end
    pause(1);
    count=0;
    samenum = 0;
    for i = 1:6
    same = [slot1,slot2,slot3,slot4,slot5 ];
    compare =(same==i);
    countsum = sum(compare);
        if count<=countsum
            count = countsum;
            if count ==2
                samenum = samenum +1;
            end
        end
       
   
    end
    % check how many count we get for same shape.
        if count ==5
            disp('you got jack pot!!!!')
            coins = coins + (coinplayer*5);
            fprintf('You win! 5x multiplier!! you coins is now %i\n' , coins);
            Board(9,3)=989;
            Board(9,4)=980;
            Board(9,5)=982;
            Board(9,6)=990;
            Board(9,7)=1014;
            Board(9,8)=1013;
            Board(9,9)=1018;
            Board(9,10)=820;
            drawScene(cardshape,Board);
        elseif count==4
            disp('you got 4 same picture!!')
            coins = coins + (coinplayer*3);
            fprintf('You win! 3x multiplier!! you coins is now %i\n' , coins);
            Board(8,3)=1023;
            Board(8,4)=1013;
            Board(8,5)=1019;
            Board(8,7)= 986;
            Board(8,8)=1013;
            Board(8,9)=1018;
            Board(9,3)= 952;
            Board(9,5)=1017;
            Board(9,6)=980;
            Board(9,7)=992;
            Board(9,8)=984;
            Board(9,9)=820;
            drawScene(cardshape,Board);
        elseif count ==3
            disp('you got 3 same picture!')
            coins = coins + (coinplayer*2);
            fprintf('You win! 2x multiplier!! you coins is now %i\n' , coins);
            Board(8,3)=1023;
            Board(8,4)=1013;
            Board(8,5)=1019;
            Board(8,7)= 986;
            Board(8,8)=1013;
            Board(8,9)=1018;
            Board(9,3)= 951;
            Board(9,5)=1017;
            Board(9,6)=980;
            Board(9,7)=992;
            Board(9,8)=984;
            Board(9,9)=820;
            drawScene(cardshape,Board);
        elseif count ==2 && samenum ==2
            disp('you got 2 same picture of pair!');
            coins = coins + (coinplayer);
            fprintf('Money back. you coins is now %i\n' , coins);
            Board(8,3)=1023;
            Board(8,4)=1013;
            Board(8,5)=1019;
            Board(8,7)= 986;
            Board(8,8)=1013;
            Board(8,9)=1018;
            Board(9,3)= 950;
            Board(9,5)=1017;
            Board(9,6)=980;
            Board(9,7)=992;
            Board(9,8)=984;
            Board(9,9)=820;
            drawScene(cardshape,Board);
        else
            disp('you lose');
           
            fprintf('Try again! you coins is now %i\n' , coins);
            Board(9,3)=1023;
            Board(9,4)=1013;
            Board(9,5)=1019;
            Board(9,7)=991;
            Board(9,8)=1013;
            Board(9,9)=1017;
            Board(9,10)=984;
            drawScene(cardshape,Board);
        end
        if coins >= 30000
            disp('you are able to leave the casino! but you can still play the game!');
        end
        if coins ==0
        disp(' you lost all your money restart from beginning ');
        wanttoplay = 'n';
        else
        disp('if you want to play game press ''y'' if not ''n''');
            yes2= true;
            while yes2
            wanttoplay=getKeyboardInput(cardshape);
                if wanttoplay=='y' || wanttoplay =='n'
                    yes2 = false;
                else
                    disp('press ''y'' or ''n !! to chose to play or not')
                    yes2 = true;
                end
            end
        end
end
final_coins = coins;
disp('good game bro');
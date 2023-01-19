function [final_coins] = knockout(user_coin)
coins=user_coin;
playerlife = 3;
computerlife =3;
cardshape = simpleGameEngine('retro_pack.png',16,16,5,[0,128,0]);
Board = [625,626,626,627,345,731,731,731;657,1,1,659,259,731,731,731;689,690,690,691,1,1,1,1;1,1,1,1,1,1,1,1;1,1,1,1,981,980,1012,1;1,1023,1013,1019,1,1,1,1;1,982,1013,992,1,1,1,1];
drawScene(cardshape,Board);
% tell them the rule 
disp("The rule of the knockout is you and computer will choose the number between 2 to 12. Each time the you will role 2 dice and try to aviod the chosen number. you and computer will have 3 chance. Try to win the computer !!")
    pause (4);
wanttoplay = 'y';
yes2 = true;
disp('Do you want to play?? type ''y'' or ''n''')
% made while loop for them to if they press other than require
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
    Board = [625,626,626,627,345,731,731,731;657,1,1,659,259,731,731,731;689,690,690,691,1,1,1,1;1,1,1,1,1,1,1,1;1,1,1,1,981,980,1012,1;1,1023,1013,1019,1,1,1,1;1,982,1013,992,1,1,1,1];
    drawScene(cardshape,Board);
    fprintf('Beat the computer to win coins! you have %i of coin!\n',coins);
    coinplayer = input('How much do you want to bet??\n');
    % will check if the user type more or negative coin 
    yes = true;
        while yes
            if coinplayer >coins
                fprintf('You don''t have enough coins! %i \n',coins);
                coinplayer = input('How much do you want to bet??\n');
            elseif coinplayer <= coins && coinplayer>=0
                yes = false;
            else
                disp('Type a number!')
                coinplayer = input('How much do you want to bet??\n');
            end
        end
        coins = coins - coinplayer;
    knock = input('what number do you want to knockout? 2~12');
    yes=true;
    while yes
        if knock<=12 &&knock>=2
            yes=false;
        else
            knock=input('pick a number between 2 and 12');
            yes=true;
        end
    end
    % if the user decide the number 2 to 12 then print in the board
    if knock < 10
        Board(6,6)=1;
        Board(6,7)= 948 + knock;
    elseif knock < 20 && knock>=10
        a = knock;
        first= mod(a,10);
        a=a/10;
        first= floor(first);
        second= mod(a,10);
        second= floor(second);
        totalfirstnum = 948+first;
        totalsecondnum = 948 + second;
        Board(6,7)=totalfirstnum;
        Board(6,6)=totalsecondnum;
    end
    drawScene(cardshape,Board);
    disp('computer is thinking what number to ban....')
    pause(3);
    % make the computer knock number 2 to 12 if it is same as player number
    % than change agian
    computerknock = randi(11)+1;
    while computerknock == knock
        computerknock = randi(11)+1;
    end
    fprintf('The computer knocked out %.f \n',computerknock);
    % print in the board and update
    if computerknock < 10
        Board(7,6)=1;
        Board(7,7)= 948 + computerknock;
    elseif computerknock < 20 && computerknock>=10
        a = computerknock;
        first= mod(a,10);
        a=a/10;
        first= floor(first);
        second= mod(a,10);
        second= floor(second);
        totalfirstnum = 948+first;
        totalsecondnum = 948 + second;
        Board(7,7)=totalfirstnum;
        Board(7,6)=totalsecondnum;
    end
    drawScene(cardshape,Board);
    n = 1;
    disp('let''s start the game');
    disp('we chose what to knockout. now it is time to roll the dice!');
    % made while loop until one of them get 0 life
    while playerlife ~=0 && computerlife ~=0
        n = 1;
        pause (2);
        yes2= true;
        %press 'a' if is not than make them type agian
        disp('press ''a'' to roll the dice!');
            while yes2
                k=getKeyboardInput(cardshape);
                if k=='a'
                    yes2 = false;
                else
                    disp('press ''a'' to roll! ')
                    yes2 = true;
                end
            end
        if k =='a'
            Board(2,2)=1;
            Board(2,3)=1;
            Board(4,2)=1;
            Board(4,3)=1;
            pause(2);
            a=0;
            n=0;
            radomnumber1 = randi(6);
            radomnumber2 = randi(6);
            diceshape1 = 858+radomnumber1;
            diceshape2 = 858+radomnumber2;
            Board(2,2)= diceshape1;
            % make the random number and print the shape and dice number 
            drawScene(cardshape,Board);
       
            pause (1);
            Board(2,3)= diceshape2;
            drawScene(cardshape,Board);
            pause(1);
            sum = radomnumber2 + radomnumber1;
            % update the number of sum in the board
            if sum < 10
                Board(4,2)=1;
                Board(4,3)= 948 + sum;
            elseif sum < 20 && sum>=10
                a = sum;
                first= mod(a,10);
                a=a/10;
                first= floor(first);
                second= mod(a,10);
                second= floor(second);
                totalfirstnum = 948+first;
                totalsecondnum = 948 + second;
                Board(4,3)=totalfirstnum;
                Board(4,2)=totalsecondnum;
            end
            drawScene(cardshape,Board);
            fprintf('the number of two dice is %.f %.f\n',radomnumber1,radomnumber2);
            pause(2);
            % if the number is same as what knock number than lose life and
            % make X mark in the board
            if sum == knock || sum==computerknock
                fprintf('You lost a life because you rolled %.f\n', sum);
                pause(2);
                Board(1,5+playerlife)= 825;
                pause(1);
                drawScene(cardshape,Board);
                playerlife = playerlife-1;
                fprintf('you have %.f of life\n', playerlife);
               
                n=2;
            end

            disp('press ''n'' to let computer roll')
            yes2= true;
                while yes2
                    k=getKeyboardInput(cardshape);
                    if k=='n'
                        yes2 = false;
                    else
                        disp('press ''n'' to roll! to make computer roll ')
                        yes2 = true;
                    end
                end
            if k =='n'
           % same as player 
            disp('It is computer time to roll the dice!')
            Board(2,2)=1;
            Board(2,3)=1;
            Board(4,2)=1;
            Board(4,3)=1;
            drawScene(cardshape,Board);
            pause(1.5);
           
            radomnumber1 = randi(6);
            radomnumber2 = randi(6);
            diceshape1 = 858+radomnumber1;
            diceshape2 = 858+radomnumber2;
            Board(2,2)= diceshape1;
            drawScene(cardshape,Board);
       
            pause (1);
            Board(2,3)= diceshape2;
            drawScene(cardshape,Board);
            fprintf('the number of the computer two dice is %.f %.f\n',radomnumber1,radomnumber2);
            pause(2);
            comsum = radomnumber2 + radomnumber1;
            if comsum < 10
                Board(4,2)=1;
                Board(4,3)= 948 + comsum;
            elseif comsum < 20 && comsum>=10
                a = comsum;
                first= mod(a,10);
                a=a/10;
                first= floor(first);
                second= mod(a,10);
                second= floor(second);
                totalfirstnum = 948+first;
                totalsecondnum = 948 + second;
                Board(4,3)=totalfirstnum;
                Board(4,2)=totalsecondnum;
            end
            drawScene(cardshape,Board);
            % if the computersum has same number with knock number lose
            % their point
            if comsum == knock || comsum==computerknock
                fprintf('computer lost a life because it rolled %.f\n', comsum);
                pause(2);
                Board(2,5+computerlife)= 825;
                pause(1);
                drawScene(cardshape,Board);
                computerlife = computerlife-1;
                fprintf('computer has %.f of life\n', computerlife);
   
                a=3;
            end
            end
            % if they lose point and same time than restore the life again 
            if n==2&& a==3
                disp('both of you get knock out so we will give one more chance');
                pause(2);
                computerlife = computerlife+1;
                playerlife = playerlife +1;
                Board(1,5+playerlife)= 731;
                Board(2,5+computerlife)=731;
                pause(1);
                drawScene(cardshape,Board);
               
               
                fprintf('computer has %.f of life and you have %.f of life', computerlife,playerlife);
                n=1;
            end
        end
    end
    pause (3);
    % check we won the game and make the board clear agian
    if n ==2
        disp(' you lose!! ')
        Board(2,2)=1;
        Board(2,3)=1;
        Board(4,2)=1;
        Board(4,3)=1;
        Board(5,5)=1;
        Board(5,6)=1;
        Board(5,7)=1;
        Board(6,2)=1;
        Board(6,3)=1;
        Board(6,4)=1;
        Board(6,5)=1;
        Board(6,6)=1;
        Board(6,7)=1;
        Board(7,2)=1;
        Board(7,3)=1;
        Board(7,4)=1;
        Board(7,5)=1;
        Board(7,6)=1;
        Board(7,7)=1;
        Board(5,2)=982;
        Board(5,3)=1013;
        Board(5,4)=992;
        Board(6,4)=1021;
        Board(6,5)=988;
        Board(6,6)=1012;
        Board(6,7)=820;  
        drawScene(cardshape,Board);
       
        fprintf ('you lost all your bet coin. your coin is now %i\n',coins)
        pause(5);
    else
        disp('computer lose!!')
        Board(2,2)=1;
        Board(2,3)=1;
        Board(4,2)=1;
        Board(4,3)=1;
        Board(5,5)=1;
        Board(5,6)=1;
        Board(5,7)=1;
        Board(6,2)=1;
        Board(6,3)=1;
        Board(6,4)=1;
        Board(6,5)=1;
        Board(6,6)=1;
        Board(6,7)=1;
        Board(7,2)=1;
        Board(7,3)=1;
        Board(7,4)=1;
        Board(7,5)=1;
        Board(7,6)=1;
        Board(7,7)=1;
        Board(5,2)=1023;
        Board(5,3)=1013;
        Board(5,4)=1019;
        Board(6,4)=1021;
        Board(6,5)=988;
        Board(6,6)=1012;
        Board(6,7)=820;
        drawScene(cardshape,Board);
        coins = coins + (coinplayer*3);
        fprintf ('You won! 3x coin multiplier!! your coin is now %i\n',coins)
        pause(5);
    end
    % tell them they dont need to play anymore
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
final_coins=coins;
disp('good game bro');
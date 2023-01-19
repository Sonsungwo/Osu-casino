clc
clear
disp('Welcome to casino')

cardshape = simpleGameEngine('retro_pack.png',16,16,5,[0,128,0]);
coin = 5000;
board = [756,757,756,757,756,756,757,756,757,756,756,757,756,757,756,757,756;1,1,1,1021, 984, 991, 982, 1013, 992, 984,1,1018,1013,1,1,1,1;1,1,1,1,1013, 1017, 1019,1, 982, 980 ,1017, 988, 1012, 1013,820,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1017,984,991,984,982,1018,1,986,980,992,984,820,820,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,949, 959,1,981,991,980,982,990,989,980,982,990,1,1,1,1;1, 950, 959,1,990,1012,1013,982,990,1013,1019,1018,1,1,1,1,1;1,951,959,1,986,984,1018,1,1018,1013,1,949,948,948,1,1,1;1,952,959,1,1017,991,1013,1018,1,992,980,982,987,988,1012,984,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,842,982,1013,988,1012,958,953,948,948,948,1,1,1,1,1];
disp('You currently have 5000 coins to your name. You owe a loan shark 30,000 coins. Win enough money in the casino to pay back the loan shark to win the game.')
pause(4)
drawScene(cardshape,board);
choose = 0;
% use while loop becasue they have to play the game everythime when they
% get out of it
yes = true;
while yes
    drawScene(cardshape,board);
    
    disp('what game do you want to play?')
    disp('click the game to start!')
    drawScene(cardshape,board);
    yes2= true;
    while yes2
    [r,c] = getMouseInput(cardshape);
        if r==7
            yes2 = false;
            choose =1;
        elseif r==8
            yes2 = false;
            choose =2;
        elseif r==9
            yes2 = false;
            choose =3;
        elseif r==10
            yes2 = false;
            choose =4;
        else
            disp('click the game!')
            yes2 = true;
        end
       
    end
   
    fprintf('your coin is %i\n' , coin);
    if choose ==1
        final_coin = Blackjack_A(coin);
    elseif choose ==2
        final_coin = knockout(coin);
    elseif choose ==3
        final_coin = untitled2(coin);
    elseif choose ==4
        final_coin = slot_son(coin);
    end
    coin = final_coin;
    % will get the final coin of the each game and update in board
    board = [756,757,756,757,756,756,757,756,757,756,756,757,756,757,756,757,756;1,1,1,1021, 984, 991, 982, 1013, 992, 984,1,1018,1013,1,1,1,1;1,1,1,1,1013, 1017, 1019,1, 982, 980 ,1017, 988, 1012, 1013,820,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1017,984,991,984,982,1018,1,986,980,992,984,820,820,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,949, 959,1,981,991,980,982,990,989,980,982,990,1,1,1,1;1, 950, 959,1,990,1012,1013,982,990,1013,1019,1018,1,1,1,1,1;1,951,959,1,986,984,1018,1,1018,1013,1,949,948,948,1,1,1;1,952,959,1,1017,991,1013,1018,1,992,980,982,987,988,1012,984,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;1,1,842,982,1013,988,1012,958,1,1,1,1,1,1,1,1,1];
    if coin>=0 && coin<10
        firstdigit = coin;
        totalnum= 948+firstdigit;
        board(13,9)=totalnum;
        drawScene(cardshape,board);
    elseif coin >= 10 && coin < 100
        a = coin;
        first= mod(a,10);
        a=a/10;
        first= floor(first);
        second= mod(a,10);
        a=a/10;
        second= floor(second);
        totalfirstnum = 948+first;
        totalsecondnum = 948 + second;
        board(13,10)=totalfirstnum;
        board(13,9)=totalsecondnum;
        drawScene(cardshape,board);
    elseif coin >= 100 && coin < 1000
        a = coin;
        first= mod(a,10);
        a=a/10;
        first= floor(first);            
        second= mod(a,10);
        a=a/10;
        second= floor(second);
                   
        third = mod(a,10);
        a=a/10;
        third = floor(third);
        totalfirstnum = 948+first;
        totalsecondnum = 948 + second;
        totalthirdnum = 948 +third;
        board(13,11)=totalfirstnum;
        board(13,10)=totalsecondnum;
        board(13,9)=totalthirdnum;
        drawScene(cardshape,board);
    elseif coin >= 1000 && coin <10000
        a = coin;
        first= mod(a,10);
        a=a/10;
        first= floor(first);            
        second= mod(a,10);
        a=a/10;
        second= floor(second);
        third = mod(a,10);
        a=a/10;
        third = floor(third);
        fourth = mod(a,10);
        a=a/10;
        fourth = floor(fourth);
        totalfirstnum = 948+first;
        totalsecondnum = 948 + second;
        totalthirdnum = 948 +third;
        totalfourthnum = 948+fourth;
        board(13,12)=totalfirstnum;
        board(13,11)=totalsecondnum;
        board(13,10)=totalthirdnum;
        board (13,9) = totalfourthnum;
        drawScene(cardshape,board);
    elseif coin >= 10000 && coin <100000
        a = coin;
        first= mod(a,10);
        a=a/10;
        first= floor(first);            
        second= mod(a,10);
        a=a/10;
        second= floor(second);
        third = mod(a,10);
        a=a/10;
        third = floor(third);
        fourth = mod(a,10);
        a=a/10;
        fourth = floor(fourth);
        five = mod (a,10);
        a=a/10;
        five = floor(five);
        totalfirstnum = 948+first;
        totalsecondnum = 948 + second;
        totalthirdnum = 948 +third;
        totalfourthnum = 948+fourth;
        totalfivenum = 948+five;
        board(13,13)=totalfirstnum;
        board(13,12)=totalsecondnum;
        board(13,11)=totalthirdnum;
        board (13,10) = totalfourthnum;
        board(13,9)=totalfivenum;
        drawScene(cardshape,board);  
    elseif coin >= 100000 && coin <1000000
        a = coin;
        first= mod(a,10);
        a=a/10;
        first= floor(first);            
        second= mod(a,10);
        a=a/10;
        second= floor(second);
        third = mod(a,10);
        a=a/10;
        third = floor(third);
        fourth = mod(a,10);
        a=a/10;
        fourth = floor(fourth);
        five = mod (a,10);
        a=a/10;
        five = floor(five);
        six = mod(a,10);
        a=a/10;
        six = floor(six);
        totalfirstnum = 948+first;
        totalsecondnum = 948 + second;
        totalthirdnum = 948 +third;
        totalfourthnum = 948+fourth;
        totalfivenum = 948+five;
        totalsixnum = 948+six;
        board(13,14)=totalfirstnum;
        board(13,13)=totalsecondnum;
        board(13,12)=totalthirdnum;
        board (13,11) = totalfourthnum;
        board(13,10)=totalfivenum;
        board(13,9)=totalsixnum;
        drawScene(cardshape,board);  
    end
    drawScene(cardshape,board); 
    % if coin is bigger than certain amount you are free to go out
    if coin >=30000
        disp('you are free now!')
        yes = false;
        % if the user loose all the coin the game end
    elseif coin==0
        disp('You have been kicked out of the casino.');
        yes = false;
    end
end
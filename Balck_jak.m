
%Name1 = input('Enter Player1''s name', 's');
% no more than ticket
% no more than 21 
% check a with using 1 or 11
% percent
clear
clc
a = [1,2,3,4,5,6,7,8,9,10,10,10,10];
b = [1,2,3,4,5,6,7,8,9,10,10,10,10];
c = [1,2,3,4,5,6,7,8,9,10,10,10,10];
d = [1,2,3,4,5,6,7,8,9,10,10,10,10];
computerarray = [];
playerarray = [];
computernum = 0;
playernum =0;
playertype = 'y';

n = 1;
indexcom =1;
indexplayer =1;

playerticket = 500;
while n==1
    a = [1,2,3,4,5,6,7,8,9,10,10,10,10];
    b = [1,2,3,4,5,6,7,8,9,10,10,10,10];
    c = [1,2,3,4,5,6,7,8,9,10,10,10,10];
    d = [1,2,3,4,5,6,7,8,9,10,10,10,10];
    fprintf('you have %i of ticket right now\n', playerticket);
    playerbet = input('if you win you get double!!\n if you loose you lose all of you bet\n how many do you want to bet?\n');
    playerticket = playerticket-playerbet;
    computernum = 0;
    playernum =0;
    indexcom =1;
    indexplayer =1;
    computerarray = [0];
    playerarray = [0];

    playertype = 'y';
    while computernum<  17 || playertype == 'y'
        % computer zone
        random_card = randi([1 4]);
        if computernum <17
            if random_card==1
               lenghta =length(a);
               random_number = randi([1 length(a)]);
               computerarray(indexcom) = a(random_number);
               computernum = computernum + a(random_number);
               a(random_number)=[];
        
            end 
            if random_card==2
               lenghtb =length(b);
               random_number = randi([1 length(b)]);
               computernum = computernum + b(random_number);
               computerarray(indexcom) = b(random_number);

               b(random_number)=[];
            end 
            if random_card==3
               lenghtc =length(c);
               random_number = randi([1 length(c)]);
               computernum = computernum + c(random_number);
               computerarray(indexcom) = c(random_number);

               c(random_number)=[];
            end 
            if random_card==4
               lenghtd =length(d);
               random_number = randi([1 length(d)]);
               computernum = computernum + d(random_number);
               computerarray(indexcom) = d(random_number);
               d(random_number)=[];
            end 
            if indexcom ==1
                fprintf('this is first computer card %i \n',computernum);
                
            end
            indexcom = indexcom +1;

        end
        %player zone
        random_card = randi([1 4]);
        if playertype =='y'
            if random_card==1
               lenghta =length(a);
               random_number = randi([1 length(a)]);
               playernum = playernum + a(random_number);
               playerarray(indexplayer) = a(random_number);
               a(random_number)=[];
        
            end 
            if random_card==2
               lenghtb =length(b);
               random_number = randi([1 length(b)]);
               playernum = playernum + b(random_number);
               playerarray(indexplayer) = b(random_number);
               b(random_number)=[];
            end 
            if random_card==3
               lenghtc =length(c);
               random_number = randi([1 length(c)]);
               playernum = playernum + c(random_number);
               playerarray(indexplayer) = c(random_number);
               c(random_number)=[];
            end 
            if random_card==4
               lenghtd =length(d);
               random_number = randi([1 length(d)]);
               playernum = playernum + d(random_number);
               playerarray(indexplayer) = d(random_number);
               d(random_number)=[];
            end 
            indexplayer = indexplayer +1;
            fprintf('this is your card %i \n',playernum);
            for i = 1:length(playerarray)
               if playerarray(i) ==1
                   chose = input('do you want to use ace as 1 or 11. y for 1 , n for 11 ''y'' or ''n''', 's');
                   if chose == 'y'
                      playerarray(i)=1;
                   elseif chose == 'n'
                      playerarray(i)=11;
                   end
               end
            end
            playerarray
            playertype = input('get one more card?\n type ''y'' or ''n'' ', 's');
        end
    end
    if computernum>21 && playernum>21
        fprintf('draw!! \n');
        playerticket = playerticket + playerbet;
    end
    if computernum>21 && playernum<=21
        fprintf('plyaer won!!\n')
        playerticket = playerticket + playerbet*2;
    end
    if computernum<=21 && playernum>21
        fprintf('computer won!!\n')

    end
    if computernum <=21 && playernum<=21
        if computernum < playernum
            fprintf('player won!\n')
            playerticket = playerticket + playerbet*2;
        elseif computernum > playernum
            fprintf('computer won!\n')
        elseif computernum == playernum
            if indexcom > indexplayer
                fprintf('player won! because of number of card!\n')
                playerticket = playerticket + playerbet*2;
            else
                fprintf('computer won! because of number of card!\n')
            end
        end
    end
   
    fprintf('you ticket is %i\n',playerticket);
    fprintf('do you want to play again?\n')
    n = input('if you want to play again type 1 if not type 2');




end


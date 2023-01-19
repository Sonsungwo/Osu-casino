% A game of chohan with 2 players
clc
clear

% set up some constants to refer to odd and even. The specific numbers used
% here are arbitrary, and we are really just making the code more readable.
odd = 1;
even = 2;
%BUG it wants to has  's 
%Fix I have put '' to print normal
%bug it did not get as string
%fix added 's' to get as string
Name1 = input('Enter Player1''s name', 's');
%BUG it wants to has  's 
%Fix I have put '' to print normal
Name2 = input('Enter Player2''s name','s');

% Player 1
% Print current player and give instructions
%bug it is printing as number
%fix I have chagne to i to s so it will print as string
fprintf('%s, choose your bet.\n',Name1);

%  input 
%bug this want to be put 1 or 2 but getting as stirng
%fix I have erased s to just get as number
input_bet1 = input('Enter 1 for odd or 2 for even: ');

% Record the bet in the player bet vector. 
%bug it is getting as odd and even but the user typed as number 
%fix change odd and even to number just like user typed
%bug it is getting invaild becasue it is && sign
%fix change to || becasue only 1 statement should be true
if input_bet1 == 1 ||  input_bet1 == 2
    player1_bet = input_bet1;
else
% if the user put anything else default to even
    fprintf('Invalid bet, defaulting to even.\n')
    player1_bet = even;
end

% Player 2
fprintf('%s, choose your bet.\n',Name2)
    
%  input 
%bug input is getting as %f
%fix erase %f becasue we dont need to have it 
input_bet2 = input('Enter 1 for odd or 2 for even: ');
    
% Record the bet in the player bet vector. 
%bug it is getting as odd and even but the user typed as number 
%fix change odd and even to number just like user typed
%bug it is getting invaild becasue it is && sign
%fix change to || becasue only 1 statement should be true
if input_bet2 == 1 || input_bet2 == 2
    player2_bet = input_bet2;
else
% if the user put anything else default to even
    fprintf('Invalid bet, defaulting to even.\n')
    player2_bet = even;
end


% Roll the dice! 
% This generates a 1 by 6 matrix of random integers from 1 to 6
% See "help randi" for more details
roll_vector = randi(6,1,6);

% Display the rolled dice % Need to create an error here.
%bug it is have decimal point even though it is dice number
%fix I put .0 to not see any decimal point
%bug we dont want to see the "the dice rolled are" each time
%fix make it as different fprintf to not repeat
fprintf('The dice rolled are: ');
fprintf('%.0f  ', roll_vector)



% Calculate if the roll was even or odd using the mod() function  to
% calculate the remainder when divided by 2
total_roll = sum(roll_vector);
%bug it is have decimal point even though it is dice number
%fix I put .0 to not see any decimal point
fprintf('\nThe sum of the dice rolled is %.0f \n',total_roll);
if mod(total_roll,2) == 1
    %but we decide to put number instead of string of odd or even
    %fix change to number odd is 1
    result = 1;
else
    %but we decide to put number instead of string of odd or even
    %fix change to number even is 2
    result = 2;
end

% announce winners
%bug this has only one = sign 
%fix this is boolean so we need two equal sign
if player1_bet == result
    fprintf('Player 1 Wins! :)\n');
else
    fprintf('Player 1 Loses! :(\n');
end

%bug this has only one = sign 
%fix this is boolean so we need two equal sign
if player2_bet == result
    fprintf('Player 2 Wins! :)\n');
else
    fprintf('Player 2 Loses! :(\n');
end


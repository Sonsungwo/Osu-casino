BJV = simpleGameEngine('retro_Pack.png', 16, 16, 5, [0, 128, 0]);
Board = [345,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1;259,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1];
drawScene(BJV, Board);

clc
playerMoney = 100;
pIsBroke = false;
wantsToPlay = input("Do you want to play Blackjack? y or n \n", "s");
while(wantsToPlay ~="n" && wantsToPlay ~= "y")
   wantsToPlay = input("This is not a valid input. Do you want to play blackjack? y or n", "s"); 
end
if(wantsToPlay== "n")
    fprintf("Understandable, have a nice day.")
    return
end

%% bet loop
while (wantsToPlay=="y" && pIsBroke == false)
    Board = [345,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1;259,1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1,1;345,1017,982,1013,1016,984,958,948,948,1;259,1017,982,1013,1016,984,958,948,948,1];
    drawScene(BJV, Board);
    if(playerMoney == 0)
        pIsBroke = true;
        fprintf("You do not have enough money \n")
        break
    end
    fprintf("You have $%.0f \n", playerMoney);
    playerBet = input("Place your bet: ");
    while(playerBet <= 0 || playerBet > playerMoney)
        if(playerBet <= 0)
            playerBet = input("Bet must be greater than zero, place a valid bet: \n");
        elseif(playerBet > playerMoney)
            playerBet = input("You do not have enough money for that bet, place a valid bet: \n");
        end
    end
    playerMoney = playerMoney - playerBet;
    
    %% Cards are dealt
    % Dealer cards dealt
    fprintf("The dealers first card is: \n");
    [dealerCards, hasAceD, DcardIMG] = getCardSimpleGameEngine(1);
    Blackjack = false;
    Board(3,2) = DcardIMG;
        if(dealerCards==30)
            Board(6,8) = 951;
            Board(6,9) = 948;
        elseif(dealerCards > 21)
            Board(6,8) = 950;
            Board(6,9) = 948+(dealerCards-20);
        elseif(dealerCards ==21)
            Board(6,8)=950;
            Board(6,9)=949;
        elseif(dealerCards==20)
            Board(6,8)=950;
            Board(6,9)=948;
        elseif(dealerCards>=10)
            Board(6,8)=949;
            Board(6,9)=948+(dealerCards-10);
        else
            Board(6,9) = 948+dealerCards;
        end
    drawScene(BJV, Board);
    pause(1);


    %Your cards dealt
    fprintf("Your cards are: \n");
    [playerCards, hasAceP, PcardIMG] = getCardSimpleGameEngine(1);
    Board(1, 2) = PcardIMG;
            %Score Display System
        if(playerCards==30)
            Board(5,8) = 951;
            Board(5,9) = 948;
        elseif(playerCards > 21)
            Board(5,8) = 950;
            Board(5,9) = 948+(playerCards-20);
        elseif(playerCards ==21)
            Board(5,8)=950;
            Board(5,9)=949;
        elseif(playerCards==20)
            Board(5,8)=950;
            Board(5,9)=948;
        elseif(playerCards>=10)
            Board(5,8)=949;
            Board(5,9)=948+(playerCards-10);
        else
            Board(5,9) = 948+playerCards;
        end
    drawScene(BJV, Board);
    pause(1);
    [playerCard2, hasAceP2, PcardIMG] = getCardSimpleGameEngine(1);
    playerCards = playerCards + playerCard2;
    Board(1,3) = PcardIMG;
        if(playerCards==30)
            Board(5,8) = 951;
            Board(5,9) = 948;
        elseif(playerCards > 21)
            Board(5,8) = 950;
            Board(5,9) = 948+(playerCards-20);
        elseif(playerCards ==21)
            Board(5,8)=950;
            Board(5,9)=949;
        elseif(playerCards==20)
            Board(5,8)=950;
            Board(5,9)=948;
        elseif(playerCards>=10)
            Board(5,8)=949;
            Board(5,9)=948+(playerCards-10);
        else
            Board(5,9) = 948+playerCards;
        end
    drawScene(BJV, Board);
    pause(1);
    if(playerCards == 22)
        playerCards = playerCards -10;
    elseif(playerCards == 21)
        fprintf("You have a natural Blackjack. If the dealer also has a natural Blackjack it is a push, otherwise you win. \n");
        [cardAdded, hasAceD, DcardIMG] = getCardSimpleGameEngine(1);
        dealerCards = dealerCards + cardAdded;
        Board(3,2) = DcardIMG;
        drawScene(BJV, Board);
        if(dealerCards == 21)
            fprintf("The dealer also has a natural Blackjack, it is a push. \n");
            playerMoney = playerMoney+playerBet;
            Blackjack = true;
        else
            fprintf("The dealer did not have a natural Blackjack, you win. \n");
            Board(4,2)=1023;
            Board(4,3)=1015;
            Board(4,4)=1019;
            Board(4,6)=1021;
            Board(4,7)=988;
            Board(4,8)=1012;
            drawScene(BJV, Board);
            playerMoney = playerMoney+playerBet*2;
            Blackjack = true;
        end
            
    end 
    fprintf("You are now at %.0f \n", playerCards);
    
    %% Player choices action
    playerChoice = "hit";
    pCardIndex = 4;
    while(playerChoice== "hit" && playerCards < 21)
    
        playerChoice = input("What do you want to do: hit, double down, or stand \n", "s");
    
        if playerChoice == "hit"
            [cardAdded, isAceAdded, PcardIMG] = getCardSimpleGameEngine(1);
            playerCards = playerCards + cardAdded;
            if((isAceAdded == true || hasAceP == true) && playerCards > 21)
                playerCards = playerCards - 10;
                if(isAceAdded == true)
                    isAceAdded = false;
                elseif(hasAceP == true)
                    hasAceP = false;
                end 
            end
            Board(1, pCardIndex) = PcardIMG;
            if(playerCards==30)
                Board(5,8) = 951;
                Board(5,9) = 948;
            elseif(playerCards > 21)
                Board(5,8) = 950;
                Board(5,9) = 948+(playerCards-20);
            elseif(playerCards ==21)
                Board(5,8)=950;
                Board(5,9)=949;
            elseif(playerCards==20)
                Board(5,8)=950;
                Board(5,9)=948;
            elseif(playerCards>=10)
                Board(5,8)=949;
                Board(5,9)=948+(playerCards-10);
            else
                Board(5,9) = 948+playerCards;
            end
            drawScene(BJV, Board);
            pCardIndex = pCardIndex + 1;
            fprintf("You are now at %.0f \n", playerCards);
        elseif playerChoice == "double down"
            if playerMoney < playerBet * 2
                fprintf("You do not have enough money to double down, choose something else: \n");
                playerChoice = "hit";
            else
                [cardAdded, isAceAdded, PcardIMG] = getCardSimpleGameEngine(1);
                playerCards = playerCards + cardAdded;
                playerBet = playerBet * 2;
                if((isAceAdded == true || hasAceP == true) && playerCards > 21)
                    playerCards = playerCards - 10;
                    if(isAceAdded == true)
                        isAceAdded = false;
                    elseif(hasAceP == true)
                        hasAceP = false;
                    end
                end
                Board(1, pCardIndex) = PcardIMG;
                if(playerCards==30)
                    Board(5,8) = 951;
                    Board(5,9) = 948;
                elseif(playerCards > 21)
                    Board(5,8) = 950;
                    Board(5,9) = 948+(playerCards-20);
                elseif(playerCards ==21)
                    Board(5,8)=950;
                    Board(5,9)=949;
               elseif(playerCards==20)
                    Board(5,8)=950;
                    Board(5,9)=948;
                elseif(playerCards>=10)
                    Board(5,8)=949;
                    Board(5,9)=948+(playerCards-10);
                else
                    Board(5,9) = 948+playerCards;
                end
                drawScene(BJV, Board);
                pCardIndex = pCardIndex + 1;
                fprintf("your bet is now %.0f \n", playerBet);
                fprintf("You are now at %.0f \n", playerCards);
            end
        elseif playerChoice == "stand"
            fprintf("You are standing at %.0f \n", playerCards);
        else
            playerChoice = "hit";
            fprintf("That is not a valid input, choose something else: \n")
        end
    
        if(playerCards > 21)
            fprintf("You went over 21, you lose \n");
            Board(4,2)=1023;
            Board(4,3)=1015;
            Board(4,4)=1019;
            Board(4,6)=991;
            Board(4,7)=1015;
            Board(4,8)=1017;
            Board(4,9)=984;
            drawScene(BJV, Board);
        end
    
    end
    
    %% dealer reacts to player action
    if(playerCards <= 21 && Blackjack == false)
        fprintf("The dealers second card is revealed \n");
        [cardAdded, isAceAdded, DcardIMG] = getCardSimpleGameEngine(1);
        dealerCards = dealerCards + cardAdded;
        if((isAceAdded == true || hasAceD == true) && dealerCards > 21)
            dealerCards = dealerCards -10;
            if(isAceAdded == true)
                isAceAdded = false;
            elseif(hasAceP == true)
                hasAceD = false;
            end
        end
        Board(3,3) = DcardIMG;
        if(dealerCards==30)
            Board(6,8) = 951;
            Board(6,9) = 948;
        elseif(dealerCards > 21)
            Board(6,8) = 950;
            Board(6,9) = 948+(dealerCards-20);
        elseif(dealerCards ==21)
            Board(6,8)=950;
            Board(6,9)=949;
        elseif(dealerCards==20)
            Board(6,8)=950;
            Board(6,9)=948;
        elseif(dealerCards>=10)
            Board(6,8)=949;
            Board(6,9)=948+(dealerCards-10);
        else
            Board(6,9) = 948+dealerCards;
        end
        drawScene(BJV, Board);
        fprintf("The dealer is at %.0f \n", dealerCards);
        pause(1);
            dCardIndex = 4;
            while(dealerCards < playerCards)
                fprintf("The dealer hits \n");
                [cardAdded, isAceAdded, DcardIMG] = getCardSimpleGameEngine(1);
                dealerCards = dealerCards + cardAdded;
                if((isAceAdded == true || hasAceD == true) && dealerCards > 21)
                    dealerCards = dealerCards -10;
                    if(isAceAdded == true)
                        isAceAdded = false;
                    elseif(hasAceP == true)
                        hasAceD = false;
                    end
                end
                Board(3,dCardIndex) = DcardIMG;
                dCardIndex = dCardIndex + 1;
                if(dealerCards==30)
                    Board(6,8) = 951;
                    Board(6,9) = 948;
                elseif(dealerCards > 21)
                    Board(6,8) = 950;
                    Board(6,9) = 948+(dealerCards-20);
                elseif(dealerCards ==21)
                    Board(6,8)=950;
                    Board(6,9)=949;
                elseif(dealerCards==20)
                    Board(6,8)=950;
                    Board(6,9)=948;
                elseif(dealerCards>=10)
                    Board(6,8)=949;
                    Board(6,9)=948+(dealerCards-10);
                else
                    Board(6,9) = 948+dealerCards;
                end
                drawScene(BJV, Board);
                fprintf("The dealer is at %.0f \n", dealerCards);
                pause(1);
            end
            if(dealerCards <= 21 && dealerCards > playerCards)
                fprintf("The dealer went higher than you, you lose \n");
                Board(4,2)=1023;
                Board(4,3)=1015;
                Board(4,4)=1019;
                Board(4,6)=991;
                Board(4,7)=1015;
                Board(4,8)=1017;
                Board(4,9)=984;
                drawScene(BJV, Board);
            elseif(dealerCards <= 21 && dealerCards < playerCards)
                fprintf("You are higher than the dealer, you win \n");
                Board(4,2)=1023;
                Board(4,3)=1015;
                Board(4,4)=1019;
                Board(4,6)=1021;
                Board(4,7)=988;
                Board(4,8)=1012;
                drawScene(BJV, Board);
                playerMoney = playerMoney + playerBet*2;
            elseif(dealerCards == playerCards)
                fprintf("Its a tie, you get your money back \n");
                playerMoney = playerMoney+playerBet;
                Board(4,2)=1023;
                Board(4,3)=1015;
                Board(4,4)=1019;
                Board(4,6)=1016;
                Board(4,7)=988;
                Board(4,8)=984;
                drawScene(BJV, Board);
            else
                fprintf("The dealer went bust, you win \n");
                Board(4,2)=1023;
                Board(4,3)=1015;
                Board(4,4)=1019;
                Board(4,6)=1021;
                Board(4,7)=988;
                Board(4,8)=1012;
                drawScene(BJV, Board);
                playerMoney = playerMoney + playerBet*2;
            end
    end
    %% money is displayed, player is asked if they want to play again
    fprintf("You now have $%.0f \n", playerMoney);
    wantsToPlay = input("Do you want to play again? y or n \n", "s");
    while(wantsToPlay ~="n" && wantsToPlay ~= "y")
        wantsToPlay = input("This is not a valid input. Do you want to play blackjack? y or n", "s"); 
    end
    if(wantsToPlay=="n")
        fprintf("Understandable, have a nice day.")
        break
    end
    clc
end



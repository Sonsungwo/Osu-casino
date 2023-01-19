clc
cardshape = simpleGameEngine('retro_cards.png',16,16,5,[0,128,0]);

playerMoney = 100;
pIsBroke = false;
fprintf("You have $%.0f \n", playerMoney);
wantsToPlay = input("Do you want to play Blackjack? y or n \n", "s");
if(wantsToPlay== "n" && pIsBroke == false)
    fprintf("Understandable, have a nice day.")
    return
end
while (wantsToPlay=="y")
    index = 0;
    indexx=0;
    Board = [1,1,1;1,1,1;1,1,1;1,1,1];
    drawScene(cardshape,Board);
    if(playerMoney == 0)
        pIsBroke = true;
        fprintf("You do not have enough money")
        break
    end
    playerBet = input("Place your bet: ");
    playerMoney = playerMoney - playerBet;
    
    fprintf("The dealers first card is: \n");
    [cardw, cardsh,dealerCards, hasAceD] = getCard(1);
    if cardsh==1 
        board = 46 + cardw;
    end

    if cardsh==2 
        board = 33 + cardw;
    end

    if cardsh==3 
        board = 20 + cardw;
    end

    if cardsh==4 
        board = 59 + cardw;
    end
    Board = [1,1,1,1,1;board,1,1,1,1;1,1,1,1,1;1,1,1,1,1];
    drawScene(cardshape,Board);

    
    fprintf("Your cards are: \n");

    [cardw, cardsh,playerCards,hasAceP] = getCard(1);

    if cardsh==1 
        board1 = 46 + cardw;
    end

    if cardsh==2 
        board1 = 33 + cardw;
    end

    if cardsh==3 
        board1 = 20 + cardw;
    end

    if cardsh==4 
        board1 = 59 + cardw;
    end

    [cardw, cardsh,cardAdded,hasAceP] = getCard(1);

    if cardsh==1 
        board2 = 46 + cardw;
    end

    if cardsh==2 
        board2 = 33 + cardw;
    end

    if cardsh==3 
        board2 = 20 + cardw;
    end

    if cardsh==4 
        board2 = 59 + cardw;
    end
    playerCards = playerCards + cardAdded;
    fprintf("You are now at %.0f \n", playerCards);

    Board = [1,1,1,1,1;board,1,1,1,1;board1,board2,1,1,1;1,1,1,1,1];

    drawScene(cardshape,Board);
    
    
    playerChoice = "hit";
    while(playerChoice== "hit" && playerCards <= 21)
    
        playerChoice = input("What do you want to do: hit, double down, or stand \n", "s");
    
        if playerChoice == "hit"
            [cardw, cardsh,cardAdded, isAceAdded] = getCard(1);
            if((isAceAdded == true || hasAceP == true) && playerCards > 21)
                playerCards = playerCards - 10;
                if(isAceAdded == true)
                    isAceAdded = false;
                elseif(hasAceP == true)
                    hasAceP = false;
                end
            end
            
            if cardsh==1 
              board3 = 46 + cardw;
            end
            if cardsh==2 
                board3 = 33 + cardw;
            end
            if cardsh==3 
                board3 = 20 + cardw;
            end
            if cardsh==4 
                board3 = 59 + cardw;
            end
            playerCards = playerCards + cardAdded;
            Board(3,3+index)= board3;

            drawScene(cardshape,Board);
            index = index +1;
            fprintf("You are now at %.0f \n", playerCards);
        elseif playerChoice == "double down"
            if playerMoney >= playerBet * 2
                [cardw, cardsh,cardAdded, isAceAdded] = getCard(1);
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
                if cardsh==1 
                  board3 = 46 + cardw;
                end
                if cardsh==2 
                    board3 = 33 + cardw;
                end
                if cardsh==3 
                    board3 = 20 + cardw;
                end
                if cardsh==4 
                    board3 = 59 + cardw;
                end
                playerCards = playerCards + cardAdded;
                Board(3,3+index)= board3;
                index = index +1;
                drawScene(cardshape,Board);
                fprintf("your bet is now %.0f \n", playerBet);
                fprintf("You are now at %.0f \n", playerCards);
            else
                fprintf("You do not have enough money to double down, choose another option. \n");
                playerChoice = "hit";
            end
        elseif playerChoice == "stand"
            fprintf("You are standing at %.0f \n", playerCards);
        end
    
        if(playerCards > 21)
            fprintf("You went over 21, you lose \n");
        end
    
    end
    
    if(playerCards <= 21)
        fprintf("The dealers second card is revealed \n");
        [cardw, cardsh,cardAdded, isAceAdded] = getCard(1);
        if cardsh==1 
                  board3 = 46 + cardw;
        end
        if cardsh==2 
                    board3 = 33 + cardw;
        end
        if cardsh==3 
                    board3 = 20 + cardw;
        end
        if cardsh==4 
                    board3 = 59 + cardw;
        end
                playerCards = playerCards + cardAdded;
                Board(2,2)= board3;
        dealerCards = dealerCards + cardAdded;
        if((isAceAdded == true || hasAceD == true) && dealerCards > 21)
            dealerCards = dealerCards -10;
            if(isAceAdded == true)
                isAceAdded = false;
            elseif(hasAceP == true)
                hasAceD = false;
            end
        end
        fprintf("The dealer is at %.0f \n", dealerCards);
            while(dealerCards < 17)
                
                fprintf("The dealer hits \n");
                [cardw, cardsh,cardAdded, isAceAdded] = getCard(1);
                if cardsh==1 
                  board3 = 46 + cardw;
                end
                if cardsh==2 
                    board3 = 33 + cardw;
                end
                if cardsh==3 
                    board3 = 20 + cardw;
                end
                if cardsh==4 
                    board3 = 59 + cardw;
                end
                playerCards = playerCards + cardAdded;
                Board(2,3+indexx)= board3;
                indexx = indexx +1;
                drawScene(cardshape,Board);
                dealerCards = dealerCards + cardAdded;
                if((isAceAdded == true || hasAceD == true) && dealerCards > 21)
                    dealerCards = dealerCards -10;
                    if(isAceAdded == true)
                        isAceAdded = false;
                    elseif(hasAceP == true)
                        hasAceD = false;
                    end
                end
                fprintf("The dealer is at %.0f \n", dealerCards);
            end
            if(dealerCards <= 21 && dealerCards > playerCards)
                fprintf("The dealer went higher than you, you lose \n");
            elseif(dealerCards <= 21 && dealerCards < playerCards)
                fprintf("You are higher than the dealer, you win \n");
                playerMoney = playerMoney + playerBet*2;
            elseif(dealerCards == playerCards)
                fprintf("Its a tie, you get your money back \n");
                playerMoney = playerMoney+playerBet;
            else
                fprintf("The dealer went bust, you win \n");
                playerMoney = playerMoney + playerBet*2;
            end
            
    
    end
    fprintf("You now have $%.0f \n", playerMoney);
    wantsToPlay = input("Do you want to play again? y or n \n", "s");
    if(wantsToPlay=="n")
        fprintf("Understandable, have a nice day.")
        break
    end
    clc
end








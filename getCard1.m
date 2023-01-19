function [totalCardVal, isAce, cardIMG] = getCardSimpleGameEngine(cardAmount)
    cardIMG = 0;
    totalCardVal = 0;
    cardVals = [11 2 3 4 5 6 7 8 9 10 10 10 10];
    isAce = false;
    for i = 1 : cardAmount
    cardFaction = round((4-1) * rand(1)+1);
    cardNumber = round((12-1)*rand(1)+1);
    if cardNumber ==12
        cardNumStr = "King";
    elseif cardNumber == 11
        cardNumStr = "Queen";
    elseif cardNumber == 10
        cardNumStr = "Jack";
    elseif cardNumber == 1
        cardNumStr = "Ace";
        isAce = true;
    else
        cardNumStr = string(cardNumber);
    end

        if cardFaction == 1
            fprintf('   %s of hearts \n', cardNumStr);
            totalCardVal = totalCardVal + cardVals(cardNumber);
            cardIMG = cardNumber + 532;
        elseif cardFaction == 2
            fprintf('   %s of diamonds \n', cardNumStr);
            totalCardVal = totalCardVal + cardVals(cardNumber);
            cardIMG = cardNumber + 564;
        elseif cardFaction ==3
            fprintf('   %s of clubs \n', cardNumStr);
            totalCardVal = totalCardVal + cardVals(cardNumber);
            cardIMG = cardNumber + 596;
        else
            fprintf('   %s of spades \n', cardNumStr);
            totalCardVal = totalCardVal + cardVals(cardNumber);
            cardIMG = cardNumber + 628;
        end
    end

end




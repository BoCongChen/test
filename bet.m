function [final,his] = bet(InitialFish,Bet_1,MaxFish,MaxBet)

p  = [0.6 0.38 0.02] ;
pp = [p(1) p(1)+p(2)] ;

fish = InitialFish ;
bet  = Bet_1 ;

his = bet ;

count = 0 ;
while fish > 0 && fish < MaxFish
    count  = count + 1 ;    
    result = sum(sign(rand-pp)) ;
    switch result
        case -2
            fish = fish - bet ;
            bet  = 2*bet ;
            if bet > ceil(MaxBet*fish)
                bet = Bet_1 ;
            end
        case 0
            fish = fish + 2*bet ;
            bet  = Bet_1 ;
        case 2
            fish = fish + 3*bet ;
            bet  = Bet_1 ;
    end
    his(count) = fish ;
end

final = his(end) ;

end
clear;clc
tic

Bet_1   = 1 ;
MaxFish = 1000 ;

InitialFish_min = 100 ;
InitialFish_max = 110 ;
resolution   = 10 ;
run = 100 ;
min = InitialFish_min+1 ;
isWin = zeros(InitialFish_max-InitialFish_min+1,resolution) ;

parfor InitialFish = InitialFish_min : InitialFish_max
    
    for maxbet = 1 : resolution
        MaxBet = maxbet/resolution ;
        p = 0 ;
        for i = 1 : run
            result = bet(InitialFish,Bet_1,MaxFish,MaxBet) > 0 ;
            p = p + result ;
        end
        isWin(InitialFish-InitialFish_min+1,maxbet) = p/run ;
    end
end

imagesc(InitialFish_min:InitialFish_max,1/resolution:1/resolution:1,isWin')
set(gca,'YDir','normal')
xlabel('Initial Fish')
ylabel('Max Bet')
colormap(jet(128))
caxis([0 1])
colorbar

toc
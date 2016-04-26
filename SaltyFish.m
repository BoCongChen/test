clear;clc
tic

Bet_1   = 1 ;
MaxFish = 100000 ;

InitialFish_min = 1000 ;
InitialFish_max = 1000 ;
resolution_i    = 100 ;
resolution_j    = InitialFish_max - InitialFish_min + 1 ;

run = 100 ;
min = InitialFish_min+1 ;
isWin = zeros(resolution_i,resolution_j) ;

parfor i = 1 : resolution_i
    MaxBet = i/resolution_i ;
    for j = 1 : resolution_j
        InitialFish = InitialFish_min + j - 1 ;
        p = 0 ;
        for t = 1 : run
            result = bet(InitialFish,Bet_1,MaxFish,MaxBet) > 0 ;
            p = p + result ;
        end
        isWin(i,j) = p/run ;
    end
end

MaxBet = 1/resolution_i : 1/resolution_i : 1 ;
InitialFish = InitialFish_min : InitialFish_max ;

imagesc(MaxBet,InitialFish,isWin')
set(gca,'YDir','normal')
xlabel('Max Bet')
ylabel('Initial Fish')
colormap(jet(128))
caxis([0 1])
colorbar

plot(MaxBet,isWin(:,1),'b.-')
xlabel('Max Bet')
ylabel('Probability of rich')

toc
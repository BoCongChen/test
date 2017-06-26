clear;clc
x = 0 : 0.001 : 1 ;
r = 3.4 ; e = 0 ; g = 0.8 ;
L = 10 ; N = L^2 ;
A = netgenerate([L L],'square') ;
step = 100 ;

x0 = x ;
xx = rand(N-1,1) ;

plot(x,x0,'b.')
title('n = 0')
axis([0 1 0 1])
xlabel('x_0')
ylabel('x_n')
pause

for n = 1 : step
    for xi = 1 : length(x)
        his = netdev(A,[r g e],'step',1,'initialstate',[x0(xi);xx]) ;
        x0(xi) = his(1) ;
    end
    xx = his(2:end) ;
    
    plot(x,x0,'b.')
    title(['n = ',num2str(n)])
    xlabel('x_0')
    ylabel('x_n')
    axis([0 1 0 1])
    pause
end
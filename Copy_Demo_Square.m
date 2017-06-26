clear;clc
r = 3.4 ; g = 0.8 ; e = 0.15 ;
L = 100 ; N = L^2 ;
A = netgenerate([L L],'square') ;
CNmax = ceil(0.99*N) ;
preT = 100 ; step = 3001 ;

[his,delta,c] = netdev(A,[r g e],'step',...
    step,'driver','dynamic','tent',CNmax,...
    'threshold',0.015,'controlT',preT:step) ;

delta_abs = abs(delta) ;
S  = reshape(his,[N^0.5 N^0.5 step]) ;
driver = reshape([c(:,2:end).*sign(delta(:,1:end-1)),zeros(N,1)],[N^0.5 N^0.5 step]) ;
% for n = preT-20 : 2 : step
%     drawnow
%     subplot(2,1,1)
%     imagesc(S(:,:,n))
%     title(['n = ',num2str(n)])
%     colormap(jet(128))
%     colorbar
%     caxis([0 1])
%     axis square
%     
%     subplot(2,1,2)
% %     hist(delta_abs(:,n),0:0.001:0.5)
% %     axis([0 0.5 0 1000])
%     imagesc(driver(:,:,n))
%     title(['n = ',num2str(n)])
%     colormap(gca,[1,1,1;0,0,0])
%     colorbar
%     caxis([0 1])
%     axis square
% end

n = preT + [50,200,400,step-preT-1] ;
figure(1)
for ni = 1 : length(n)
    subplot('position',[(ni-3)*0.22+0.5,0.6,0.22,0.35])
    imagesc(S(:,:,n(ni))) ;
    title(['n = ',num2str(n(ni))])
    set(gca,'Xtick',[],'Ytick',[])
    colormap(gca,jet(128))
    caxis([0 1])
    axis square
    
    subplot('position',[(ni-3)*0.22+0.5,0.2,0.22,0.35])
    imagesc(driver(:,:,n(ni))) ;
    set(gca,'Xtick',[],'Ytick',[])
    colormap(gca,[0,0,1;1,1,1;1,0,0])
    caxis([-1 1])
    axis square
end
set(gcf,'pos',[525,215,1000,500])

figure(2)
plot(1:step,sum(c,1)/N,'b.')
xlabel('n')
ylabel('N_D/N')
axis([1 step 0 0.2])

figure(3)
plot(abs(sum(sign(delta),1))/N,'b.-')
axis([1 step 0 1])
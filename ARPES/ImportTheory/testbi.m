clear all
close all
bulk = importdata("dos.dat_l");
%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ii=1;
ident = bulk(ii,1);
match = bulk(1,1);
while ident == match
      ii= ii+1;
    ident = bulk(ii,1); 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = reshape(bulk,(ii-1),size(bulk,1)/(ii-1),4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
resize = 10;
surface = imresize(exp(B(:,:,4)),resize);
Bulkim = imresize(B(:,:,3),resize);

figure(1)
hold on
imagesc(Bulkim)
colormap(hot)
%h2 = imagesc(surface);
colormap(cold)
% set(h2, 'AlphaData', 0.5);
hold off
% imshowpair(Bulkim,surface);
daspect([ 1 1 1])
ylim([1 size(B,1)*resize])
xlim([1 size(B,2)*resize])
yt = yticks;
yticks(min(B(:,1,3)):abs((min(B(:,1,3)) - max(B(:,1,3)))/size(yt,2)):max(B(:,1,3)))
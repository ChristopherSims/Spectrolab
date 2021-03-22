%innercore
clear all;clc;clf;close all
scale = 1;
sample = 'test';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file_no = '51';
A = IBWread('Data\HA2\f00051.ibw'); %%%% manually select core level file
B = A.y*scale;

Xmin = A.x0(1); Ymin = A.x0(2); 
Dx = A.dx(1); Dy = A.dx(2);
Xmax = Dx*size(B,1) + Xmin; Ymax = Dy*size(B,2) + Ymin;

Y = mean(B);%B(1,:);
X = abs(1:size(Y,2));
Xplot = Dy.*X + Ymin + 4.5;
[pk,lk,w,p] =findpeaks(Y(1,:), ...
                          'MinPeakDistance',50 );
                      
% eliminate trend%%%%%%%%%%%%%%%%%%%
opol = 6;
[p,s,mu] = polyfit(X,Y,opol);
f_y = polyval(p,X,[],mu);
dt_Y = Y - f_y;
%%%%%%%%%%%%%%%%%%%%%%%%
offset = 2000;
B = smooth(dt_Y(1,1:(size(dt_Y,2))),10);
B(680:850) = Y(680:850)/10-20;
hold on
plot(Xplot,B,'linewidth',2.5,'color','Red');
%plot(Xplot,f_y(1,:)+offset,'linewidth',2.5,'color','Blue');
%plot(Xplot(1,:),smoothdata(dt_Y(1,:)),'linewidth',2.5,'color','Red');
%plot(Xplot,smoothdata(B(1,:)+10),'linewidth',2.5,'color','Green');
box on
set(gca,'YTickLabel',[]);
xlabel('Energy (eV)')
ylabel('Counts (a.u.)')
%plot(Xplot(lk),pk,'*');
xlim([-70,0])
%ylim([0,6000])
set(gca,'fontsize',40)
hold off 
hold on
axes('Position',[.7 .7 .2 .2])
box on
plot(Xplot(1,560:680),B(560:680,1),'linewidth',2.5,'color','Red');
set(gca,'YTickLabel',[]);
%text(Xplot(lk)+.2,pk+100,num2str((1:numel(pk))'))
Innercore = Xplot(lk);

saveas(gcf,strcat(Figure_Dir,SampleName,'_Innercore.png'))
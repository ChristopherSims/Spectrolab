clc;
close all
f = squeeze(B(:,ypos,:))';
f = imresize(f,5);
%f = imadjust(f);
%f = medfilt2(f,[round(size(f,1)/75) round(size(f,2)/75)]);
offsetx = 0.25;
offsety = 0.5;

figure
hold on
subplot(1,4,1)
imshow (f ,[], 'XData', [KX_Angle_Min+ + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', cold(1000));
subplot(1,4,2) 
h_Sobel = fspecial ('sobel');
f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
imshow(f_y ,[], 'XData', [KX_Angle_Min+ + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', gray(1000));
subplot(1,4,3)
f_m = medfilt2(f,[round(size(f,1)/75) round(size(f,2)/75)]);
imshow(f_m ,[], 'XData', [KX_Angle_Min+ + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', cold(1000));
subplot(1,4,4)
f_y = f_y./max(f_y(:));
test1 = abs(f_y);
imshow(f_y ,[], 'XData', [KX_Angle_Min+ + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', gray(1000));
hold off
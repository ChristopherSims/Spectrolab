function slider_plot(B,lim,fig,type)
range = lim - 1;
set(fig,'Name','Image','Toolbar','figure',...
    'NumberTitle','off')
% Create an axes to plot in
axes('Position',[.15 .05 .7 .9]);
% sliders for epsilon and lambda
slider1_handle=uicontrol(fig,'Style','slider','Max',int16(lim),'Min',1,...
    'Value',2,'SliderStep',[1/range 10/range],...
    'Units','normalized','Position',[.02 .02 .14 .05]);
uicontrol(fig,'Style','text','Units','normalized','Position',[.02 .07 .14 .04],...
    'String','Choose frame');
% Set up callbacks
vars=struct('slider1_handle',slider1_handle,'B',B);
if type == 3
plotterfcn3(vars)
set(slider1_handle,'Callback',{@slider3_callback,vars});
elseif type==2
    plotterfcn2(vars)
    set(slider1_handle,'Callback',{@slider2_callback,vars});
elseif type ==1
    plotterfcn1(vars)
    set(slider1_handle,'Callback',{@slider1_callback,vars});
end
% End of main file
function slider2_callback(~,~,vars)
    % Run slider1 which controls value of epsilon
    plotterfcn2(vars)
    function slider1_callback(~,~,vars)
    % Run slider1 which controls value of epsilon
    plotterfcn1(vars)
% Callback subfunctions to support UI actions
function slider3_callback(~,~,vars)
    % Run slider1 which controls value of epsilon
    plotterfcn3(vars)

function plotterfcn3(vars)
    % Plots the image
    imshow(vars.B(:,:,get(vars.slider1_handle,'Value')),[], 'XData', [0 1], 'YData', [0 1]);
        title(num2str(get(vars.slider1_handle,'Value')));
    function plotterfcn2(vars)
        global KY_Angle_Max KY_Angle_Min KX_Angle_Max KX_Angle_Min;
        imshow(flipud(squeeze(vars.B(:,get(vars.slider1_handle,'Value'),:))')...
            ,[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', cold);
title (num2str(get(vars.slider1_handle,'Value')))

  function plotterfcn1(vars)
        imshow(squeeze(vars.B(get(vars.slider1_handle,'Value'),:,:)),[], ...
            'XData', [0 1], 'YData', [0 1]);
        title(num2str(get(vars.slider1_handle,'Value')));

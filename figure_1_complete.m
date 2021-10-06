% Create a figure
dpi = 150;            % Resolution
sz = [0 0 1024 768]; % Image size in pixels
fontSize = 16;

%figure(...
%  'PaperUnits','inches',...
%  'PaperPosition', sz/dpi,...
%  'PaperPositionMode','manual', ...
%  'Position', [100, 100, 1024, 768] ...
%  );
  %, 'Visible', 'off');
%clf

% For convenience, dock the figure:
% set(gcf, 'WindowStyle', 'docked');

% Load the high-res version of our exported inkscape-plot:
%thisFolder = fileparts(matlab.desktop.editor.getActiveFilename);
%[x, map, alpha] = imread([thisFolder '/figure_1_1.png']);

% Subpart-Captions
annotation('textbox', [0.075, 0.85, .1, .1], 'String', 'a', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize+6);
annotation('textbox', [0.075, 0.6, .1, .1], 'String', 'b', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize+6);
annotation('textbox', [0.075, 0.3, .1, .1], 'String', 'c', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize+6);


% Plot it:
ax = subplot(3,1,1);
%plot([0,1000],[0,0])
%xlim([1,1000]);
%ylim([1,1000]);
x = ones(768,4848,3);
imshow(x);

siz = get(ax, 'Position');
siz = siz(3:4);

%axis off;
ax.Box = 'off';

%yticks([]);
%xticks([]);
upperSpace = 200;

aspectRatio = 2;
ax.PlotBoxAspectRatio = [1, aspectRatio, 1];

%ylim([-1 * upperSpace, size(x, 1)]);
set(ax, 'Position', get(ax, 'Position') + [0, 0.02,0,0]);



center = size(x);
center = center(2:-1:1) / 2;
center(2) = center(2) + 75;

circleWidth = 150;
circleDistance = 100;

headLength = 15;
headWidth = 15;

lineWidth = 2;
boxwidth = 1.5;


rectangle('Position', [center(1)-(circleWidth/20) - 7 * circleDistance - 10 * circleWidth + 200, ...
    center(2)-(circleWidth/20), ...
    circleWidth/10, circleWidth/10], 'Curvature', [1,1], ...
    'FaceColor', 'k');

rectangle('Position', [center(1)-(circleWidth/20) - 7 * circleDistance + -9*circleWidth + 100, ...
    center(2)-(circleWidth/20), ...
    circleWidth/10, circleWidth/10], 'Curvature', [1,1], ...
    'FaceColor', 'k');

rectangle('Position', [center(1)-(circleWidth/20) - 7 * circleDistance + -8*circleWidth, ...
    center(2)-(circleWidth/20), ...
    circleWidth/10, circleWidth/10], 'Curvature', [1,1], ...
    'FaceColor', 'k');


for i = -7:1:7
    rectangle('Position', [center(1)-(circleWidth/2) + i*circleDistance + i*circleWidth, ...
        center(2)-(circleWidth/2), ...
        circleWidth, circleWidth], 'Curvature', [1,1], ...
        'FaceColor', 'k');
end


rectangle('Position', [center(1)+(circleWidth/20) + 7 * circleDistance + 10 * circleWidth - 200, ...
    center(2)-(circleWidth/20), ...
    circleWidth/10, circleWidth/10], 'Curvature', [1,1], ...
    'FaceColor', 'k');

rectangle('Position', [center(1)+(circleWidth/20) + 7 * circleDistance + 9*circleWidth - 100, ...
    center(2)-(circleWidth/20), ...
    circleWidth/10, circleWidth/10], 'Curvature', [1,1], ...
    'FaceColor', 'k');

rectangle('Position', [center(1)+(circleWidth/20) + 7 * circleDistance + 8*circleWidth, ...
    center(2)-(circleWidth/20), ...
    circleWidth/10, circleWidth/10], 'Curvature', [1,1], ...
    'FaceColor', 'k');

% Draw Bezier Curves for the arrows
t = linspace(0,1,100);
pt1 = [center(1) + 20                                ; center(2)-circleWidth/2 - 20];
pt2 = [center(1) + circleDistance + circleWidth - 30 ; center(2)-circleWidth/2 - 20];
pt3 = [center(1) + circleDistance/2+circleWidth/2    ; center(2)-circleWidth * 1.25];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2);
hold on
plot(pts(1,:),pts(2,:), 'b', 'LineWidth', lineWidth);

ah = annotation('arrow',...
     'headStyle','vback1', 'HeadLength',headLength,'HeadWidth',headWidth);
set(ah,'parent',gca);
set(ah,'position', [pt2(1)+5,pt2(2)+5, 0.1, -0.6], 'Color',[0,0,1]);
hold off

%%%
pt1 = [center(1) - 20                                ; center(2)-circleWidth/2 - 20];
pt2 = [center(1) - circleDistance - circleWidth + 30 ; center(2)-circleWidth/2 - 20];
pt3 = [center(1) - circleDistance/2-circleWidth/2    ; center(2)-circleWidth * 1.25];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2); 
hold on
plot(pts(1,:),pts(2,:), 'b', 'LineWidth', lineWidth)

ah = annotation('arrow',...
     'headStyle','vback1', 'HeadLength',headLength,'HeadWidth',headWidth);
set(ah,'parent',gca);
set(ah,'position', [pt2(1)-5,pt2(2)+5, -0.2, -1], 'Color',[0,0,1]);
hold off

%%%
pt1 = [center(1) - 0                                 ; center(2)-circleWidth/2 - 20];
pt2 = [center(1) - circleDistance - 2*circleWidth-60 ; center(2)-circleWidth/2 - 20];
pt3 = [center(1) - circleDistance/2-circleWidth      ; center(2)-circleWidth * 2];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2);
hold on
plot(pts(1,:),pts(2,:), 'b', 'LineWidth', lineWidth)

ah = annotation('arrow',...
     'headStyle','vback1', 'HeadLength',headLength,'HeadWidth',headWidth);
set(ah,'parent',gca);
set(ah,'position', [pt2(1)-5,pt2(2)+5, -0.2, -1], 'Color',[0,0,1]);
hold off

%%%
pt1 = [center(1) + 0                                 ; center(2)-circleWidth/2 - 20];
pt2 = [center(1) + circleDistance + 2*circleWidth+60 ; center(2)-circleWidth/2 - 20];
pt3 = [center(1) + circleDistance/2+circleWidth      ; center(2)-circleWidth * 2];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2);
hold on
plot(pts(1,:),pts(2,:), 'b', 'LineWidth', lineWidth)

ah = annotation('arrow',...
     'headStyle','vback1', 'HeadLength',headLength,'HeadWidth',headWidth);
set(ah,'parent',gca);
set(ah,'position', [pt2(1)+5,pt2(2)+5, 0.1, -0.6], 'Color',[0,0,1]);
hold off




%%%
pt1 = [center(1) + 20                                ; center(2)+circleWidth/2 + 20];
pt2 = [center(1) + 3*circleDistance + 3*circleWidth - 30 ; center(2)+circleWidth/2 + 20];
pt3 = [center(1) + circleDistance+circleWidth/2    ; center(2)+circleWidth * 2];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2);
hold on
plot(pts(1,:),pts(2,:), 'r', 'LineWidth', lineWidth)

plot([pt2(1)-60, pt2(1)+45], [pt2(2)-25, pt2(2)+10], 'r', 'LineWidth', lineWidth);

hold off

%%%
pt1 = [center(1) - 20                                ; center(2)+circleWidth/2 + 20];
pt2 = [center(1) - 3*circleDistance - 3*circleWidth + 30 ; center(2)+circleWidth/2 + 20];
pt3 = [center(1) - circleDistance-circleWidth/2    ; center(2)+circleWidth * 2];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2);
hold on
plot(pts(1,:),pts(2,:), 'r', 'LineWidth', lineWidth)
plot([pt2(1)-45, pt2(1)+60], [pt2(2)+15, pt2(2)-20], 'r', 'LineWidth', lineWidth);
hold off

%%%
pt1 = [center(1) - 0                                 ; center(2)+circleWidth/2 + 20];
pt2 = [center(1) - 4*circleDistance-4*circleWidth+30 ; center(2)+circleWidth/2 + 20];
pt3 = [center(1) - circleDistance*2-circleWidth      ; center(2)+circleWidth * 3];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2);
hold on
plot(pts(1,:),pts(2,:), 'r', 'LineWidth', lineWidth)
plot([pt2(1)+50, pt2(1)-45], [pt2(2)-20, pt2(2)+10], 'r', 'LineWidth', lineWidth);
hold off

%%%
pt1 = [center(1) + 0                                 ; center(2)+circleWidth/2 + 20];
pt2 = [center(1) + 4*circleDistance+4*circleWidth-30 ; center(2)+circleWidth/2 + 20];
pt3 = [center(1) + circleDistance*2+circleWidth      ; center(2)+circleWidth * 3];

pts = kron((1-t).^2,pt1) + kron(2*(1-t).*t,pt3) + kron(t.^2,pt2);
hold on
plot(pts(1,:),pts(2,:), 'r', 'LineWidth', lineWidth)
plot([pt2(1)+40, pt2(1)-60], [pt2(2)+20, pt2(2)-20], 'r', 'LineWidth', lineWidth);

ah = annotation('arrow',...
     'headStyle','vback1', 'HeadLength',headLength,'HeadWidth',headWidth);
set(ah,'parent',gca);
set(ah,'position', [center(1), center(2)-150, 0, -1], 'Color',[0,0,0]);

plot([center(1) center(1)], [center(2) - 150,75], 'k', 'LineWidth', lineWidth);

ah = annotation('Textbox', 'String', 'Stimulus', 'HorizontalAlignment', 'center', 'FontSize', fontSize);
set(ah,'parent',gca);
set(ah,'position', [center(1), -80, 0, -1], 'Color',[0,0,0]);

hold off

% Add the title and descriptions
%t = title(sprintf('\n\n'));
%annotation('textbox', [0.47, 0.825, .1, .1], 'String', 'Stimulus', 'HorizontalAlignment','center', 'LineStyle','none');


% Subfigure 2: The kernel plot
ax = subplot(3,3,4:6);
pos = get(ax, 'Position');
pos(2) = pos(2) + 0.025;
set(ax, 'Position', pos);

lineWidth = 3;

    % This is a copy-paste from ebastians code
int_kernel = gauss(500,250,2,20,0) + gauss(500,250,-1.6,40,0); 

plot([100:400],int_kernel(100:400),'LineWidth',lineWidth,'color','r')
hold on
plot([236:266],int_kernel(236:266),'LineWidth',lineWidth,'color','b')
hold on
plot([5,100],[0,0],'LineWidth',lineWidth,'color','k')
plot([400,495],[0,0],'LineWidth',lineWidth,'color','k')
pbaspect([2 1 1])
set(gca,'xtick',[0,250,500])
set(gca,'xticklabel',{'0','Unit position','500'},'Fontsize',fontSize)
set(gca,'ytick',[-0.6,0,0.6])
set(gca,'yticklabel',{'-0.6','0','0.6'}, 'Fontsize', fontSize)
set(gca, 'linewidth', boxwidth);
ylabel(sprintf('Interaction Strength') ) %,'Fontsize',25)
%xlabel(sprintf('Unit Position'),'Fontweight','bold','Fontsize',23)
t = title(sprintf('\n\n'));
%annotation('textbox', [0.2, 0.6, .1, .1], 'String', 'b) Recurrent Interaction Kernel', 'HorizontalAlignment','center', 'LineStyle','none', 'FontWeight', 'bold');
xlim([0 500])
ylim([-0.8 0.7])


%subplot(3,3,4:6)


    % Another copy paste
ppp=p6
ppp.inp_str = 0.75;
ppp.inp_diff = 0;

ppp.inp_pos = 250


all = sim(ppp)
ppp.noise_str = 0
no_noise = sim(ppp)
ppp.w_inh = 0
ppp.w_exc = 0
ppp.inp_str=2
nothing = sim(ppp)
ppp.inp_str=1.5

subplot(3,3,7)

plot(nothing.field(400,:),'Linewidth',2,'color','k')
hold on
plot([250,250],[-10,-5],'k')
title(sprintf('\n\nwithout\nrecurrent\ninteraction'),'Fontweight','normal','Fontsize',fontSize)
xlim([0,500])
ylim([-10,10])
set(gca,'xtick',[0 500])
set(gca,'xticklabel',{'0','500'},'Fontsize',fontSize)
xlabel('Unit Position') ; %,'Fontsize',14)
ylabel(sprintf('Field response to\nsingle stimulus'),'Fontsize',fontSize)
set(gca,'ytick',[-10,0,10])
set(gca,'yticklabel',{'-10','0','10'},'Fontsize',fontSize)
set(gca, 'Position', get(gca, 'Position') - [0, 0.04,0,0]);
set(gca, 'linewidth', boxwidth);

pbaspect([1 1 1])

subplot(3,3,8)

plot(no_noise.field(400,:),'Linewidth',2,'color','k')
hold on
plot([250,250],[-10,-5],'k')
xlim([0,500])
ylim([-10,10])
set(gca,'xtick',[0 500])
set(gca,'ytick',[-10,0,10])
set(gca,'yticklabel',{'-10','0','10'},'Fontsize',fontSize)
set(gca, 'Position', get(gca, 'Position') - [0, 0.04,0,0]);
set(gca, 'linewidth', boxwidth);
title(sprintf('\n\nwith\nrecurrent\ninteractions'),'Fontweight','normal','Fontsize',fontSize,'Fontweight','normal')

pbaspect([1 1 1])

subplot(3,3,9)

plot(all.field(400,:),'Linewidth',2,'color','k')
hold on
plot([250,250],[-10,-5],'k')
xlim([0,500])
ylim([-10,10])
pbaspect([1 1 1])

set(gca,'xtick',[0 500])
set(gca,'ytick',[-10,0,10])
set(gca,'yticklabel',{'-10','0','10'},'Fontsize',fontSize)
title(sprintf('\n\nrecurrent\ninteractions\n+ noise'),'Fontweight','normal','Fontsize',fontSize)
set(gca, 'Position', get(gca, 'Position') - [0, 0.04,0,0]);
set(gca, 'linewidth', boxwidth);

target_file = matlab.desktop.editor.getActiveFilename;
target_file = fileparts(target_file); % Extracts the folder

% set(gcf, 'color', 'w');
% set(gcf, 'InvertHardcopy', 'on')

set(gcf,'paperunits','centimeters','paperposition',[0 0 30 25]);
print([target_file '/figure1.png'],'-dpng','-r600')


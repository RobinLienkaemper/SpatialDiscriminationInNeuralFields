%figure();
clf;

added_plotheight = 0.03;
added_plotwidth = 0.02;

params = p6;
std_seed = 598996453;

boxwidth = 1.5;

% ---------------
% Overview Plot -
%----------------
ax = subplot(5,4,1:8);

temp = get(ax, 'Position');
temp = temp + [0,0.05 ,0, 0];
set(ax, 'Position', temp);

rng(std_seed+0);
range = 40:10:140;

% Uncomment this if you want to re-calculate the data
arr = paramsArray(params, 'inp_diff', range);
data_2pd_plot_figure2 = scanParamsArray(arr, 10, @decide2PointSRDx5);


% Calulate the sigmoid fit:
ft = fittype('0.5 * tanh( a * ( x - b )) + 0.5',...
            'coefficient',{'a', 'b'}, 'independent','x');
    
fo = fitoptions(ft);
fo.StartPoint = [0.01, 100];
     
myfit = fit(range', data_2pd_plot_figure2, ft, fo);

coeffs = coeffvalues(myfit);
thresh = coeffs(2);


fontSize = 16;

% Plot the data    
gg=plot(range,data_2pd_plot_figure2,'xb','MarkerSize', 9, 'LineWidth', 2)
       
hold on
%set(gg,'color','red')

gg=plot(myfit, 'b');
set(gg,'LineWidth',2.0)

% Turn off the annoying legend
hleg=legend(gg,'off');
set(hleg,'visible','off')

% Lines indicating the threshold
gg = plot([thresh,thresh], [0,0.5], 'k--', 'LineWidth', 1.5);
gg = plot([40,thresh], [0.5,0.5], 'k--', 'LineWidth', 1.5);

% Colored markers to indicate which sections are shown in the subplot below
plot(40, 0, 'xk', 'MarkerSize',15, 'LineWidth',3);
plot(80, 0, 'x', 'Color', [1,0.65,0], 'MarkerSize',15, 'LineWidth',3);
plot(thresh, 0.5, 'xg', 'MarkerSize',15, 'LineWidth',3);
plot(140, 1, 'xm', 'MarkerSize',15, 'LineWidth',3);

% Labels and ticks
leg=xlabel('Stimulus Distance d','FontSize',fontSize);
ylabel(sprintf('Probability of\nbimodal Distribution'),'FontSize',fontSize)
set(gca,'xtick', [40,80,round(thresh),140], 'FontSize', fontSize);
set(gca,'ytick', [0,0.5,1], 'FontSize', fontSize);
set(gca, 'linewidth', boxwidth);
temp = get(gca, 'Position');
set(gca, 'Position', temp + [0,0.05,0,-0.05]);

hold off 



%------------------------
% RIGHT field response  -
%------------------------
ax = subplot(5,4,10);

% Simulate the field
rng(std_seed);
%params.w_inh = 1.57;
params.inp_diff = 80;
field = sim(params);
data = getData(field.field, params.n_command_on);

% Plot the field response
plot(data, 'Color', [1,0.65,0], 'LineWidth', 1.5);
% Plot the stimulus markers
hold on;
plot([params.inp_pos,params.inp_pos], [-10,10], 'k');
plot([params.inp_pos-params.inp_diff, params.inp_pos-params.inp_diff], ylim(), 'k');
hold off;
ylim([-10,10]);
xlim([0,500]);

set(gca,'xtick', []);
set(gca,'ytick', []);
set(gca, 'linewidth', boxwidth);
temp = get(ax, 'Position');
temp = temp + [0,-0.075 ,added_plotwidth, added_plotheight];
annotation('textbox', temp, 'String', 'd = 80', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize);
set(gca, 'Position', temp);



%------------------------------------
% UNIMODAL field response RIGHT (2 stims) -
%------------------------------------
ax = subplot(5,4,11);

% Simulate the field
rng(std_seed+3);
%params.w_inh = 1.57;
params.inp_diff = 114;
field = sim(params);
data = getData(field.field, params.n_command_on);

% Plot the field response
plot(data,'g', 'LineWidth', 1.5);
% Plot the stimulus markers
hold on;
plot([params.inp_pos,params.inp_pos], [-10,10], 'k');
plot([params.inp_pos-params.inp_diff, params.inp_pos-params.inp_diff], ylim(), 'k');
hold off;
ylim([-10,10]);
xlim([0,500]);
set(gca,'xtick', []);
set(gca,'ytick', []);
set(gca, 'linewidth', boxwidth);
temp = get(ax, 'Position');
temp = temp + [0,0.02 ,added_plotwidth, added_plotheight];
annotation('textbox', temp, 'String', ['d = ' num2str(round(thresh))], 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize);
set(gca, 'Position', temp);




%------------------------------------
% UNIMODAL field response LEFT (2 stims) -
%------------------------------------
ax = subplot(5,4,19);

% Simulate the field
rng(std_seed+9);
%params.w_inh = 1.57;
params.inp_diff = 114;
field = sim(params);
data = getData(field.field, params.n_command_on);

% Plot the field response
plot(data,'g', 'LineWidth', 1.5);
% Plot the stimulus markers
hold on;
plot([params.inp_pos,params.inp_pos], [-10,10], 'k');
plot([params.inp_pos-params.inp_diff, params.inp_pos-params.inp_diff], ylim(), 'k');
hold off;
ylim([-10,10]);
xlim([0,500]);
set(gca,'xtick', []);
set(gca,'ytick', []);
set(gca, 'linewidth', boxwidth);
temp = get(ax, 'Position');
temp = temp + [0,-0.02 ,added_plotwidth, added_plotheight];
set(gca, 'Position', temp);



%------------------------
% LEFT field response
%------------------------
ax = subplot(5,4,18);

% Simulate the field
rng(std_seed+30);
%params.w_inh = 1.57;
params.inp_diff = 80;
field = sim(params);
data = getData(field.field, params.n_command_on);

% Plot the field response
plot(data,'Color', [1,0.65,0], 'LineWidth', 1.5);
% Plot the stimulus markers
hold on;
plot([params.inp_pos,params.inp_pos], [-10,10], 'k');
plot([params.inp_pos-params.inp_diff, params.inp_pos-params.inp_diff], ylim(), 'k');
hold off;
ylim([-10,10]);
xlim([0,500]);
set(gca,'xtick', []);
set(gca,'ytick', []);
temp = get(ax, 'Position');
temp = temp + [0,0.075 ,added_plotwidth, added_plotheight];
set(gca, 'Position', temp);
set(gca, 'linewidth', boxwidth);
title('right OR left', 'FontSize', fontSize);



%------------------------
% BIMODAL field response (2 stims)
%------------------------
ax = subplot(5,4,15);
% Simulate the field
rng(std_seed+4);
%params.w_inh = 1.57;
params.inp_diff = 114;
field = sim(params);
data = getData(field.field, params.n_command_on);

% Plot the field response
plot(data,'g', 'LineWidth', 1.5);
% Plot the stimulus markers
hold on;
plot([params.inp_pos,params.inp_pos], [-11,10], 'k');
plot([params.inp_pos-params.inp_diff, params.inp_pos-params.inp_diff], [-11,10], 'k');
hold off;
ylim([-11,10]);
xlim([0,500]);
set(gca,'xtick', []);
set(gca,'ytick', []);
temp = get(ax, 'Position');
temp = temp + [0,0 ,added_plotwidth, added_plotheight];
plotsize = temp;
set(gca, 'Position', temp);
set(gca, 'linewidth', boxwidth);
title('one OR two', 'FontSize', fontSize);



%------------------------
% FUSED response
%------------------------
ax = subplot(5,4,13);

% Simulate the field
rng(std_seed+39);
%params.w_inh = 1.57;
params.inp_diff = 40;
field = sim(params);
data = getData(field.field, params.n_command_on);

% Plot the field response
plot(data, 'k', 'LineWidth', 1.5);
% Plot the stimulus markers
hold on;
plot([params.inp_pos,params.inp_pos], [-10,10], 'k');
plot([params.inp_pos-params.inp_diff, params.inp_pos-params.inp_diff], ylim(), 'k');
hold off;

set(gca,'xtick', [0, 500]);
ylim([-10,10]);
xlim([0,500]);
set(gca,'ytick', [-10 , 10]);
temp = get(ax, 'Position');
annotation('textbox', temp + [0,0.03,0,0], 'String', 'd = 40', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize);
set(gca, 'Position', [temp(1), temp(2), plotsize(3), plotsize(4)]);
set(gca, 'linewidth', boxwidth);
title('Always one', 'FontSize', fontSize);
xlabel('Unit Position');



%------------------------
% ALWAYS BIMODAL response
%------------------------
ax = subplot(5,4,16);

% Simulate the field
rng(std_seed);
%params.w_inh = 1.57;
params.inp_diff = 140;
field = sim(params);
data = getData(field.field, params.n_command_on);

% Plot the field response
plot(data, 'm', 'LineWidth', 1.5);
% Plot the stimulus markers
hold on;
plot([params.inp_pos,params.inp_pos], [-10,10], 'k');
plot([params.inp_pos-params.inp_diff, params.inp_pos-params.inp_diff], ylim(), 'k');
hold off;

set(gca,'xtick', []);
set(gca,'ytick', []);
ylim([-10,10]);
xlim([0,500]);
temp = get(ax, 'Position');
annotation('textbox', temp + [0,0.03,0,0], 'String', 'd = 140', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize);
set(gca, 'Position', [temp(1), temp(2), plotsize(3), plotsize(4)]);
set(gca, 'linewidth', boxwidth);
title('Always two', 'FontSize', fontSize);


% Subpart captions
annotation('textbox', [0.041, 0.9, .1, .1], 'String', 'a', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize+6);
annotation('textbox', [0.041, 0.55, .1, .1], 'String', 'b', 'LineStyle','none', 'FontWeight', 'bold', 'FontSize', fontSize+6);



target_file = matlab.desktop.editor.getActiveFilename;
target_file = fileparts(target_file); % Extracts the folder

set(gcf,'paperunits','centimeters','paperposition',[0 0 30 25]);
print([target_file '/figure2.png'],'-dpng','-r600')
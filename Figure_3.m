figure();


ax = gca; 
fontSize = 16;

%temp = get(ax, 'Position');
%temp = temp + [0,0.05 ,0, 0];
%set(ax, 'Position', temp);


range = 0:1:150;

%rng(std_seed+1);
% % Uncomment this if you want to re-calculate the data
%arr = paramsArray(params, 'inp_diff', range);
%[data_2pd_plot_figure3_bim, std_2pd_plot_figure3_bim] = scanParamsArray(arr, 30, @decide2PointSRDx5);
%rng(std_seed+1);
%arr = paramsArray(params, 'inp_diff', range);
%[data_2pd_plot_figure3_WTA, std_2pd_plot_figure3_WTA] = scanParamsArray(arr, 30, @decideWTA);

% Plot the data    
[l_BIM, p] = boundedline(range,data_2pd_plot_figure3_bim, std_2pd_plot_figure3_bim ./ 30, 'b');
outlinebounds(l_BIM,p);
set(l_BIM,'LineWidth', 2) 
hold on;
[l_WTA, p] = boundedline(range,data_2pd_plot_figure3_WTA, std_2pd_plot_figure3_WTA ./ 30, 'g');
outlinebounds(l_WTA,p);
set(l_WTA,'LineWidth', 2) 

% Lines indicating the threshold
gg = plot([112,112], [-0.1,0.5], 'k--', 'LineWidth', 1.5);
gg = plot([00,112], [0.5,0.5], 'k--', 'LineWidth', 1.5);

% Labels and ticks
leg=xlabel('Stimulus Distance','FontSize',fontSize);
ylabel(sprintf('Probability'),'FontSize',fontSize)
set(gca,'xtick', [0,50,100,112,150], 'FontSize', fontSize);
set(gca,'ytick', [0,0.5,1], 'FontSize', fontSize);
set(gca, 'linewidth', 1.5);
temp = get(gca, 'Position');
set(gca, 'Position', temp + [0,0.05,0,-0.05]);

legend([l_BIM, l_WTA], 'Bimodal distribution', 'Winner-take-all','Location','northwest');

ylim([-0.1 1.1]);

hold off 

target_file = matlab.desktop.editor.getActiveFilename;
target_file = fileparts(target_file); % Extracts the folder

set(gcf,'paperunits','centimeters','paperposition',[0 0 25 15]);
print([target_file '/figure3.png'],'-dpng','-r600')
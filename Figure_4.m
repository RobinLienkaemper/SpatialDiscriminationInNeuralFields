fig = figure();

% Data is in robin-workspace
% This would be the overall data!
overall_data = data_2pd_overall_sblock;

x2 = [0, 0.7, 1, 1.3, 1.6, 1.9, 2.2, 2.5];


%y2 = [0,0,12.5,50,62.5,100,100,100] / 100; % Data hardcopied for testing

% Calculate mean and STD of 2PD data
dat_mean = mean(overall_data') / 100;
dat_std = std(overall_data') / 100;
% Turn STD into SEM
dat_std = dat_std / sqrt(length(overall_data));

hold on;
%fill([x2, fliplr(x2)], [dat_mean-dat_std, fliplr(dat_mean+dat_std)], 'm', ...
%    'FaceAlpha', 0.2, 'EdgeColor', 'm', 'EdgeAlpha', 0.2);
%plot(x2, dat_mean, ...
%    'x', 'Color', 'm', 'LineWidth', 2, 'MarkerSize', 10);
scatter(x2, dat_mean, 100, 'm', 'x ', 'LineWidth', 1.5);
err = errorbar(x2, dat_mean, dat_std, 'vertical', 'LineStyle', 'none');
set(err, 'color', 'm', 'LineWidth', 1.5);

% Results are plotted by 'scanParamsArray', so the fit can just start:
ft = fittype('0.5 * tanh( a * ( x - b )) + 0.5',...
     'coefficient',{'a', 'b'}, 'independent','x');
    
fo = fitoptions(ft);
fo.StartPoint = [0.01, 100];
      
myfit = fit(x2', dat_mean', ft, fo);
coeffs = coeffvalues(myfit);
a = plot(myfit, 'm');
set(a, 'LineWidth', 1.5);
threshold = coeffs(2);
legend off;
 
 

ylim([-0.1, 1.1])

xticks(x2);
xlabel('Needle distance (cm)');
ylabel('');
%hold on;

ax1 = gca;
ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','left',...
    'YLim', [-0.1, 1.1], ...
    'Color','none');


params = p6;
range = 70:10:130;

std_seed = 598996453;
rng(std_seed+2);

arr = paramsArray(params, 'inp_diff', range);
[dat_mean, dat_std] = scanParamsArray(arr, 10, @decide2PointSRDx5);
dat_std = dat_std / 10;

hold on;
%fill([range, fliplr(range)], [(dat_mean-dat_std)', fliplr((dat_mean+dat_std)')], 'b', 'FaceAlpha', 0.2);
%plot(ax2, range, dat_mean, ...
%    '-x', 'Color', 'b', 'LineWidth', 2, 'MarkerSize', 10);
scatter(range, dat_mean, 100, 'b', 'x', 'LineWidth', 1.5);
err = errorbar(range, dat_mean, dat_std, 'vertical', 'LineStyle', 'none');
set(err, 'color', 'b', 'LineWidth', 1.5);

hold on
%plot(ax2, 80:10:140, data_2pd_plot_figure4, ...
    %'-x', 'Color', 'b', 'LineWidth', 2, 'MarkerSize', 10);
% ylim([-0.1, 1.1])
% xlabel(ax2, 'Stimulus distance (units)');
% ylabel(sprintf('Probability of \n perceiving two stimuli'));

% Results are plotted by 'scanParamsArray', so the fit can just start:
ft = fittype('0.5 * tanh( a * ( x - b )) + 0.5',...
     'coefficient',{'a', 'b'}, 'independent','x');
    
fo = fitoptions(ft);
fo.StartPoint = [0.01, 100];
      
myfit = fit((range)', dat_mean, ft, fo);
coeffs = coeffvalues(myfit);
a = plot(myfit, 'b');
set(a, 'LineWidth', 1.5);
threshold = coeffs(2);

legend off;
hold off;

ylim([-0.1, 1.1])
xlabel(ax2, 'Stimulus distance (units)');
ylabel(sprintf('Probability of \n perceiving two stimuli'));

box on;
set(gca, 'linewidth', 1.5);


target_file = matlab.desktop.editor.getActiveFilename;
target_file = fileparts(target_file); % Extracts the folder

set(gcf,'paperunits','centimeters','paperposition',[0 0 20 15]);
print([target_file '/figure4.png'],'-dpng','-r600');
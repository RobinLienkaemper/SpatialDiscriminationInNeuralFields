function plot2PD_Lok( Xdata, Ydata, sem, start )
%PLOT2PD_LOK Plots 2PD-plot and Localization-plot in one figure

figure();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             2PD plot              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(1,2,1);

% Basic fitting
[z, ~, ~] = polyfit(Xdata',Ydata(:,1),1);
p1 = polyfit(Xdata',Ydata(:,1),1);
y1 = polyval(p1, Xdata);

% Plot data
aa = plot(Xdata, Ydata(:,1), '.-');
set(aa, 'LineWidth', 2);
set(aa, 'MarkerSize', 18);

% Plot fit
hold on;
bb = plot (Xdata, y1);
set(bb, 'LineWidth', 2);
set(bb, 'Color', 'r');
hold off;


% Titles and Captions
annotation('textbox', [0.15,0.2,0.26,0.1],...
           'String', ['y = ' num2str(p1(1)) 'x + ' num2str(p1(2))]);
xlabel('Parameter');
ylabel('2PD-Threshold');

xlim([min(Xdata) max(Xdata)]);
% ylim([100, 130]);

x = [ start ];
lim = get(gca,'YLim');
h = arrayfun(@(x) line([x x],lim),x);
set(h, 'Color', 'g');

legend off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Localization plot           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(1,2,2);

% Basic fitting
[z, ~, ~] = polyfit(Xdata',Ydata(:,2),1);
p2 = polyfit(Xdata',Ydata(:,2),1);
y2 = polyval(p2,Xdata);

confplot(Xdata, Ydata(:,2), sem, sem, 'LineWidth', 2, 'MarkerSize', 18);

% Plot fit
hold on;
bb = plot (Xdata, y2);
set(bb, 'LineWidth', 2);
set(bb, 'Color', 'r');
hold off;

% Titles and Captions
annotation('textbox', [0.59,0.2,0.26,0.1],...
           'String', ['y = ' num2str(p2(1)) 'x + ' num2str(p2(2))]);    
xlabel('Parameter');
ylabel('Maxima-distance');

% ylim([0.8, 4]);
xlim([min(Xdata) max(Xdata)]);

x = [ start ];
lim = get(gca,'YLim');
h = arrayfun(@(x) line([x x],lim),x);
set(h, 'Color', 'g');

legend off;
end


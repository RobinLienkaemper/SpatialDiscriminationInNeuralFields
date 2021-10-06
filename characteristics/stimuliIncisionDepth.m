function res = stimuliIncisionDepth(field)
% Calculates the incision Depth of the combined stimulus curve

    field = cleanField(field);
    
    params  = field.params;

    % Some internatlizations
    n_fieldsize     =   params.n_fieldsize;  

    % Get data
    com_input= 	1*gauss(n_fieldsize-1, params.inp_pos, params.inp_str, params.inp_sig, params.inp_inh) ...
                + 1.*gauss(n_fieldsize-1, params.inp_pos - params.inp_diff, params.inp_str, params.inp_sig, params.inp_inh); 
    
    data = com_input;
    
    % Get left and right input position and calculate the middle
    inpR      = params.inp_pos;
    inpL      = params.inp_pos - params.inp_diff;
    inpMiddle = inpR - ((inpR - inpL) / 2);
    
    % Get left and right peak position   
    [YpeakL, XpeakL]     = max(data(1:floor(inpMiddle)+1));
    [YpeakR, XpeakR]     = max(data(ceil(inpMiddle)+1:(n_fieldsize-1)));
        % Fix coordinate shift for right peaks x value
    XpeakR               = XpeakR + ceil(inpMiddle);

    % Get the field data between peaks
    dataBetweenPeaks = data(XpeakL:XpeakR);
    
    % PeakLow is the lowest value in dataBetweenPeaks:
    [YpeakLow, XpeakLow] = min(dataBetweenPeaks);
    
        % Fix coordinate shift again
    XpeakLow             = XpeakLow + inpL;
    
    % Calculate difference between mean peak height and peakLow
    res = mean([YpeakL, YpeakR]) - YpeakLow;
    
%      figure();
%      plot(data, 'k');
%      hold on;
%      plot([XpeakL], [YpeakL], 'r--*');
%      plot([XpeakR], [YpeakR], 'r--*');
%    
%    X = (1:length(dataBetweenPeaks))';
%    % Set dataBetweenPeaks to 0 so gaussfit doesnt react strange
%    dataBetweenPeaks = dataBetweenPeaks - max(dataBetweenPeaks);
%    Y = dataBetweenPeaks';    
%    [fittyMimBart, gof] = fit(X, Y, 'poly2');
%    gof.sse
%    figure();
%    plot(dataBetweenPeaks, 'k');
%    hold on;
%     plot(fittyMimBart);
%    hold off;
%     xlabel('time');
%     ylabel('u(x)');
%    % For plotting: Vertical line positions
%    x = [ inpMiddle+1 ];
%    % get vertical lines height
%    lim = get(gca,'YLim');
%    % draw lines
%    h = arrayfun(@(x) line([x x],lim),x);
%    hold off;

end
% Returns the distance between stimulus input and neural activity peak

function res = decideLocalization(field, doPlot)
   
    % Set doPlot to false if omitted
    if (~exist('doPlot', 'var'))
        doPlot = false;
    end
        
    res = ~(differenceLocalization(field, doPlot) > 1);
end
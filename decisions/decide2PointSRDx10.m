% Decides if neural activity at the end of stimulation has one or two peaks

function res = decide2PointSRDx10 (field)

    field = cleanField(field);
    
    params  = field.params;
    u_field = field.field;

    % Fit gaussian functions to data
    fits = fitGauss(params, u_field);
    
    % return false for one peak and true for two peaks
    
    res = fits(1).gof.sse >= 10 * fits(2).gof.sse;
    
%    if (bool)
%        res = 0;
%    else
%        res = 1;
%    end
end
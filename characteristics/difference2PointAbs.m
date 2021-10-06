% returns the difference of 1-gauss-fit and 2-gauss-fits error-values
function res = difference2PointAbs (field)
    
    field = cleanField(field);
    
    params  = field.params;
    u_field = field.field;
    
    % Fit gaussian functions to data
    fits = fitGauss(params, u_field);
    
    res = fits(1).gof.sse - fits(2).gof.sse;
end
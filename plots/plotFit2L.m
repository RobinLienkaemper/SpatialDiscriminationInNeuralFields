function res = plotFit2L (field)
    
    field = cleanField(field);

    params = field.params;
    fields = field.field;
    
    params.h_level = params.h_level_u;
    params.sig_exc = params.sig_u;
    
    ULayer = struct();
    ULayer.params = params;
    ULayer.field = fields.u;
    
    plotFit1L(ULayer);
    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end
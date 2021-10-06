% Calls the corresponding function for 1 or two layer simulations

function res = plotField(field)

    field = cleanField(field);

    if (field.params.layers == 1)
        plotField1L(field);
    elseif (field.params.layers == 2)
        plotField2L(field);
    end
    
    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end
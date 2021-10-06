function field = sim(params)

    if (~isfield(params, 'layers'))
        error('Invalid input: Pass a params structure!');
    end

    if (params.layers == 1)
        field = sim1L(params);
    elseif (params.layers == 2)
        field = sim2L(params);
    end
end
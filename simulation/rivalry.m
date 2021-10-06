function field = sim(params)

    if (~isfield(params, 'layers'))
        error('Invalid input: Pass a params structure!');
    end


    field = sim_rivalry(params);

    
end
function res = plotMesh1L(field)
   
    field = cleanField(field);

    params = field.params;
    u_field = field.field;

    n_fieldsize     =   params.n_fieldsize;
    n_timesteps     =   params.n_timesteps;
    
    figure;
    colormap(jet);
    brighten(0.5);
    view(-40,50);
    mesh(5:5:n_timesteps,5:5:n_fieldsize, u_field(5:5:n_timesteps,5:5:n_fieldsize)');
    Data = u_field(5:5:n_timesteps,5:5:n_fieldsize);
    Low = min(min(Data));
    High = max(max(Data));
    if (abs(Low) > abs(High))
        Range = abs(Low);
    else
        Range = abs(High);
    end
    set(gca, 'CLim', [(Range * -1), Range]);
    colorbar();
    xlabel('time');
    ylabel('parameter');
    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end
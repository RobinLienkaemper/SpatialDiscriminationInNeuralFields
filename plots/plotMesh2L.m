function res = plotMesh2L (field) 

    field = cleanField(field);

    params = field.params;
    fields = field.field;

    u_field         =   fields.u;
    v_field         =   fields.v;
    
    n_fieldsize     =   params.n_fieldsize;
    n_timesteps     =   params.n_timesteps;

    figure;
    subplot(2,1,1);
    colormap(jet);
    brighten(0.5);
    view(-40,50);
    mesh(5:5:n_timesteps,5:5:n_fieldsize, u_field(5:5:n_timesteps,5:5:n_fieldsize)');
    colorbar();
    title('U-Layer');
    xlabel('time');
    ylabel('parameter');
    
    subplot(2,1,2);
    colormap(jet);
    brighten(0.5);
    view(-40,50);
    mesh(5:5:n_timesteps,5:5:n_fieldsize, v_field(5:5:n_timesteps,5:5:n_fieldsize)');
    colorbar();
    title('V-Layer');
    xlabel('time');
    ylabel('parameter');
    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end
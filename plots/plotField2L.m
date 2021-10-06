function res = plotField2L(field)

    field = cleanField(field);

    params = field.params;
    fields = field.field;

    u_field = fields.u;
    v_field = fields.v;
    
    n_fieldsize     =   params.n_fieldsize;
    n_timesteps     =   params.n_timesteps;
    n_command_on    =   params.n_command_on;
    n_prerelax_steps=   params.n_prerelax_steps;
    beta            =   params.beta;
    threshold_u     =   params.threshold_u;

    hFig = figure();
    set(hFig, 'Position', [1000, 100, 500, 850]);

    subplot(4,1,1);
    aa = plot(1:n_fieldsize-1,u_field(n_timesteps,1:n_fieldsize-1),'y'); set(aa,'LineWidth',2);
    hold on;
    
    if (params.inp_count == 2)
        com_input       = 	1*gauss(n_fieldsize-1, params.inp_pos, params.inp_str, params.inp_sig, params.inp_inh) ...
                            + 1.*gauss(n_fieldsize-1,params.inp_pos - params.inp_diff, params.inp_str, params.inp_sig, params.inp_inh); 
    else
        com_input       = 	1*gauss(n_fieldsize-1,params.inp_pos, params.inp_str, params.inp_sig, params.inp_inh);
    end
    
    bb = plot(1:n_fieldsize-1,com_input(1:n_fieldsize-1),'r'); set(bb,'LineWidth',2);
    %cc = plot(1:n_fieldsize-1,pre_input(1:n_fieldsize-1),'g'); set(cc,'LineWidth',linewidth);
    %dd = plot(1:n_fieldsize-1,u_field(n_prerelax_steps,1:n_fieldsize-1),'k'); set(dd,'LineWidth',linewidth);
    ee = plot(1:n_fieldsize-1,u_field(n_command_on,1:n_fieldsize-1),'b'); set(ee,'LineWidth',2);
    %     plot(1:n_fieldsize-1,sigmoid(u_field(n_command_on,1:n_fieldsize-1),beta,0),'b-.');
    xlabel('parameter');
    ylabel('u(x)');
    title(' final state u (y), com (r), pre (g), u(end of com) (b)'); 
    hold off;

    subplot(4,1,2);
    colormap(jet);
    brighten(0.5);
    view(-40,50);
    imagesc(5:5:n_timesteps,5:5:n_fieldsize, u_field(5:5:n_timesteps,5:5:n_fieldsize)');

    Data = u_field(5:5:n_timesteps,5:5:n_fieldsize);   % Find highest absolute Value
    Low = min(min(Data));
    High = max(max(Data));

    if (abs(Low) > abs(High))
        Range = abs(Low);
    else
        Range = abs(High);
    end;

    set(gca, 'CLim', [(Range * -1), Range]);        % Set colorbar from -range to range 
    colorbar();
    xlabel('time');
    ylabel('parameter');

    subplot(4,1,3);
    aa = plot(1:n_fieldsize-1,v_field(n_timesteps,1:n_fieldsize-1),'y'); set(aa,'LineWidth',2);
    hold on;
    aa = plot(1:n_fieldsize-1,v_field(n_prerelax_steps,1:n_fieldsize-1),'k'); set(aa,'LineWidth',2);
    aa = plot(1:n_fieldsize-1,v_field(n_command_on,1:n_fieldsize-1),'b'); set(aa,'LineWidth',2);
    %     plot(1:n_fieldsize-1,sigmoid(u_field(n_command_on,1:n_fieldsize-1),beta,0),'b-.');
    xlabel('parameter');
    ylabel('v(x)');
    title(' final state v (y), v(end of com) (b)'); 
    hold off;

    subplot(4,1,4);
    colormap(jet);
    brighten(0.5);
    view(-40,50);
    imagesc(5:5:n_timesteps,5:5:n_fieldsize, v_field(5:5:n_timesteps,5:5:n_fieldsize)'); 

    Data = v_field(5:5:n_timesteps,5:5:n_fieldsize);
    Low = min(min(Data));
    High = max(max(Data));

    if (abs(Low) > abs(High))
        Range = abs(Low);
    else
        Range = abs(High);
    end;

    set(gca, 'CLim', [(Range * -1), Range]);        % Set colorbar from -range to range 
    colorbar();
    xlabel('time');
    ylabel('parameter')
    subplot(4,1,4);
    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end
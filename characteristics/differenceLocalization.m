function res = differenceLocalization( field, doPlot )

    field = cleanField(field);

    p       = field.params;
    u_field = field.field;

    % get data from sim() function if inp_diff isn't already 0
    if (p.inp_count > 1)
        p.inp_diff = 1;
        field = sim1L(p);
        u_field = field.field;
    end

    % Set doPlot to false if omitted
    if (~exist('doPlot', 'var'))
        doPlot = false;
    end
        
    n_fieldsize = p.n_fieldsize;
    n_command_on = p.n_command_on;
    
    % Get data
    data = u_field(n_command_on, 1:n_fieldsize-1)   ;
    data = u_field(500, 1:n_fieldsize-1);
    dataAct = data;
    dataAct(dataAct<0) = 0;
    
    options1 = fitoptions('gauss1');
    options1.Lower      =    [0 1 0];     % Lower boundaries
    options1.Upper      =    [inf 500 inf];
    
    mexhat = fit((1:n_fieldsize-1)' ,dataAct' ,'gauss1', options1);
    
%    mu is the mexhat's peak position
    %[xxx,mu] = max(dataAct); %
    mu = mexhat.b1;

    % plot data to show fit
    if (doPlot)
        figure();
      
        % plot data
        ee = plot(1:n_fieldsize-1,data,'b'); set(ee,'LineWidth',2);
        hold on;
        
        % plot fit
        plot(mexhat, 'r');
        
%        plot input
        inp = 1*gauss(p.n_fieldsize - 1, p.inp_pos, p.inp_str, p.inp_sig, p.inp_inh) ... 
              + 1.*gauss(p.n_fieldsize - 1, p.inp_pos, p.inp_str, p.inp_sig, p.inp_inh);
        plot(1:p.n_fieldsize, inp, 'g');
    
        % set some info
        title(' stimulus (green), fit (red), u(end of stim) (blue)'); 
        hold off;
    end
    
    
    % Like always, input position is shifted. This has to be fixed here
    % with a +1:
    res = abs(mu - (p.inp_pos + 1));
end


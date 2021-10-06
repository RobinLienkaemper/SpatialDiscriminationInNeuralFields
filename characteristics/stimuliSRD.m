function res = stimuliSRD( field )

    field = cleanField(field);
    
    params  = field.params;
    u_field = field.field;
    
    % Get data
    com_input= 	1*gauss(params.n_fieldsize-1, params.inp_pos, params.inp_str, params.inp_sig, params.inp_inh) ...
                + 1.*gauss(params.n_fieldsize-1, params.inp_pos - params.inp_diff, params.inp_str, params.inp_sig, params.inp_inh); 
    
    data = com_input;
    
    % Fit gaussian functions to data
    
    X = (1:params.n_fieldsize)';
    data = data';
    
    % Set initial guesses for 1-gauss-fit ---> !!!MAKES IT WORSE SOMEHOW!!!
    options1 = fitoptions('gauss1');
%    options1.StartPoint =    [max(max(data)) p.inp_pos p.sig_exc];           % Start values
    options1.Lower      =    [5 0 0];     % Lower boundaries
%    options1.Lower      =    [0 0 0];
      
    % Set initial guesses for 2-gauss-fit
    options2 = fitoptions('gauss2');
    options2.StartPoint =    [max(max(data)) params.inp_pos params.sig_exc max(max(data)) (params.inp_pos - params.inp_diff) params.sig_exc];
    options2.Lower      =    [0 0 0 0 0 0];
     
    % Fit and return structs
    [ fitty1, gof1] = fit(X ,data,'gauss1', options1); 
    [ fitty2, gof2] = fit(X ,data,'gauss2', options2);
    
    
    % return false for one peak and true for two peaks
    res =  abs(gof1.sse - gof2.sse);
end


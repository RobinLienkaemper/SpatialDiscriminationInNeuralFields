function res = fitGauss(p, u_field)

    n_fieldsize     =   p.n_fieldsize;
    n_command_on    =   p.n_command_on;    
    h               =   p.h_level;

    % Simulate a new field if u_plane is empty
    if (isempty(u_field))
         u_field = sim1L(p);
    end
    
    % Get data
    data = u_field(n_command_on, 1:n_fieldsize-1);
    % Delete data < 0 so the fitting routine doesn't detect negative peaks
    data(data<0) = 0;
    
    X = (1:n_fieldsize-1)';
    data = data';
    
    % Set initial guesses for 1-gauss-fit ---> !!!MAKES IT WORSE SOMEHOW!!!
    options1 = fitoptions('gauss1');
%    options1.StartPoint =    [max(max(data)) p.inp_pos p.sig_exc];           % Start values
    options1.Lower      =    [1 0 0];     % Lower boundaries
      
    % Set initial guesses for 2-gauss-fit
    options2 = fitoptions('gauss2');
    options2.StartPoint =    [max(max(data)) p.inp_pos p.sig_exc max(max(data)) (p.inp_pos - p.inp_diff) p.sig_exc];
    options2.Lower      =    [0 0 0 0 0 0];
     
    % Fit and return structs
    [res(1).fit, res(1).gof] = fit(X ,data,'gauss1', options1); 
    [res(2).fit, res(2).gof] = fit(X ,data,'gauss2', options2);
end

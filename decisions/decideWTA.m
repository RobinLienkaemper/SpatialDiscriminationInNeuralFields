% Decides if data shows a WTA. Returns true if it does, false if not

function res = decideWTA (field) 
    
    field = cleanField(field);
    
    p       = field.params;
    u_field = field.field;
    
    % Some internatlizations
    n_fieldsize     =   p.n_fieldsize;
    n_command_on    =   p.n_command_on;    
    
    % Get data
    data = u_field(n_command_on, 1:n_fieldsize-1);
   
    % Get neuronal activity at the peaks (the two input positions)
    peak1 = data(p.inp_pos);
    peak2 = data(p.inp_pos-p.inp_diff);
    
    % Return true if WTA was detected, false if not
    
    %res = (abs(abs(peak1 - peak2) > 5));
     res = (peak1 < peak2/2 || peak2 < peak1/2);
end
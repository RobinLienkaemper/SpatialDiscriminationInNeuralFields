function res = peakDistance(field)

    field = cleanField(field);

    params = field.params;
    u_field = field.field;
    
    % Some internatlizations
    n_fieldsize     =   params.n_fieldsize;
    n_command_on    =   params.n_command_on;    
    
    % Get data
    data = u_field(n_command_on, 1:n_fieldsize-1);
    
    % Get left and right input position and calculate the middle
    inpR      = params.inp_pos;
    inpL      = params.inp_pos - params.inp_diff;
    inpMiddle = inpR - ((inpR - inpL) / 2);
    
    % Get left and right peak position   
    [YpeakL, XpeakL]     = max(data(1:floor(inpMiddle)+1));
    [YpeakR, XpeakR]     = max(data(ceil(inpMiddle)+1:(n_fieldsize-1)));
        % Fix coordinate shift for right peaks x value
    XpeakR               = XpeakR + ceil(inpMiddle);
    
    % Calculate difference between peaks
    res = abs(XpeakR - XpeakL);
end
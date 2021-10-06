% Decides if a field has no positives values 

function res = decideDead(field)

    field = cleanField(field);
    
    params  = field.params;
    u_field = field.field;
    
    % Some internatlizations
    n_fieldsize     =   params.n_fieldsize;
    n_command_on    =   params.n_command_on;    
    
    % Get data
    data = u_field(n_command_on, 1:n_fieldsize-1);
    data = data + 1;
    base_activity = params.h_level;
    pos_activity = max(max(data));
    neg_activity = min(min(data));
    s = pos_activity + abs(neg_activity);
    
    % Return true if field is dead, false if not
    %if data(290) > mean(data) | data(300)>mean(data) | data(301)>mean(data) %pos_activity < 2.0)
    if (s < 4.0)
        res = 1; %field is dead
    else
        res = 0;
    end
        
%     % Return true if field is dead, false if not
%     if (isempty(data(data>0)))
%         res = 1;
%     else
%         res = 0;
%     end
end
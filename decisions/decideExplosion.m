% Decides if a field explodes (overall activity)

function res = decideExplosion(field)

    field = cleanField(field);
    
    params  = field.params;
    u_field = field.field;
    
    % Some internatlizations
    n_fieldsize     =   params.n_fieldsize;
    n_timesteps     =   params.n_timesteps;    
    
    % Get data -> final state!
    data = u_field(n_timesteps, 1:n_fieldsize-1);
    pos_activity = sum(data(data > 0));
    neg_activity = abs(sum(data(data < 0)));
    ratio = pos_activity/neg_activity;
        
    if (ratio > 1);
        res = 1;
    else
        res = 0;
    end
%     
%         % Return true if there are no negative values in final state
%     if (isempty(data(data<0)))
%         res = 1;
%     else
%         res = 0;
%     end
end
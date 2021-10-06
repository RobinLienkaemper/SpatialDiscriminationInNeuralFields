function res = decideType(field)

    field = cleanField(field);
    
    % Get decisions from 2point and WTA
  
   % WTA     =   decideWTA(field);
    point   =   decide2PointSRDx5(field);
    dead    =   decideDead(field);
    explode =   decideExplosion(field);
    
    % Create return values
    
    res = 1;  
    
    % Return 0 if field is DEAD (only negative values)
    if (dead)
        res = 0;
        return;
    end
   
    % if a field stimulated with two pints shows only one stimulus return 0
    
    if (~point)
        res = 0;
        return;
    end
    
%     % Return 1 if field shows ONE STIMULUS, but NO WTA and NO EXPLOSION
%     if (~point && ~WTA && ~explode)
%         res = 1;
%         return;
%     end
%     % Return 2 if field shows ONE STIMULUS and WTA, but NO EXPLOSION
%     if (~point && WTA && ~explode)
%         res = 2;
%         return;
%     end
%     % Return 3 if field shows TWO STIMULI, but NO EXPLOSION
%     if (point && ~explode)
%         res = 3;
%         return;
%     end
    % Return 4 id field EXPLODES
    if (explode)
        res = 0;
        return;
    end
    
    % Return 5 if SOMETHING STRANGE happend
     
end
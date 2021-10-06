function res = randomArray(template, size, stdDev, exceptionType, varargin) 
% Generates an array of params-Structures where parameters are chosen
% randomly according to a normal distribution of a given shape
    
    % INITIALIZE
        
    % This struct will hold all the fields that have to be randomized:
    randoms = {};
    
    % PROCESS DATA
    
    % If exceptionType is "only", add all the varagin fieldnames to randoms
    if (strcmp(exceptionType,'only')) 
        for i = 1:length(varargin)
            randoms = [randoms, varargin{i}];
        end
        
    % if exceptionType is "except", add all fields except of varargin
    elseif (strcmp(exceptionType,'except'))
        fields = fieldnames(template);
        for i = 1:numel(fields)
            if (~ismember(fields{i}, varargin))
                randoms = [randoms, fields{i}];
            end
        end
        
    % if illegal exceptionType was passed, throw error
    else
        error 'Pass "only" or "except" for exceptionType!';
    end

    
    % Catch special inputs:
    
    % if 'InteractionKernel' is passed, add all Interaction-Kernel-parameters to randoms
    if (ismember('InteractionKernel', varargin))
        randoms(ismember(randoms,'InteractionKernel')) = [];
        randoms = [randoms, 'w_exc', 'w_inh', 'sig_exc', 'sig_inh', 'w_inh_glob'];
    end
    % if 'input' is passed, add all input-parameters to randoms
    if (ismember('Input', varargin))
        randoms(ismember(randoms,'Input')) = [];
        randoms = [randoms, 'inp_diff', 'inp_sig', 'inp_str', 'inp_inh', 'inp_pos'];
    end
    % If "general" is passed, randomize SOME general params!
    if (ismember('General', varargin))
        randoms(ismember(randoms,'General')) = [];
        randoms = [randoms, 'h_level', 'threshold', 'tau', 'beta', 'noise_str'];
    end

    
    % Exclude some special cases when "except" was called
    
    if (strcmp(exceptionType,'except'))
        % NEVER randomize layers - leads to unprocessable param-structs!
        if (ismember('layers', randoms))
             randoms(ismember(randoms,'layers')) = [];
        end
        % NEVER randomize n_runs - must be an Integer!
        if (ismember('n_runs', randoms))
             randoms(ismember(randoms,'n_runs')) = [];
        end
        % NEVER EVER randomize UseSigNoNeg - must be a BOOLEAN!
        if (ismember('UseSigNoNeg', randoms))
             randoms(ismember(randoms,'UseSigNoNeg')) = [];
        end
    end
            
    
    % CREATE RANDOMIZED ARRAY
    template.arrayIndex = 0;
    
    % Loop size-times
    for i = size:-1:1
        % copy template
        result(i) = template;
        result(i).arrayIndex = i;
        fields = fieldnames(template);
        for j = 1:numel(fields)
            if (ismember(fields{j}, randoms))
                result(i).(fields{j}) = template.(fields{j}) + stdDev.*randn();
            end
        end
    end
    
    res = result;
end
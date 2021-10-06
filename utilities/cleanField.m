function cleanField = cleanField( field )

    % Check if function was called with empty arguments:
    if (isempty(field))
        cleanField = sim(stdParams1L());
        return;
    end

    % Check if "field" is a structure, throw error if not:
    if (~isstruct(field))
        error('Invalid input: Structure expected');
    end

    % If "field" already is a field structure, just return it again:
    if (length(fieldnames(field)) == 2 && isfield(field, 'params') && isfield(field, 'field'))
        cleanField = field;
    
    % Check if input is a structure-array
    elseif (isfield(field, 'layers'))
        % Return a new generated field:
        cleanField = sim(field);
        
    % If structure is something weird, just throw an error:
    else
        error('Invalid input: Pass a params- or field-strucutre!');
    end    
end


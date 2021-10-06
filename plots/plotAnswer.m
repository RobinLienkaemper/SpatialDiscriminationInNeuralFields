function res = plotAnswer( field )

    field = cleanField(field);
    
    plotAnswerAtTime(field, field.params.n_command_on);

    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end


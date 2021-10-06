function res = plotAnswerAtTime(field, time) 

    field = cleanField(field);
    
    % get Data
    data = getData(field.field, time);
    
    figure();

    % plot data
    aa = plot(1:field.params.n_fieldsize-1,data,'b'); 
    set(aa,'LineWidth',2);
    
    ylabel('U(x)');
    xlabel('parameter');
    
    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end
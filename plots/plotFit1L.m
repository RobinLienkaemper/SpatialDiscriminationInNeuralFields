function res = plotFit1L(field)

    field = cleanField(field);

    params = field.params;
    u_field = field.field;

    n_fieldsize     =   params.n_fieldsize;
    n_command_on    =   params.n_command_on;
    
    figure();

    % Get data
    data = u_field(n_command_on, 1:n_fieldsize-1);

    % plot data
    hold on;
    aa = plot(1:n_fieldsize-1,data,'b'); 
    set(aa,'LineWidth',2);

    res = fitGauss(params, u_field);
    % plot fits
    bb = plot(res(1).fit, 'g');
    set(bb,'LineWidth',2);
%    cc = plot(res(2).fit, 'r');
%    set(cc,'LineWidth',2);

    xlabel('Position');
    ylabel('Aktivierungslevel');
    title('gauss-fit (green), u(end of stim) (blue)'); 

    hold off;
    
    res(1).fit
    
    fprintf(['\t' '### square-Values ###' '\n' ...
        '\t' 'oneGauss: ' num2str(res(1).gof.sse) '\n' ...
        '\t' 'twoGauss: ' num2str(res(2).gof.sse) '\n' ...
        '\t' 'Difference: ' num2str(res(1).gof.sse-res(2).gof.sse) '\n'])
    % Return zeros if output args are requested
    for i = 1:nargout
        res(i) = 0;
    end
end

function res = mexHatIntersection (field) 
    % Returns the position of MexHats intersection **BETWEEN PEAKS**
    % "field" is unused

    field = cleanField(field);
    params  = field.params;
    
    n_fieldsize     =   params.n_fieldsize;

    % Kernel width stays the same, but ...
    kernel_width    = (n_fieldsize-1);
    inpR            = params.inp_pos;
    inpL            = params.inp_pos - params.inp_diff;
    
    % ... the different kernels get their own "kernel_center"
    int_kernelR     = gauss(kernel_width, inpR, params.w_exc, params.sig_exc, params.w_inh_glob) + gauss(kernel_width, inpR, params.w_inh, params.sig_inh, 0); 
    
    int_kernelL     = gauss(kernel_width, inpL, params.w_exc, params.sig_exc, params.w_inh_glob) + gauss(kernel_width, inpL, params.w_inh, params.sig_inh, 0); 

    % Calculate match of the functions between peaks
    dataBetweenPeaksR = int_kernelR(inpL:inpR);
    dataBetweenPeaksL = int_kernelL(inpL:inpR);
    
    dataR = interp1(1:numel(dataBetweenPeaksR), dataBetweenPeaksR, 1:0.001:params.inp_diff);
    dataL = interp1(1:numel(dataBetweenPeaksL), dataBetweenPeaksL, 1:0.001:params.inp_diff);
    
    match = find(dataR == dataL);
    res   = dataR(match);
    if (isempty(res))
        res = 0;
    end
    
    %%%% JUST PLOTTING FOR DEBUG %%%%%%
%     figure();
%     plot(dataR, 'b');
%     hold on
%     plot(dataL, 'g');
%     plot(match, dataR(match), 'r*');
%     hold off
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
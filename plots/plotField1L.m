function res = plotField1L(field)

    field = cleanField(field);

    params  = field.params;
    u_field = field.field;

    n_fieldsize     =   params.n_fieldsize;
    n_timesteps     =   params.n_timesteps;
    n_command_on    =   params.n_command_on;
    
    figure; 
    % Plot input, end of stim usw. as graphs
     subplot(3,1,1);
     aa = plot(1:n_fieldsize-1,u_field(n_timesteps,1:n_fieldsize-1),'y'); set(aa,'LineWidth',2);
     hold on;
     line([0 ; 200],[0 ; 0]);   % add horizontal line at zero
     
     if (params.inp_count == 2)
         com_input       = 	1*gauss(n_fieldsize-1, params.inp_pos, params.inp_str, params.inp_sig, params.inp_inh) ...
                             + 1.*gauss(n_fieldsize-1,params.inp_pos - params.inp_diff, params.inp_str, params.inp_sig, params.inp_inh); 
     else
         com_input       = 	1*gauss(n_fieldsize-1,params.inp_pos, params.inp_str, params.inp_sig, params.inp_inh);
     end
     
     bb = plot(1:n_fieldsize-1,com_input(1:n_fieldsize-1),'r'); set(bb,'LineWidth',2);
     %cc = plot(1:n_fieldsize-1,pre_input(1:n_fieldsize-1),'g'); set(cc,'LineWidth',linewidth);
 	%dd = plot(1:n_fieldsize-1,u_field(n_prerelax_steps,1:n_fieldsize-1),'k'); set(dd,'LineWidth',linewidth);
     ee = plot(1:n_fieldsize-1,u_field(n_command_on,1:n_fieldsize-1),'b'); set(ee,'LineWidth',2);
 	
     xlabel('parameter');
     ylabel('u(x)');
     title(' final state u (yellow), com (red), u(end of stim) (blue)'); 
     hold off;
  
      % Plot field
      subplot(3,1,2);
      colormap(jet);
      brighten(0.5);
      view(-40,50);
      imagesc(5:5:n_timesteps,5:5:n_fieldsize, u_field(5:5:n_timesteps,5:5:n_fieldsize)');
      Data = u_field(5:5:n_timesteps,5:5:n_fieldsize);   % Find highest absolute Value
      Low = min(min(Data));
      High = max(max(Data));
      if (abs(Low) > abs(High))
          Range = abs(Low);
      else
          Range = abs(High);
      end;  
      set(gca, 'CLim', [(10 * -1), 10]);
      set(gca, 'CLim', [(Range * -1), Range]);        % Set colorbar from -range to range 
      colorbar();
      xlabel('Time');
      ylabel('Position');
    
     % Plot interaction kernel
     subplot(3,1,3);
     kernel_width=(n_fieldsize-1);
     kernel_center=kernel_width/2;
     int_kernel=gauss(kernel_width, kernel_center, params.w_exc, params.sig_exc, (-1 * params.w_inh_glob)) + gauss(kernel_width, kernel_center, (-1 * params.w_inh), params.sig_inh, 0); 
     ii=plot(-1 * (n_fieldsize - 1) / 2 :  (n_fieldsize - 1) / 2, int_kernel);
     ylabel(num2str(sum(int_kernel)/200.));set(ii,'LineWidth',2);

end
function fields = sim2L(params) 

    if (~isfield(params, 'layers'))
        error('Invalid input: Pass a params structure!');
    end

    n_runs              =   params.n_runs;                          % number of runs at identical parameters (for statistics)
    n_timesteps         =   params.n_timesteps;                     % number of total time steps of integration
    n_prerelax_steps    =   params.n_prerelax_steps;                % of these, number of time steps in first prerelaxation time window
    n_command_on        =   params.n_command_on;                    % of n_timesteps, time up to which the command input is one 
    n_fieldsize         =   params.n_fieldsize;


    % global model parameters
    tau_u               =   params.tau_u;
    tau_v               =   params.tau_v;
    h_v_level           =   params.h_level_v;	
    h_u_level           =   params.h_level_u;
    beta                =   params.beta;
    threshold_u         =   params.threshold_u;
    threshold_v         =   params.threshold_v;
    threshold_VintoU    =   params.threshold_VintoU;
    noise_strength      = 	params.noise_str; 

    % interaction kernel
    sigma_u             =   params.sig_u;
    sigma_v             =   params.sig_v;

    kernel_width_u      =   (n_fieldsize-1);                        % must be even
    kernel_center_u     =   kernel_width_u/2;                       % /2
    kernel_width_v      =   (n_fieldsize-1);                        % must be even
    kernel_center_v     =   kernel_width_v/2;                       % /2

    w_exite_u           =   params.w_excite_u;                                    
    w_inhomo_inhib      =   params.w_inhomo_inhib;                                   
    w_homo_inhib        =   params.w_homo_inhib;
    strength_uv_input   =   params.strength_uv_input;               % modulates strength of U input to V field

    int_kernel_u        =   gauss(kernel_width_u,kernel_center_u,1,sigma_u,0); 
    int_kernel_v        =   gauss(kernel_width_v,kernel_center_v,1,sigma_v,0);

    % command input kernel
    h_shift             =   0;                                      %2 (no threshold piercing without com when pre_strength=4)
    com_strength        =   params.inp_str;
    com_pos             =   params.inp_pos;    
    com_diff            =   params.inp_diff;
    com_sigma           =   params.inp_sig;
    com_inhib           =   params.inp_inh;
    if (params.inp_count == 2)
        com_input       = 	1*gauss(n_fieldsize-1,com_pos,com_strength,com_sigma,com_inhib) ...
                            + 1.*gauss(n_fieldsize-1,com_pos-com_diff,com_strength,com_sigma,com_inhib); 
    else
        com_input       = 	1*gauss(n_fieldsize-1,com_pos,com_strength,com_sigma,com_inhib);
    end

    % preshape input kernel: u field	
    pre_strength        =   0.0;

    
    
    
    
    
    
    %Seb changed:2; %1.2 %4
    pre_pos(1)=80; pre_pos(2)=100; pre_pos(3)=com_pos;
    pre_sigma=10;
    pre_inhib=0;
    pre_input = gauss(n_fieldsize-1,pre_pos(1),pre_strength,pre_sigma,pre_inhib);
    % pre_input = pre_input+ gauss(n_fieldsize-1,pre_pos(2),pre_strength,pre_sigma,pre_inhib);
    pre_input = pre_input+ gauss(n_fieldsize-1,pre_pos(3),pre_strength,pre_sigma,pre_inhib);

    % field initialization etc. 
    u_max=zeros(1,n_runs);
    v_max=zeros(1,n_runs);
    u_max_pos=zeros(1,n_runs);	 
    threshold_times=zeros(1,n_runs);	  
    u_field=zeros(n_timesteps,n_fieldsize)+h_u_level;
    v_field=zeros(n_timesteps,n_fieldsize)+h_v_level;
    u_convolved = zeros(1,n_fieldsize+kernel_width_u);
    v_convolved = zeros(1,n_fieldsize+kernel_width_v);
    time_threshold = zeros(1,n_runs);
    time__under_threshold_pos1=zeros(1,n_runs);


    % loop through runs 
    for num = 1:n_runs

    % 	h_level=-2+0.02*num
        % loop through time 
        for time = 2:n_timesteps
          %randn('seed',100) % to reproduce time series
          stoch_force=noise_strength*randn(1,n_fieldsize);

           % switch to change equation in different epochs 
           if time < n_prerelax_steps+1  % first time window: pre-relaxation without input
            current_com_input=0; 
            current_pre_input=pre_input;
           elseif time< n_command_on     % second time window: relaxation with "command" input on
            current_com_input=com_input; 
            current_pre_input=pre_input;
            %h_v_level=-2;
           else 						 % third time window: relaxation with second "command" input on
                                         % (can be no input at all)                        
            %current_com_input=com_input_2; 
            current_com_input=0; 
            %current_pre_input=0;
            current_pre_input=pre_input;
            %h_v_level=-3;
           end

           u_past = u_field(time-1,1:n_fieldsize);
           v_past = v_field(time-1,1:n_fieldsize);

           % attach half of field on each side for convolution; sigmoid, convolution
           u_conv(1,1:kernel_width_u/2) = u_past(n_fieldsize-kernel_width_u/2+1:n_fieldsize);     
           u_conv(1,kernel_width_u/2+1:n_fieldsize+kernel_width_u/2) =u_past(1:n_fieldsize);
           u_conv(1,n_fieldsize+kernel_width_u/2+1:n_fieldsize+kernel_width_u) = u_past(1,1:kernel_width_u/2);
           
           if (params.UseSigNoNeg) 
               f_u_conv=sigmoidNoNeg(u_conv,beta,threshold_u);
           else
               f_u_conv=sigmoid(u_conv,beta,threshold_u);
           end
           
           convolved_u_field=conv(f_u_conv,int_kernel_u); 

           v_conv(1,1:kernel_width_v/2) = v_past(n_fieldsize-kernel_width_v/2+1:n_fieldsize);     
           v_conv(1,kernel_width_v/2+1:n_fieldsize+kernel_width_v/2) =v_past(1:n_fieldsize);
           v_conv(1,n_fieldsize+kernel_width_v/2+1:n_fieldsize+kernel_width_v) = v_past(1,1:kernel_width_v/2);
           
           if (params.UseSigNoNeg) 
               f_v_conv=sigmoidNoNeg(v_conv,beta,threshold_v);
           else
               f_v_conv=sigmoid(v_conv,beta,threshold_v);
           end
           
           convolved_v_field=conv(f_v_conv,int_kernel_v);
           
           if (params.UseSigNoNeg) 
                total_inhib=sum(sigmoidNoNeg(v_past,beta,threshold_VintoU));
           else
               total_inhib=sum(sigmoid(v_past,beta,threshold_VintoU));
           end
           
           % equation
              u_field(time,1:n_fieldsize) = u_past(1:n_fieldsize) + ( ...
                  - u_past(1:n_fieldsize)  ...
                  + w_exite_u*convolved_u_field(1,kernel_width_u+1:n_fieldsize+kernel_width_u) ... 
                  + h_u_level + current_pre_input + current_com_input ...
                  - w_homo_inhib*total_inhib ...
                  - w_inhomo_inhib*convolved_v_field(1,kernel_width_v+1:n_fieldsize+kernel_width_v))/tau_u ...
                  + stoch_force;   
              v_field(time,1:n_fieldsize) = v_past(1:n_fieldsize) + ( ...
                  - v_past(1:n_fieldsize)  ...
                  + h_v_level + strength_uv_input*convolved_u_field(1,kernel_width_u+1:n_fieldsize+kernel_width_u) ... 
                  )/tau_v ...
                  + stoch_force;

            % detect max and store 			  
            u_max(time)=max(u_field(time,1:n_fieldsize)); 
            v_max(time)=max(v_field(time,1:n_fieldsize)); 
            % threshold piercing
            %if u_max(time-1) < threshold_u & u_max(time) >= threshold_u
             %   time_threshold(1,num)=time;
             %end
            if time > n_prerelax_steps & u_max(time-1) < threshold_u & u_max(time) >= threshold_u
               time_threshold(1,num)=time;
             end    

                    % detect max and store 			  
            u_pos_1(time)=max(u_field(time,pre_pos(1))); 
            % threshold piercing
            if u_pos_1(time-1) > threshold_u & u_pos_1(time) <= threshold_u
                time__under_threshold_pos1(1,num)=time;
            end
            u_pos_3(time)=max(u_field(time,pre_pos(3))); 
            % threshold piercing
            if u_pos_3(time-1) < threshold_u & u_pos_3(time) >= threshold_u
                time_threshold_pos3(1,num)=time;
            end
            %if u_max=max(u_field(time,1:n_fieldsize))
             %   time_max(1,num)=time;
                %end

            % max detection, threshold piercing etc. 
            % if max(u(t-1,1:nx)) < TH & max(u(t,1:nx)) >= TH
            %	TH_tmp(1,num)=t;		     end; 
            % h_max(1,num)=max(u(t,1:nx));
            % [h_max(1,num),h_I(1,num)]=max(u(t,1:nx)); 
            % if TH_tmp(1,num) > 0 ,break,end

        end % time
    end
    
    % Return values
    field      =   struct();
    field.u    =   u_field;
    field.v    =   v_field;
    
    fields.params = params;
    fields.field  = field;
end
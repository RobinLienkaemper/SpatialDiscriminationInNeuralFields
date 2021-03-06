
% Simulates a one dimensional neural field and returns the neural activity

function field = sim1L(params)

if (~isfield(params, 'layers'))
    error('Invalid input: Pass a params structure!');
end

% Amari field for multisensory fusion September 2000 adjusted from Amari_stat by Gregor Schoner
n_runs          =   params.n_runs;				% number of runs at identical parameters (for statistics)
n_timesteps     =   params.n_timesteps;         % number of total time steps of integration
n_prerelax_steps=   params.n_prerelax_steps;    % of these, number of time steps in first prerelaxation time window
n_command_on    =   params.n_command_on;        % of n_timesteps, time up to which the command input is one 

%stimtime = params.stimtime    % time how long to apply stimulus   exp: 800ms
%breaktime = params.breaktime  % time how long to break between stimuli exp: 0 - x ms

n_fieldsize     =   params.n_fieldsize;		


% global model param
tau             =   params.tau;	
h_level         =   params.h_level; 
beta            =   params.beta;
threshold_u     =   params.threshold;
noise_strength  =   params.noise_str; 


% interaction kernel
sigma_ex        =   params.sig_exc;
sigma_inh       =   params.sig_inh;

kernel_width    =   (n_fieldsize-1);            % must be even
kernel_center   =   kernel_width/2; 

w_exite         =   params.w_exc;
w_inhib_global  =   -1 * params.w_inh_glob;     % FIX: sim2L uses a positive value, so this one should accept positive values, too
w_inhib_specific=   -1 * params.w_inh;          % FIX: sim2L uses a positive value, so this one should accept positive values, too
    
int_kernel=gauss(kernel_width,kernel_center,w_exite,sigma_ex,w_inhib_global) + gauss(kernel_width,kernel_center,w_inhib_specific,sigma_inh,0); 
ex_kernel = gauss(kernel_width,kernel_center,w_exite,sigma_ex,w_inhib_global);
inh_kernel = gauss(kernel_width,kernel_center,w_inhib_specific,sigma_inh,0);


% Stimulus
com_strength    =   params.inp_str;
com_pos         =   params.inp_pos; 
com_diff        =   params.inp_diff;
com_sigma       =   params.inp_sig;
com_inhib       =   params.inp_inh;

if (params.inp_count == 2)
    com_input       = 	1*gauss(n_fieldsize-1,com_pos,com_strength,com_sigma,com_inhib) ...
                        + 1.*gauss(n_fieldsize-1,com_pos-com_diff,com_strength,com_sigma,com_inhib); 
else
    com_input       = 	1*gauss(n_fieldsize-1,com_pos,com_strength,com_sigma,com_inhib);
end

com_input_2     = 	0.*gauss(n_fieldsize-1,com_pos+20,com_strength,com_sigma,com_inhib); 


% preshape input kernel
pre_strength    =   params.pre_str;
pre_pos(1)      =   params.pre_pos1;
pre_pos(2)      =   params.pre_pos2;
pre_pos(3)      =   params.pre_pos3;
pre_sigma       =   params.pre_sig;
pre_inhib       =   params.pre_inh;

pre_input       =   gauss(n_fieldsize-1,pre_pos(1),pre_strength,pre_sigma,pre_inhib);
pre_input       =   pre_input+ gauss(n_fieldsize-1,pre_pos(2),pre_strength,pre_sigma,pre_inhib);
pre_input       =   pre_input+ gauss(n_fieldsize-1,pre_pos(3),pre_strength,pre_sigma,pre_inhib);

% field initialization etc. 
u_max           =   zeros(1,n_runs);	    
u_max_pos       =   zeros(1,n_runs);	 
threshold_times =   zeros(1,n_runs);	  
u_field         =   zeros(n_timesteps,n_fieldsize)+h_level;
u_convolved     =   zeros(1,n_fieldsize+kernel_width);
syneff          =   zeros(1,n_fieldsize);
int_kernel = ex_kernel + inh_kernel;

% loop through runs 
for num = 1:n_runs
	
	% loop through time 
	for time = 2:n_timesteps
      %randn('seed',100) % to reproduce time series
      stoch_force=noise_strength*randn(1,n_fieldsize);
	  
	   % switch to change equation in different epochs 
       if time < n_prerelax_steps+1  % first time window: pre-relaxation without input
       	current_com_input=0; 
       elseif time< n_command_on     % second time window: relaxation with "command" input on
       	current_com_input=com_input; 
       else 						 % third time window: relaxation with second "command" input on
									 % (can be no input at all)
       	current_com_input=com_input_2;  
       end

       u_past = u_field(time-1,1:n_fieldsize);
		 
       % attach half of field on each side for convolution; sigmoid, convolution
       u_conv(1,1:kernel_width/2) = u_past(n_fieldsize-kernel_width/2+1:n_fieldsize);     
       u_conv(1,kernel_width/2+1:n_fieldsize+kernel_width/2) =u_past(1:n_fieldsize);
       u_conv(1,n_fieldsize+kernel_width/2+1:n_fieldsize+kernel_width) = u_past(1,1:kernel_width/2);
       
       
       
       if (params.UseSigNoNeg) 
           f_u_conv = sigmoidNoNeg(u_conv,beta,threshold_u);
       else
           f_u_conv  =sigmoid(u_conv,beta,threshold_u);
       end
      
       
           
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%           
%       eff_factor = 0.003;
    
       
    
       convolved_field=conv(f_u_conv,int_kernel); 
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
       
       
       % equation
       u_field(time,1:n_fieldsize) = u_past(1:n_fieldsize) + ( ...
			  - u_past(1:n_fieldsize)  ...
			  + convolved_field(1,kernel_width+1:n_fieldsize+kernel_width) ... 
			  + h_level + pre_input + current_com_input ...
			  )/tau ...
			  + stoch_force;     

		% detect max and store 			  
   		u_max(time)=max(u_field(time,1:n_fieldsize)); 

		% max detection, threshold piercing etc. 
		% if max(u(t-1,1:nx)) < TH & max(u(t,1:nx)) >= TH
        %	TH_tmp(1,num)=t;		     end; 
        % h_max(1,num)=max(u(t,1:nx));
        % [h_max(1,num),h_I(1,num)]=max(u(t,1:nx)); 
        % if TH_tmp(1,num) > 0 ,break,end
              
	end % time
			 
end % runs 

field.params = params;
field.field  = u_field;

end % function
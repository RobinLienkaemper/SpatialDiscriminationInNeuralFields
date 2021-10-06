function out = stdParams1L()
     
    % Initialize standard values
    SimParams1L = struct();
    
    % Number of layers
    SimParams1L.layers                      =   1;
    
    % Interaction kernel variables
    SimParams1L.InteractionKernelParams     = '-------------------------------------';
    SimParams1L.w_exc                       =   4;
    SimParams1L.w_inh                       =   3.6;
    SimParams1L.w_inh_glob                  =   0;
    SimParams1L.sig_exc                     =   15;
    SimParams1L.sig_inh                     =   30;
    
    % Input variables
    SimParams1L.InputParams                 = '-------------------------------------';
    SimParams1L.inp_count                   =   2;
    SimParams1L.inp_pos                     =   300;
    SimParams1L.inp_str                     =   10;
    SimParams1L.inp_sig                     =   5;
    SimParams1L.inp_inh                     =   0;
    SimParams1L.inp_diff                    =   30;
       
    % General variables
    SimParams1L.GeneralParams               = '-------------------------------------';
    SimParams1L.h_level                     =   -1;
    SimParams1L.threshold                   =   0;
    SimParams1L.tau                         =   10;
    SimParams1L.beta                        =   1.5;
    SimParams1L.noise_str                   =   0.3;
    
    SimParams1L.n_runs                      =   1;
    SimParams1L.n_timesteps                 =   1000;
    SimParams1L.n_prerelax_steps            =   100;
    SimParams1L.n_command_on                =   500;
    SimParams1L.n_fieldsize                 =   501;
    
    % Preshape variables
    SimParams1L.PreshapeParams               = '-------------------------------------';
    SimParams1L.pre_str                     =   0;
    SimParams1L.pre_sig                     =   10;
    SimParams1L.pre_inh                     =   0;
    SimParams1L.pre_pos1                    =   80;
    SimParams1L.pre_pos2                    =   100;
    SimParams1L.pre_pos3                    =   120;
    
    % Boolean Params
    SimParams1L.BooleanParams               = '-------------------------------------';
    SimParams1L.UseSigNoNeg                 =   true;
    
    
    out = SimParams1L;
end

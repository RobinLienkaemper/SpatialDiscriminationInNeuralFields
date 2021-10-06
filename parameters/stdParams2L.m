% Returns a global struct containing standard simulation params (1 layer)

function out = stdParams2L()
    
    % Initialize standard values
    SimParams2L = struct();
    
    % Number of layers
    SimParams2L.layers                      = 2;
    
    % Interaction kernel variables
    SimParams2L.InteractionKernelParams     = '-------------------------------------';
    SimParams2L.w_excite_u                  =   4;
    SimParams2L.w_inhomo_inhib              =   2.5;                                      
    SimParams2L.w_homo_inhib                =   0;                                         % Global inhib
    SimParams2L.sig_u                       =   20;
    SimParams2L.sig_v                       =   30;
    SimParams2L.strength_uv_input           =   1;
    
    % Input variables
    SimParams2L.InputParams                 = '-------------------------------------';
    SimParams2L.inp_count                   =   2;
    SimParams2L.inp_pos                     =   300;
    SimParams2L.inp_str                     =   10;
    SimParams2L.inp_sig                     =   5;
    SimParams2L.inp_inh                     =   0;
    SimParams2L.inp_diff                    =   30;
    
    % General variables
    SimParams2L.GeneralParams               = '-------------------------------------';
    SimParams2L.h_level_u                   =   -1;
    SimParams2L.h_level_v                   =   -1;
    SimParams2L.threshold_u                 =   0;
    SimParams2L.threshold_v                 =   0;
    SimParams2L.threshold_VintoU            =   0;
    SimParams2L.tau_u                       =   10;
    SimParams2L.tau_v                       =   10; 
    SimParams2L.beta                        =   1.5;
    SimParams2L.noise_str                   =   0.1;
    
    SimParams2L.n_runs                      =   1;
    SimParams2L.n_timesteps                 =   1800;
    SimParams2L.n_prerelax_steps            =   500;
    SimParams2L.n_command_on                =   1000;
    SimParams2L.n_fieldsize                 =   501;
    
    % Boolean Params
    SimParams2L.BooleanParams               = '-------------------------------------';
    SimParams2L.UseSigNoNeg                 =   true;
    
    out = SimParams2L;
end

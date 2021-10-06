%% Die params structure
% Zur Definition und Speicherung der Parameter, die für die Simulation neuronaler Felder benötigt werden,
% wird in der DFT-Toolbox eine Structure verwendet, die jedem Parameter ihren jeweiligen Zahlenwert zuordnet.

%% Verwendung
% Die Funktion <OV_parameter.html stdParams1L()> gibt eine params Structure
% (gefüllt mir Beispielparametern) für ein 1-Schicht-Modell aus:
%%
stdParams1L()
%% 
% Man beachte, das die Felder _InteractionKernelParams_, _InputParams_,
% _GeneralParams_ und _BooleanParams_ lediglich Trennzeichen zur Verbesserung der Lesbarkeit sind und keinerlei Verwendung innerhalb der Simulation haben.

%%
% Speichert man verschiedene Parameter-Structures in MatLab(R) Variablen,
% können diese unabhängig voneinander betrachtet, verändert und untersucht
% werden:

%%
params1 = stdParams1L();
params2 = stdParams1L();
%%
% Einzelne Werte innerhalb der Structure können über folgende Syntax
% angesteuert und verändert werden:
%%
params1.w_exc               % Gibt den Inhalt des Feldes "w_exc" aus. (In den Beispielparametern 4)
%%
params1.w_exc = 100;        % Setzt den Wert von "w_exc" auf 100.
params1.w_exc               % Gibt den neuen Wert aus
%%
% Das Entsprechende Feld in params2 ist von dieser Änderung nicht
% betroffen:
%%
params2.w_exc
%% Parameterbereiche
% Die DFT-Toolbox stellt Funktionen zur Verfügung, mit denen
% beliebig große Parameterbereiche untersucht werden können. Näheres hierzu
% unter <paramscans.html Parameter-Scans>
%% Verwendete Parameter (ein-Schicht-Modell)
% Die verwendeten Parameter definieren die folgenden Eigenschaften des
% Feldes:
%% Schichten
% * layers
%%
% Legt die Anzahl der Schichten fest (derzeit nur ein- und zwei-Schicht
% modelle unterstützt).

%% Interaktions-Kernel
% * w_exc
%%
% Gibt die "Stärke" der Excitation an.
%%
% * w_inh
%%
% Gibt die "Stärke" der spezifischen (= lateralen) Inhibition an.
%%
% * w_inh_glob
%%
% Gibt die "Stärke" der unspezifischen (= globalen) Inhibition an.
%%
% * sig_exc
%%
% Gibt die Breite der "excitatorischen" Gauss-Funktion an, die im
% interaction-kernel verwendet wird.
%%
% * sig_inh
%%
% Gibt die Breite der "inhibitorischen" Gauss-Funktion an, die im
% interaction-kernel verwendet wird.

%% Stimuli
% * inp_pos
%%
% Gibt die Position des Stimulus innerhalb des Feldes an.
%%
% * inp_str
%%
% Gibt die excitatorische Stärke des Stimulus an.
%%
% * inp_sig 
%%
% Gibt die "Breite" Des Stimulus an (Gauss-Funktion).
%%
% * inp_inh
%%
% Gibt die inhibitorische Stärke des Stimulus an.
%%
% * inp_diff  
%%
% Gibt die Distanz der Stimuli an.
%% Allgemeine Parameter
% * h_level
%%
% Legt das "resting Level", also die Aktivität im Ruhezustand, fest.
%%
% * threshold              
%%
% Legt die Aktivität fest, bei der ein Neuron aktiviert wird (per
% Konvention auf 0 festgeselegt).
%%
% * tau
%%
% Die Zeitkonstante
%%
% * beta
%%
% Die "Breite" der Sigmoidfunktion, die die neuronalen Interaktionen
% gewichtet.
%% 
% * noise_str
%%
% Die Stärke des Rauschens.
%% 
% * n_runs   
%% 
% Anzahl der Simulationsdurchläufe, deren Ergebnis gemittelt wird.
%%
% * n_timesteps 
%%
% Anzahl der Zeitschritte, über die das System simuliert wird.
%% 
% * n_prerelax_steps 
%%
% Anzahl Zeitschritte vor dem Einsetzen des Stimulus
%%
% * n_command_on 
%%
% Anzahl Zeitschritte, die der Stimulus andauert.
%%
% * n_fieldsize
%%
% Anzahl der Einheiten im System ( = Feldgröße).
%% Weitere Parameter
% * UseSigRob      
%%
% Gibt an, ob die angepasste Sigmoidfunktion verwendet werden soll, die
% Einheiten mit einer Aktivität unterhalb des thresholds keine Interaktion
% mit anderen Neuronen erlaubt. Wird dieser Wert auf "false" (in Matlab(R)
% gleichbedeutend mit 0) gesetzt, wird bei Simulationen mit diesem Parametersatz die ursprüngliche Sigmoide
% verwendet.
%% Anwendung zur Simulation
% Siehe <Simulationen.html Simulationen>
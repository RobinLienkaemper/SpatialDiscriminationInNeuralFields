%% Die params structure
% Zur Definition und Speicherung der Parameter, die f�r die Simulation neuronaler Felder ben�tigt werden,
% wird in der DFT-Toolbox eine Structure verwendet, die jedem Parameter ihren jeweiligen Zahlenwert zuordnet.

%% Verwendung
% Die Funktion <OV_parameter.html stdParams1L()> gibt eine params Structure
% (gef�llt mir Beispielparametern) f�r ein 1-Schicht-Modell aus:
%%
stdParams1L()
%% 
% Man beachte, das die Felder _InteractionKernelParams_, _InputParams_,
% _GeneralParams_ und _BooleanParams_ lediglich Trennzeichen zur Verbesserung der Lesbarkeit sind und keinerlei Verwendung innerhalb der Simulation haben.

%%
% Speichert man verschiedene Parameter-Structures in MatLab(R) Variablen,
% k�nnen diese unabh�ngig voneinander betrachtet, ver�ndert und untersucht
% werden:

%%
params1 = stdParams1L();
params2 = stdParams1L();
%%
% Einzelne Werte innerhalb der Structure k�nnen �ber folgende Syntax
% angesteuert und ver�ndert werden:
%%
params1.w_exc               % Gibt den Inhalt des Feldes "w_exc" aus. (In den Beispielparametern 4)
%%
params1.w_exc = 100;        % Setzt den Wert von "w_exc" auf 100.
params1.w_exc               % Gibt den neuen Wert aus
%%
% Das Entsprechende Feld in params2 ist von dieser �nderung nicht
% betroffen:
%%
params2.w_exc
%% Parameterbereiche
% Die DFT-Toolbox stellt Funktionen zur Verf�gung, mit denen
% beliebig gro�e Parameterbereiche untersucht werden k�nnen. N�heres hierzu
% unter <paramscans.html Parameter-Scans>
%% Verwendete Parameter (ein-Schicht-Modell)
% Die verwendeten Parameter definieren die folgenden Eigenschaften des
% Feldes:
%% Schichten
% * layers
%%
% Legt die Anzahl der Schichten fest (derzeit nur ein- und zwei-Schicht
% modelle unterst�tzt).

%% Interaktions-Kernel
% * w_exc
%%
% Gibt die "St�rke" der Excitation an.
%%
% * w_inh
%%
% Gibt die "St�rke" der spezifischen (= lateralen) Inhibition an.
%%
% * w_inh_glob
%%
% Gibt die "St�rke" der unspezifischen (= globalen) Inhibition an.
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
% Gibt die excitatorische St�rke des Stimulus an.
%%
% * inp_sig 
%%
% Gibt die "Breite" Des Stimulus an (Gauss-Funktion).
%%
% * inp_inh
%%
% Gibt die inhibitorische St�rke des Stimulus an.
%%
% * inp_diff  
%%
% Gibt die Distanz der Stimuli an.
%% Allgemeine Parameter
% * h_level
%%
% Legt das "resting Level", also die Aktivit�t im Ruhezustand, fest.
%%
% * threshold              
%%
% Legt die Aktivit�t fest, bei der ein Neuron aktiviert wird (per
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
% Die St�rke des Rauschens.
%% 
% * n_runs   
%% 
% Anzahl der Simulationsdurchl�ufe, deren Ergebnis gemittelt wird.
%%
% * n_timesteps 
%%
% Anzahl der Zeitschritte, �ber die das System simuliert wird.
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
% Anzahl der Einheiten im System ( = Feldgr��e).
%% Weitere Parameter
% * UseSigRob      
%%
% Gibt an, ob die angepasste Sigmoidfunktion verwendet werden soll, die
% Einheiten mit einer Aktivit�t unterhalb des thresholds keine Interaktion
% mit anderen Neuronen erlaubt. Wird dieser Wert auf "false" (in Matlab(R)
% gleichbedeutend mit 0) gesetzt, wird bei Simulationen mit diesem Parametersatz die urspr�ngliche Sigmoide
% verwendet.
%% Anwendung zur Simulation
% Siehe <Simulationen.html Simulationen>
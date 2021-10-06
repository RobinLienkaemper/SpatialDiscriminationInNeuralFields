%% Funktionsreferenz: simulation
% Der Ordner "simulation" der DFT-Toolbox enth�lt Funktionen, die f�r die
% Verarbeitung einer <paramsstruct.html Params-Structure> in eine
% <Simulationen.html field-Structure> ben�tigt werden.
%%
%% sim(params)
% Ruft (abh�ngig vom Feld "layers" der Parameterstructure) *sim1L(params)*
% oder *sim2L(params)* auf.
%
% *Input:*
%%
% * params:
%%
% Die zu verwendende Params-Structure
%%
% *Output:*
%%
% * field: 
%%
% Die field - Structure der Simulation. Siehe auch:
%    <Simulationen.html Simulationen>
%% sim1L(params)
% Simuliert ein ein-schicht-Modell mit den gegebenen Parametern und gibt
% die field-Structure aus.
%
% *Input:*
%%
% * params: 
%%
% Die zu verwendende Params-Structure
%%
% *Output:*
%%
% * field:
%%
% Die field - Structure der Simulation. Siehe auch:
% <Simulationen.html Simulationen>
%% sim2L(params)
% Simuliert ein zwei-schicht-Modell mit den gegebenen Parametern und gibt
% die field-Structure aus.
%
% *Input:*
%%
% * params:
%% 
% Die zu verwendende Params-Structure
%%
% *Output:*
%%
% * field:
%%
% Die field - Structure der Simulation. Siehe auch:
% <Simulationen.html Simulationen>
%%
% (Beachte: F�r zwei-Schicht
% Modelle enth�lt field.field keine Matrix, sondern eine Structure mit 2
% Matrizen)
%% sigmoid(x, beta, x0)
% Gibt den Funktionswert einer Sigmoide mit den charakteristika beta und x0
% an der Stelle x zur�ck.
%
% *Input:*
%%
% * x: 
%%
% Wert, dessen Funktionswert ermittelt werden soll
% beta: "Steigung" der Sigmoide
% x0: Wendepunkt der Sigmoide
%%
% *Output:*
%%
% * s:
%%
% Funktionswert der Sigmoide an der Stelle x
%% sigmoidNoNeg(x, beta, x0)
% Gibt den Funktionswert einer Sigmoide mit den charakteristika beta und x0
% an der Stelle x zur�ck, *gibt aber f�r alle Werte unterhalb von x0 den Wert 0 zur�ck!*
%
% *Input:*
%%
% * x:
%%
% Wert, dessen Funktionswert ermittelt werden soll
%%
% * beta:
%% 
% "Steigung" der Sigmoide
%%
% * x0:
%%
% Wendepunkt der Sigmoide
%%
% *Output:*
%%
% * s:
%%
% Funktionswert der Sigmoide an der Stelle x

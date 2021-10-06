%% Simulationen mit der DFT-Toolbox
% Die DFT-Toolbox ist darauf ausgelegt einfach und schnell
% neuronale-Feld-Simulationen durchzuf�hren, anzuzeigen und zu untersuchen.
% Der Kern dieser Funktionen ist die Simulation selbst, die hier
% beschrieben wird.

%% Festlegen der Simulationsparameter
% DFT-Toolbox Simulationen werden mit einer Structure aufgerufen, die alle
% notwendigen Parameter enth�lt. Vor der Simulation k�nnen diese Parameter
% beliebig angepasst werden. F�r Einzelheiten zum arbeiten mit Parametern
% siehe <paramsstruct.html Params-Structure>

%% Simulation durchf�hren
% Um eine Simulation durchzuf�hren muss die Funktion *sim()* mit der zu
% verwendenden Parameter-Structure aufgerufen werden:
%%
params = stdParams1L();
sim(params);
%%
% Die Funktion *sim()* w�hlt (abh�ngig vom Feld "layers" in der
% Parameterstructure) die jeweilige Simulationsfunktion f�r ein- bzw.
% zwei-schicht Modelle aus. Alternativ k�nnen direkt die Funktionen *sim1L()* und
% *sim2L()* verwendet werden. Die Parameterstructures sind jedoch _nicht
% kompatibel_! Der aufruf
%%
% sim2L(params);
%%
% f�hrt also zu einer Fehlermeldung. Die "transformation" eines
% Parametersatzes von einem ins andere Modell kann durch die Funktion
% *transformParams()* erreicht werden (derzeit nicht verf�gbar).
%% Die Field-Structure
% Das Ergebnis einer Simulation mit *sim()* ist eine Field-Structure mit
% genau zwei Eintr�gen: 

%%
sim(stdParams1L())
%%
% Diese Structure enth�lt f�r die weitere Verarbeitung des Ergebnisses 
% eine Kopie der verwendeten Parameter-Structure (im Feld params) und eine
% _timesteps_ x _fieldsize_ gro�e Matrix, die das gesamte simulierte
% Feld enth�lt. Eine auf diese Weise erstellte Field-Structure kann nun zur
% weiteren Untersuchung an andere Funktionen �bergeben werden. Das Feld
% kann <plotting.html geplottet> werden oder auf bestimmte
% <OV_characteristics.html charakteristika> hin untersucht werden.
% Die DFT-Toolbox bietet au�erdem Funktionen an, mit denen �ber bestimmte
% Zust�nde oder Eigenschaften des Feldes <OV_decisions.html entschieden> werden kann.
%%
% Beachte: Bei Simulationen mit zwei-Schicht-Modellen ist das Feld "field"
% der field-Structure keine Matrix, sondern eine weitere Structure, die zwei Matrizen
% enth�lt:
%%
foo = sim2L(stdParams2L())
bar = foo.field
%% Siehe auch
% Funktionsreferenz der Funktionen zum Thema <OV_simulation.html Simulation>
%%
% Einf�hrung in die <paramsstruct.html Parameterstructure>
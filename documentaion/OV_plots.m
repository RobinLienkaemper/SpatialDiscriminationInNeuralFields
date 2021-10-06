%% Funktionsreferenz: plots
% Der Ordner "plots" der DFT-Toolbox enth�lt Funktionen, die Abbildungen
% und Plots erstellen k�nnen, welche den Zustand und das Verhalten eines
% Feldes ersichtlich machen. Beispiele und Anwendungsm�glichkeiten dieser
% Funktionen sind in  <plotting.html "Plotting"> aufgelistet.
%% plotField(field)
% Erstellt einen Field-Plot von der �bergebenen  <simulationen.html field-structure>.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt geplottet werden soll.
%% plotField1L(field)
% Wird von *plotField()* aufgerufen, wenn die �bergebene field-structure
% zu einem ein-schicht-Modell geh�rt. Der direkte Aufruf erfolgt Analog zu
% *plotField()*.
%% plotField2L(field)
% Wird von *plotField()* aufgerufen, wenn die �bergebene field-structure
% zu einem ein-schicht-Modell geh�rt. Der direkte Aufruf erfolgt Analog zu
% *plotField()*.
%% plotFit(field)
% Plottet die Neuronenantwort zum Zeitpunkt _command on_ und n�hert diese
% durch eine bzw. zwei Gauss-Funktionen an. Die Funktion gibt zus�tzlich
% die Fehlerquadratwerde der Fits und deren Differenz aus.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt geplottet werden soll.
%% plotFit1L(field)
% Wird von *plotFit()* aufgerufen, wenn die �bergebene field-structure
% zu einem ein-schicht-Modell geh�rt. Der direkte Aufruf erfolgt Analog zu
% *plotFit()*.
%% plotFit2L(field)
% Wird von *plotFit()* aufgerufen, wenn die �bergebene field-structure
% zu einem ein-schicht-Modell geh�rt. Der direkte Aufruf erfolgt Analog zu
% *plotFit()*.
%% plotMesh(field)
% Erstellt ein dreidimensionales Bild des Feldes.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt geplottet werden soll.
%% plotMesh1L(field)
% Wird von *plotMesh()* aufgerufen, wenn die �bergebene field-structure
% zu einem ein-schicht-Modell geh�rt. Der direkte Aufruf erfolgt Analog zu
% *plotMesh()*.
%% plotMesh2L(field)
% Wird von *plotMesh()* aufgerufen, wenn die �bergebene field-structure
% zu einem ein-schicht-Modell geh�rt. Der direkte Aufruf erfolgt Analog zu
% *plotMesh()*.
%% fitGauss(params, u_field)
% F�hrt das ann�hern von ein- bzw. zwei Gauss-Funktionen durch und gibt die
% fit-Structures (-> curve-fitting-toolbox) zur�ck. Die Funktion wird z.B.
% von *plotFit()* aufgerufen, kann aber auch in eigenen Scripts verwendet
% werden.
%
% *Input:*
%%
% * params:
%%
% Die parameter-structure, die der Simulation zugrunde lag. Entspricht
% field.params einer field-structure.
%%
% * u_field:
%%
% Die Matrix mit Neuronenaktivit�ten die die Simulation ergeben hat. Entspricht
% field.field bei einer ein-Schicht field-structure bzw. field.field.u oder
% field.field.v bei zwei-Schicht-Modellen.
%% smoothData(data, windowSize)
% Gl�ttet die �bergebenen (X/Y-) Daten mithilfe eines Filter anpassbarer
% Gr��e.
%
% *Input:*
%%
% * data:
%%
% Die zu gl�ttenden Daten (eine zweidimensionale Verteilung).
%%
% * windowSize:
%%
% Die Fenstergr��e des Filters.
%%
% *Output:*
%%
% * smoothedData:
%%
% Eine Matrix mit den gegl�tteten Daten. Die Gr��e entspricht _data_.
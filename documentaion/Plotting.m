%% Plotting
% Zur (bildlichen) Darstellung neuronaler Feldsimulationen bietet die
% DFT-Toolbox verschiedene Funktionen und Darstellungsweisen an.
%% Feld-Plot
% Wird die Funktion <OV_plots.html plotField(field)> mit einer <Simulationen.html
% field-Structure> aufgerufen, erstellt sie die folgenden Abbildungen:
%%
params = stdParams1L();
field  = sim(params);
plotField(field);
%%
% Die obere Abbildung zeigt das den Zustand des Feldes am Ende der
% Betrachtungszeit (gelb), die Form der Stimuli (rot) sowie die Aktivit�t
% zum Zeitpunkt _command on_. 
%%
% Die mittlere Abbildung zeigt die Aktivit�t aller Einheiten (ordinate)
% �ber die gesamte Betrachtungszeit (abzisse). Die Aktivit�t der einzelnen
% Einheiten ist farblich kodiert (Farbcode im Feld rechts dargestellt).
%%
% Die untere Abbildung zeigt den Interaktionskernel.
%%
%%
% Der Feld-Plot eines zwei-Schicht-Modells unterscheidet sich leicht vom
% ein-Schicht-Modell, da hier die oberen beiden Abbildungen f�r beide
% Schichten vorkommen:
%%
params  = stdParams2L();
field   = sim(params);
plotField(field);
%%
%% Mesh-Plot
% Die Funktion <OV_plots.html plotMesh(field)> erlaubt es, das Feld als 3D-Mesh zu betrachten. Der Aufruf
% funktioniert analog zu <OV_plots.html plotField(field)>:
%%
params = stdParams1L();
field  = sim(params);
plotMesh(field);
%%
% Hier werden f�r 2-Schicht-Modelle auch zwei Meshes angezeigt.
%% Fit-Plot
% F�r einige <OV_characteristics.html characteristischen Werte> und
% <OV_decisions.html Entscheidungen> Wird die Neuronantwort durch eine bzw.
% zwei Gauss-Funktionen angen�hert. Um diesen Plot f�r eine bestimmte
% <Simulationen.html field-Structure> zu �berpr�fen kann die Funktion <OV_plots.html
% plotFit(field)> verwendet werden. Auch ihr Aufruf erfolgt mit der
% field-Structure als Argument:
%%
params = stdParams1L();
params.inp_diff = 50;        % Zur Veranschaulichung besser geeignet
field  = sim(params);
plotFit(field);
%%
% Hier ist die Neuronantwort zum Zeitpunkt _command on_ (analog zur blauen
% Kurve in plotField()) durch eine Gaussfunktion (gr�n) bzw. zwei
% Gauss-funktionen (rot) angen�hert.
%%
% Die Funktion *plotFit()* gibt zus�tzlich die
% Fehlerquadratwerte der beiden Fits sowie deren Differenz aus (zu sehen �ber der Grafik).
%% Siehe auch:
% Einf�hrung in die <simulationen.html Simulationen>
%%
% Funktionsreferenz der Funktionen zum Thema <OV_plots.html Plots>
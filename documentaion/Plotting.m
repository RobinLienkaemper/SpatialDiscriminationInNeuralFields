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
% Betrachtungszeit (gelb), die Form der Stimuli (rot) sowie die Aktivität
% zum Zeitpunkt _command on_. 
%%
% Die mittlere Abbildung zeigt die Aktivität aller Einheiten (ordinate)
% über die gesamte Betrachtungszeit (abzisse). Die Aktivität der einzelnen
% Einheiten ist farblich kodiert (Farbcode im Feld rechts dargestellt).
%%
% Die untere Abbildung zeigt den Interaktionskernel.
%%
%%
% Der Feld-Plot eines zwei-Schicht-Modells unterscheidet sich leicht vom
% ein-Schicht-Modell, da hier die oberen beiden Abbildungen für beide
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
% Hier werden für 2-Schicht-Modelle auch zwei Meshes angezeigt.
%% Fit-Plot
% Für einige <OV_characteristics.html characteristischen Werte> und
% <OV_decisions.html Entscheidungen> Wird die Neuronantwort durch eine bzw.
% zwei Gauss-Funktionen angenähert. Um diesen Plot für eine bestimmte
% <Simulationen.html field-Structure> zu überprüfen kann die Funktion <OV_plots.html
% plotFit(field)> verwendet werden. Auch ihr Aufruf erfolgt mit der
% field-Structure als Argument:
%%
params = stdParams1L();
params.inp_diff = 50;        % Zur Veranschaulichung besser geeignet
field  = sim(params);
plotFit(field);
%%
% Hier ist die Neuronantwort zum Zeitpunkt _command on_ (analog zur blauen
% Kurve in plotField()) durch eine Gaussfunktion (grün) bzw. zwei
% Gauss-funktionen (rot) angenähert.
%%
% Die Funktion *plotFit()* gibt zusätzlich die
% Fehlerquadratwerte der beiden Fits sowie deren Differenz aus (zu sehen über der Grafik).
%% Siehe auch:
% Einführung in die <simulationen.html Simulationen>
%%
% Funktionsreferenz der Funktionen zum Thema <OV_plots.html Plots>
%% Parameterscans
% Die DFT-Toolbox erlaubt das einfache "abscannen" festgelegter
% Parameterbereiche und die individuelle Auswertung der Daten. Die hierzu
% n�tigen Funktionen werden hier vorgestellt.
%% Parameter-Structure-Arrays
% Zum Abscannen von Parameterbereichen wird ein Array von
% <paramsstruct.html Parameterstructures> verwendet. Ein solches Array kann
% mit der Funktion <OV_parameter.html paramsArray()> erstellt werden. Diese
% Funktion erwartet eine "template"-structure, einen zu scannenden Parameter 
% und den Parameterbereich als Eingabe. Alle Eintr�ge
% des entstehenden Arrays werden sich nur im zu scannenden Parameter vom "template"
% unterscheiden. Bei jedem Eintrag wird dabei der zu scannende Parameter auf einen
% Wert des Parameterbereichs gesetzt.
%%
% Ausgehend vom Template
%%
params = stdParams1L();
%%
% kann so z.B. ein Array von Parameterstructures erstellt werden, deren
% Eintr�ge sich nur im Feld 'inp_diff' (Stimulusdistanz) von _params_ unterscheiden:
%%
array = paramsArray(params, 'inp_diff', 0:10)
%%
% Das Ergebnis ist ein Array mit 11 Parameter-structures mit aufsteigenden
% Stimulusdistanzen von 0 bis 10. Durch eine andere Formulierung des 
% Parameterbereichs kann auch die "Schrittweite" ver�ndert werden:
%%
array = paramsArray(params, 'inp_diff', 0:0.1:10)
%%
% gibt also 101 Parameter-structures zur�ck, bei denen die Stimulusdistanz
% von 0 ind 0,1-Schritten bis 10 ansteigt. Auch hier sind alle anderen
% Simulationsparameter identisch zu denen im "template".

%% Abscannen von Parameter-structure-Arrays
% Die Funktion <OV_parameter.html scanParamsArray()> verarbeitet ein Array
% von Parameters�tzen und Untersucht die Ergebnisse. Als Argumente erwartet
% die Funktion das zu untersuchende Array, die Anzahl an durchl�ufen pro
% Parameter-Structure und die Funktion, die das jeweilige Feld bewerten
% soll. 
%%
% Die Ordner "decisions" (siehe <OV_decisions.html Entscheidungen>) und
% "characteristics" (siehe <OV_characteristics.html Characteristische Werte>)
% stellen Funktionen zur Verf�gung, die jedem Feld eine Ma�zahl zuordnen,
% die auf seine Beschaffenheit schlie�en l�sst. In diesem Beispiel verwenden wir
% die Funktion <OV_characteristics.html peakDistance()>, die den Abstand
% der Maxima der Neuronenantwort berechnet. F�r genaue Beschreibungen aller
% m�glichen Funktionen siehe die Funktionsreferenz der jeweiligen Ordner.
%%
% Wir �bergeben der Funktion scanParamsArray also das Array _array_, die Anzahl
% durchl�ufe pro Array-Element _n_ und die Bewerterfunktion in Form eines
% functionhandlers (in MatLab(R) als "@function" definiert). Die Funktion
% simuliert nun _n_ mal pro Element von _array_ und �bergibt die
% entstehende <Simulationen.html field-Structure> an die Bewerterfunktion,
% deren (pro Durchlauf gemittelte) Antwort am Ende geplottet wird.
%%
array = paramsArray(params, 'inp_diff', 20:50);
scanParamsArray(array, 3, @peakDistance);
%%
% Die entstehende Figure zeigt nun die durchschnittliche Bewertung des
% Feldes (in diesem Fall durch *peakDistance()* ) in Abh�ngigkeit vom zu
% scannenden Parameter. Zus�tzlich gibt die Funktion noch eine Matrix
% zur�ck, die die durchschnittlichen Entscheidungswerte enth�lt (zur
% Erstellung von Wertetabellen oder weiterer Plots):
%%
ans
%%
% An *scanParamsArray()* k�nnen beliebig viele Bewerterfunktionen �bergeben
% werden. Alle �bergebenen Funktionen bewerten dabei _dieselben_ Felder.
% F�r jede Bewertungsfunktion wird am Ende ein eigener Plot erstellt.
%%
% Beachte: *scanParamsArray()* gibt bei zwei-Schicht-Modellen nur die
% "U"-Schicht (die excitatorische Schicht) an die Entscheidungsfunktion
% weiter.
%% M�gliche Bewertungsfunktionen
% Als Bewertungsfunktion akzeptiert *scanParamsArray()* jede Funktion, die mit
% einer field-structure als einziges Argument aufgerufen werden kann. Dies
% gilt insbesondere f�r alle Funktionen aus den Ordnern
% <OV_characteristics.html charakteristics()>, <OV_decisions.html decisions>
% und auch <OV_plots.html plot>, wobei letztere f�r jedes Feld die Bewertung
% "0" ausgeben, aber ihren entsprechenden Plot des derzeitigen Felds
% erstellen. 
%%
% Prinzipiell kann jede selbst erstellte Funktion, die das Schema 
%%
% function result = Bewertung(field)
%%
% erf�llt, als Bewerterfunktion verwendet werden.

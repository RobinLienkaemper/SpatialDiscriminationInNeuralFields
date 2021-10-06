%% Funktionsreferenz: decisions
% Der Ordner "decisions" der DFT-Toolbox enthält Funktionen die, unter
% Betrachtung bestimmter <OV_characteristics.html Maßzahlen>, eine
% Entscheidung über den Zustand eines Feldes treffen. Alle diese Funktionen
% liefern boolsche Werte zurück (in MatLab(R) als "0" für false und "1" für
% true definiert). 
%%
% Beachte: *decideType()* bildet hier eine Ausnahme.
%% decide2PointSRDx2(field)
% Entscheidet, ob die beiden Stimuli getrennt wahrnehmbar sind. Als
% Entscheidungsregel wird die Absolute Differenz der Fehlerwerte der
% Gauss-Fits verwendet. Die Stimuli gelten als trennbar, wenn der
% "ein-Gauss-Fit" einen *zwei mal so großen* Fehlerwert hat wie der "zwei-Gauss Fit".
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn die Reize getrennt wahrnehmbar sind, _false_ wenn
% nicht.
%% decide2PointSRDx5(field)
% Entscheidet, ob die beiden Stimuli getrennt wahrnehmbar sind. Als
% Entscheidungsregel wird die Absolute Differenz der Fehlerwerte der
% Gauss-Fits verwendet. Die Stimuli gelten als trennbar, wenn der
% "ein-Gauss-Fit" einen *fünf mal so großen* Fehlerwert hat wie der "zwei-Gauss Fit".
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn die Reize getrennt wahrnehmbar sind, _false_ wenn
% nicht.
%% decide2PointSRDx7(field)
% Entscheidet, ob die beiden Stimuli getrennt wahrnehmbar sind. Als
% Entscheidungsregel wird die Absolute Differenz der Fehlerwerte der
% Gauss-Fits verwendet. Die Stimuli gelten als trennbar, wenn der
% "ein-Gauss-Fit" einen *sieben mal so großen* Fehlerwert hat wie der "zwei-Gauss Fit".
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn die Reize getrennt wahrnehmbar sind, _false_ wenn
% nicht.
%% decide2PointSRDx10(field)
% Entscheidet, ob die beiden Stimuli getrennt wahrnehmbar sind. Als
% Entscheidungsregel wird die Absolute Differenz der Fehlerwerte der
% Gauss-Fits verwendet. Die Stimuli gelten als trennbar, wenn der
% "ein-Gauss-Fit" einen *zehn mal so großen* Fehlerwert hat wie der "zwei-Gauss Fit".
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn die Reize getrennt wahrnehmbar sind, _false_ wenn
% nicht.
%% decideDead(field)
% Entscheidet, ob das Feld "tot" ist, also trotz Stimulus keine
% überschwellige Aktivität zum Zeitpunkt zum Zeitpunkt _command on_ auftritt. 
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn das Feld "tot" ist, _false_ wenn
% nicht.
%% decideExplosion(field)
% Entscheidet, ob das Feld "explodiert", also am Ende der Betrachtungszeit
% jede Einheit eine überschwellige Aktivität aufweist.
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn das Feld "explodert", _false_ wenn
% nicht.
%% decideLocalization(field)
% Setzt die Druckpunktdistanz der Parameter auf "0" und simuliert (wenn
% nötig) danach neu. Untersucht wird der Abstand des Maximums der
% Neuronantwort von der Stimulusposition. Ein hoher Abstand weist darauf
% hin, dass der Usprungs des Stimulus nicht sehr genau lokalisiert werden
% kann.
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn die Lokalisation erfolgreich war, _false_ wenn
% nicht.
%% decideStimuliDivided(field)
% Entscheidet, ob die Stimuli vollständig trennbar sind, also (fast) keine
% Verschmelzung mehr aufweisen.
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn die Stimuli getrennt sind, _false_ wenn
% nicht.
%% decideWTA(field)
% Entscheidet, ob das Feld einen _winner-take-all_ Mechanismus aufweist.
% Hierzu wird die Funktion <OV_characteristics differenceWTAAbs()>
% aufgerufen.
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Eintscheidung. _true_ wenn ein _winner-take-all_ vorliegt, _false_ wenn
% nicht.
%% decideType(field)
% Kombiniert einige der Entscheiderfunktionen und teilt ein Feld somit in
% eine von fünf verschiedenen Kategorien ein (siehe "Output").
%%
% Beachte: Bis auf weiteres verwendet diese Funktion zur 2-Punkt-Diskrimination die Funktion
% *decide2PointSRDx5()*. Dies wird überarbeitet sobald eine bessere
% Entscheidungsregel verfügbar ist.
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * decision:
%%
% Die Kategorie, in die das Feld sich einordnen lässt:
%%
% * 1:
%%
% "Totes" Feld - trotz Stimulus keinerlei überschwellige Aktivität.
%%
% * 2:
%%
% "Verschmelzung" - Die Antwort auf beide Stimuli verschmilzt zu einem
% einzigen Aktivierungsberg.
%%
% * 3: 
%% 
% "WTA" - Nur ein Aktivierungsberg ist überschwellig, der zweite wurde
% unterdrückt (_winner-take-all_).
%%
% * 4:
%% 
% "Getrennte Stimuli" - Beide Stimuli erzeugen einen überschwelligen
% Aktivierungsberg.
%%
% * 5:
%%
% "Explosion" - Am Ende der Betrachtungszeit hat jede Einheit eine
% überschwellige Aktivität.
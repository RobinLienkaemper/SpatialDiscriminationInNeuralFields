%% Funktionsreferenz: characteristics
% Der Ordner "characteristics" der DFT-Toolbox enth�lt Funktionen, die
% jedem Feld (bzw. jeder <Simulationen.html field-Structure>) eine Ma�zahl
% zuordnen, die einen R�ckschluss auf Zustand, Aussehen und/oder Verhalten des
% Systems zulassen. Ihre h�ufigste Verwendung ist die als Bewerterfunktion
% in <paramscans.html Parameterscans>.
%% difference2PointAbs(field)
% N�hert die Neuronenantwort zum Zeitpunkt _command on_ durch eine oder
% zwei Gaussfunktionen an und gibt die *absolute* Differenz der
% Fehlerquadratwerte zur�ck.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * diff:
%%
% Die *absolute* Differenz der Fehlerwerte.
%% difference2PointRel(field)
% N�hert die Neuronenantwort zum Zeitpunkt _command on_ durch eine oder
% zwei Gaussfunktionen an und gibt die *relative* Differenz der
% Fehlerquadratwerte in zur�ck.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * diff:
%%
% Die *relative* Differenz der Fehlerwerte.
%% differenceWTAAbs(field)
% Berechnet die Differenz der Neuronenaktivit�ten an den beiden
% Stimuluspunkten. Ein hoher "H�henunterschied" der beiden Peaks weist auf
% einen _winner-take-all_ Mechanismus hin.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * diff:
%%
% Die *absolute* Differenz der Peaks.
%% incisionDepth(field)
% Berechnet die "Tiefe" des Einschnitts zwischen den beiden Maxima der
% Neuronantwort zum Zeitpunkt _command on_. Eine hohe Einschnitttiefe macht
% es wahrscheinlicher, dass die beiden Stimuli als getrennte Reize
% wahrgenommen werden.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * diff:
%%
% Die Einschnittiefe.
%% peakDistance(field)
% Berechnet den Abstand zwischen den beidem Maxima der Neuronanantwort zum
% Zeitpunkt _command on_.
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * diff:
%%
% Die *absolute* Entfernung der beiden Maxima voneinander.
%% stimuliIncisionDepth(field)
% Berechnet die Einschnitttiefe zwischen den beiden Stimuli. Je gr��er die
% Einschnitttiefe der Stimuli ist, desto weniger verschmolzen sind sie (und
% f�hren damit u.U. zu einer weniger Verschmolzenen Neuronenantwort).
%
% *Input:*
%%
% * field:
%%
% Die field-Structure, deren Inhalt bewertet werden soll.
%%
% *Output:*
%%
% * diff:
%%
% Die Einschnitttiefe zwischen den Stimuli.
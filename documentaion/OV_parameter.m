%% Funktionsreferenz: parameters
% Der Ordner "parameters" der DFT-Toolbox enthält Funktionen, die die
% Erstellung und Bearbeitung von <paramsstruct.html Parameterstrukturen>
% erlauben. 
%% paramsArray(template, toScan, range)
% Erstellt ein Array von Parameterstrukturen, die sich lediglich im Feld
% _toScan_ von _template_ unterscheiden und dort nacheinander alle Werte
% im Vektor _range_ annehmen. 
%
% *Input:*
%%
% * template:
%%
% Legt alle Parameter des Arrays bis auf _toScan_ fest.
%%
% * toScan:
%%
% der Parameter, in dem sich die Elemente des Arrays
% unterscheiden.
%%
% * range:
%% 
% Ein Vektor mit den Werten, die die Elemente des Ergebnis-Arrays
%    im feld _toScan_ haben sollen. Jedes Element des Arrays wird später im
%    Feld _toScan_ einen Wert aus diesem Array tragen. Dabei bleibt die
%    Reihenfolge von _range_ erhalten.
%%
% *Output:*
%%
% * arr:
%%
% Ein Array von Params-Structures. Benötigt für  <paramscans.html
% Parameterscans>.
%% scanParamsArray(array, runsPerParam, ...)
% Untersucht das übergebene Array von Parameterstrukturen. Jedes Element
% des Arrays wird _runsPerParam_ mal simuliert und jedes Feld an die
% Bewerterfunktionen übergeben. Die Ergebnisse werden pro Array-Element
% gemittelt. Siehe auch: <paramscans.html Parameterscans>. 
%%
% Beachte: Die Funktion gibt bei zwei-Schicht-Modellen *nur die
% excitatorische Schicht* an die Bewerterfunktion! 
%%
% *Input:*
%%
% * array:
%%
% Das zu Untersuchende Array von Parameterstructures.
%%
% * runsPerParam: 
%%
% Anzahl der durchläufe pro Parametersatz
%%
% * Weitere Argumente:
%% 
% Hier werden *ausschließlich* Functionhandler (@<funktionsname>)
% angenommen. Jedes simulierte Feld wird an jeden der Bewerterfunktionen
% übergeben und ihr Rückgabewert gespeichert und geplottet.
%% scanParamsArray1L(array, runsPerParam, ...)
% Wird von *scanParamsArray()* aufgerufen, wenn die übergebenen Parameter
% ein ein-schicht-Modell beschreiben. Der direkte Aufruf dieser Funktion
% erfolgt analog zu *scanParamsArray()*.
%%
%% scanParamsArray2L(array, runsPerParam, ...)
% Wird von *scanParamsArray()* aufgerufen, wenn die übergebenen Parameter
% ein zwei-schicht-Modell beschreiben. Der direkte Aufruf dieser Funktion
% erfolgt analog zu *scanParamsArray()*, die Funktion gibt bei aber zwei-Schicht-Modellen *nur die
% excitatorische Schicht* an die Bewerterfunktion! 
%%
%% stdParams()
% Diese Funktion wird meist infolge eines
% Tippfehlers aufgerufen. Sie gibt eine Fehlermeldung aus, die den Benutzer daran erinnert die Anzahl
% der Schichten festzulegen. Siehe: *stdParams1L()* und *stdParams2L()* für
% die korrekte Verwendung.
%% stdParams1L()
% Gibt Beispielparameter für ein ein-Schicht-Modell aus:
%%
stdParams1L()
%%
%% stdParams2L()
% Gibt Beispielparameter für ein zwei-Schicht-Modell aus:
%%
stdParams2L()
%%
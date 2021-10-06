%% Funktionsreferenz: parameters
% Der Ordner "parameters" der DFT-Toolbox enth�lt Funktionen, die die
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
%    im feld _toScan_ haben sollen. Jedes Element des Arrays wird sp�ter im
%    Feld _toScan_ einen Wert aus diesem Array tragen. Dabei bleibt die
%    Reihenfolge von _range_ erhalten.
%%
% *Output:*
%%
% * arr:
%%
% Ein Array von Params-Structures. Ben�tigt f�r  <paramscans.html
% Parameterscans>.
%% scanParamsArray(array, runsPerParam, ...)
% Untersucht das �bergebene Array von Parameterstrukturen. Jedes Element
% des Arrays wird _runsPerParam_ mal simuliert und jedes Feld an die
% Bewerterfunktionen �bergeben. Die Ergebnisse werden pro Array-Element
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
% Anzahl der durchl�ufe pro Parametersatz
%%
% * Weitere Argumente:
%% 
% Hier werden *ausschlie�lich* Functionhandler (@<funktionsname>)
% angenommen. Jedes simulierte Feld wird an jeden der Bewerterfunktionen
% �bergeben und ihr R�ckgabewert gespeichert und geplottet.
%% scanParamsArray1L(array, runsPerParam, ...)
% Wird von *scanParamsArray()* aufgerufen, wenn die �bergebenen Parameter
% ein ein-schicht-Modell beschreiben. Der direkte Aufruf dieser Funktion
% erfolgt analog zu *scanParamsArray()*.
%%
%% scanParamsArray2L(array, runsPerParam, ...)
% Wird von *scanParamsArray()* aufgerufen, wenn die �bergebenen Parameter
% ein zwei-schicht-Modell beschreiben. Der direkte Aufruf dieser Funktion
% erfolgt analog zu *scanParamsArray()*, die Funktion gibt bei aber zwei-Schicht-Modellen *nur die
% excitatorische Schicht* an die Bewerterfunktion! 
%%
%% stdParams()
% Diese Funktion wird meist infolge eines
% Tippfehlers aufgerufen. Sie gibt eine Fehlermeldung aus, die den Benutzer daran erinnert die Anzahl
% der Schichten festzulegen. Siehe: *stdParams1L()* und *stdParams2L()* f�r
% die korrekte Verwendung.
%% stdParams1L()
% Gibt Beispielparameter f�r ein ein-Schicht-Modell aus:
%%
stdParams1L()
%%
%% stdParams2L()
% Gibt Beispielparameter f�r ein zwei-Schicht-Modell aus:
%%
stdParams2L()
%%
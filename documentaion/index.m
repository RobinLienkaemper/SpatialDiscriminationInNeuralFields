%% Index
% Diese Dokumentation beschreibt alle Funktionen der DFT-Toolbox. 
%% How to start
% Um mit der DFT-Toolbox zu arbeiten, sollten sie sich zun�chst mit der
% grundlegenden Funktionsweise dieser Toolbox vertraut machen. Hierzu
% sollten sie die Artikel
%%
% <paramsstruct.html Die Params-Structure>
%%
% lesen und sich danach mit den 
%%
% <simulationen.html Simulationen mit der DFT-Toolbox>
%% 
% vertraut machen. 
%%
% Aufbauend darauf beschreiben die Artikel 
%%
% <plotting.html plotting> 
%%
% und
%%
% <paramscans.html Parameter-Scans>
%%
% weiterf�hrende Funktionen der Toolbox. Die Funktionsreferenzen der
% einzelnen Ordner dienen als Nachschlagwerk und liefern detailierte
% Informationen �ber alle verwendeten Funktionen.
%% Ordnerstruktur
% Die DFT-Toolbox besteht aus verschiedenen Ordnern, die jeweils Funktionen
% und Scripts einer Themengruppe enthalten.
%%
% * <OV_decisions.html decisions>
%%
% Enth�lt "Entscheiderfunktionen", die Anhand einer Ma�zahl �ber den
% Zustand eines Feldes entscheiden.
%%
% * <OV_characteristics.html characteristics>
%%
% Enth�lt Funktionen, die aus den Informationen eines Feldes bestimmte
% Ma�zahlen berechnen k�nnen, die einen R�ckschluss auf den Zustand des
% Feldes erlauben.
%%
% * <OV_plots.html plots>
%%
% Funktionen, mit denen verschiedene Abbildungen und Plots erstellt werden
% k�nnen um das Feld "in Bildform" zu betrachten.
%%
% * <OV_parameter.html parameters>
%%
% Enth�lt alle Funktionen die mit der Erstellung, Manupulation oder
% verarbeitung von Parametern und Parameterarrays zutun haben.
%%
% * <OV_simulation.html simulation>
%%
% Enth�lt die "Kernfunktionen" der Toolbox: Alles, was f�r die Umsetzung
% eines Parametersatzes in ein neuronales Feld n�tig ist.
%% 
% * <OV_utilities.html utilities>
%%
% Stellt einige n�tzliche Funktionen zur Verf�gung um wiederkehrende
% Abfragen oder Prozesse abzuk�rzen un zu standardisieren.
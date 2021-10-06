%% Index
% Diese Dokumentation beschreibt alle Funktionen der DFT-Toolbox. 
%% How to start
% Um mit der DFT-Toolbox zu arbeiten, sollten sie sich zunächst mit der
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
% weiterführende Funktionen der Toolbox. Die Funktionsreferenzen der
% einzelnen Ordner dienen als Nachschlagwerk und liefern detailierte
% Informationen über alle verwendeten Funktionen.
%% Ordnerstruktur
% Die DFT-Toolbox besteht aus verschiedenen Ordnern, die jeweils Funktionen
% und Scripts einer Themengruppe enthalten.
%%
% * <OV_decisions.html decisions>
%%
% Enthält "Entscheiderfunktionen", die Anhand einer Maßzahl über den
% Zustand eines Feldes entscheiden.
%%
% * <OV_characteristics.html characteristics>
%%
% Enthält Funktionen, die aus den Informationen eines Feldes bestimmte
% Maßzahlen berechnen können, die einen Rückschluss auf den Zustand des
% Feldes erlauben.
%%
% * <OV_plots.html plots>
%%
% Funktionen, mit denen verschiedene Abbildungen und Plots erstellt werden
% können um das Feld "in Bildform" zu betrachten.
%%
% * <OV_parameter.html parameters>
%%
% Enthält alle Funktionen die mit der Erstellung, Manupulation oder
% verarbeitung von Parametern und Parameterarrays zutun haben.
%%
% * <OV_simulation.html simulation>
%%
% Enthält die "Kernfunktionen" der Toolbox: Alles, was für die Umsetzung
% eines Parametersatzes in ein neuronales Feld nötig ist.
%% 
% * <OV_utilities.html utilities>
%%
% Stellt einige nützliche Funktionen zur Verfügung um wiederkehrende
% Abfragen oder Prozesse abzukürzen un zu standardisieren.
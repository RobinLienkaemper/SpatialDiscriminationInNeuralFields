%% Funktionsreferenz: utilities
% Der Ordner "utilities" der DFT-Toolbox enthält Funktionen um wiederkehrende
% Abfragen oder Prozesse abzukürzen un zu standardisieren.
%% cleanField(field)
% "Bereinigt" die inputs verschiedener Funktionen. Fast jede Funktion die
% eine field-Structure als input erwartet ruft als ersten Befehl
%%
field = cleanField(field);
%%
% auf. *cleanField()* prüft, ob das Argument einer Funktion eine params-structure
% anstatt einer field-structure
% ist und übergibt diese nötigenfalls an <OV_simulation.html sim()>.
% Für die Funktion *peakDistance(field)* kann so z.B. der "lange" Aufruf:
%%
peakDistance(sim(params));
%%
% ersetzt werden, da *peakDistance()* (dank *cleanField()*) auch
% eine params-Structure verarbeiten kann:
%%
peakDistance(params);
%%
% *sim(params)* wird also inenrhalb von *cleanField()* aufgerufen
% und gibt das Ergebnis an *peakDistance()* zurück.
%%
% *cleanField()* prüft zusätzlich, ob die entsprechende Funktion mit einem
% _leerwert_ (z.B. ein leeres Array ({}) oder ein leerer String  ('')  )
% aufgerufen wurde und setzt in diesem Fall *sim(stdParams1L())* als
% field-Structure ein. Der Ausdruck oben kann also für standardparameter noch
% weiter verkürzt werden:
%%
peakDistance('');
%%
% Entspricht dem vollständigen Aufruf mit einer field-structure und
% standard-parametern:
%%
peakDistance(sim(stdParams1L()));
%%
% Diese Funktion gibt entweder eine field-Structure zurück oder gibt
% einen Fehler aus, falls dies nicht möglicht ist. 
% *Input:*
%%
% * field:
%%
% Die zu prüfende Variable. Üblicherweise prüft diese Funktion die
% übergebenen Argumente anderer Funktionen auf ihre Beschaffenheit.
%%
% *Output:*
%%
% * cleanField:
%%
% Der Output ist auf jeden Fall eine field-Structure! War der input bereits
% eine field-structure, wird diese unverändert zurückgegeben. War der Input
% eine params-Structure, wird *sim(field)* zurückgegeben. War der Input ein
% Leerwert wird *sim(stdParams1L())* zurückggeben. Trifft keine dieser
% Bedingungen zu wirft die Funktion einen Fehler und bricht ab. 
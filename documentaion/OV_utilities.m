%% Funktionsreferenz: utilities
% Der Ordner "utilities" der DFT-Toolbox enth�lt Funktionen um wiederkehrende
% Abfragen oder Prozesse abzuk�rzen un zu standardisieren.
%% cleanField(field)
% "Bereinigt" die inputs verschiedener Funktionen. Fast jede Funktion die
% eine field-Structure als input erwartet ruft als ersten Befehl
%%
field = cleanField(field);
%%
% auf. *cleanField()* pr�ft, ob das Argument einer Funktion eine params-structure
% anstatt einer field-structure
% ist und �bergibt diese n�tigenfalls an <OV_simulation.html sim()>.
% F�r die Funktion *peakDistance(field)* kann so z.B. der "lange" Aufruf:
%%
peakDistance(sim(params));
%%
% ersetzt werden, da *peakDistance()* (dank *cleanField()*) auch
% eine params-Structure verarbeiten kann:
%%
peakDistance(params);
%%
% *sim(params)* wird also inenrhalb von *cleanField()* aufgerufen
% und gibt das Ergebnis an *peakDistance()* zur�ck.
%%
% *cleanField()* pr�ft zus�tzlich, ob die entsprechende Funktion mit einem
% _leerwert_ (z.B. ein leeres Array ({}) oder ein leerer String  ('')  )
% aufgerufen wurde und setzt in diesem Fall *sim(stdParams1L())* als
% field-Structure ein. Der Ausdruck oben kann also f�r standardparameter noch
% weiter verk�rzt werden:
%%
peakDistance('');
%%
% Entspricht dem vollst�ndigen Aufruf mit einer field-structure und
% standard-parametern:
%%
peakDistance(sim(stdParams1L()));
%%
% Diese Funktion gibt entweder eine field-Structure zur�ck oder gibt
% einen Fehler aus, falls dies nicht m�glicht ist. 
% *Input:*
%%
% * field:
%%
% Die zu pr�fende Variable. �blicherweise pr�ft diese Funktion die
% �bergebenen Argumente anderer Funktionen auf ihre Beschaffenheit.
%%
% *Output:*
%%
% * cleanField:
%%
% Der Output ist auf jeden Fall eine field-Structure! War der input bereits
% eine field-structure, wird diese unver�ndert zur�ckgegeben. War der Input
% eine params-Structure, wird *sim(field)* zur�ckgegeben. War der Input ein
% Leerwert wird *sim(stdParams1L())* zur�ckggeben. Trifft keine dieser
% Bedingungen zu wirft die Funktion einen Fehler und bricht ab. 
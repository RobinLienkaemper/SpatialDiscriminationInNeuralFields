% Scans a set of parameters and plots the decision specified by the
% decision maker function

function res = parallelScanParamsArray1L(paramsArr, runsPerParam, varargin)

% INITIALIZATION AND VARIABLE DECLARATION



% Define storage Arrays
X = 1:length(paramsArr);
storage = ones(numel(paramsArr), length(varargin));
deviations = ones(numel(paramsArr), length(varargin));

runResults = struct();
    
% IF PARAMSARR IS AN ARRAY OF PARAM-STRUCTURES:
    
    
    

    %Define filename for storing data
    k = 1;
    filename = ['Scan_' date '_' num2str(k) '.mat'];   
    while (exist(filename, 'file') == 2)
        k = k+1;
        filename = ['Scan_' date '_' num2str(k) '.mat'];  
    end

    % Find out which parameter changes in paramsArr
    names = fieldnames(paramsArr(1));
    for i = 1:length(names)
        if (paramsArr(1).(names{i}) ~= paramsArr(2).(names{i}))
            parameter = names{i};
        end
    end

    % Store additional function parameters from varargin
    addParams = cell(length(varargin),1);
    for j = 1:length(varargin)
        if iscell(varargin{j})
            addParams{j} = cell(length(varargin{j})-1, 1);
            for addParam = 2:length(varargin{j})
            	addParams{j}{addParam-1} = varargin{j}{addParam};
                varargin{j}{addParam} = [];
            end
        end
    end
    % Make cell-entrys in varargin a normal function-handler
    for j = 1:length(varargin)
        if iscell(varargin{j})
            varargin{j} = varargin{j}{1};
        end
    end
    
    
    
    % Set up worker pool
%    matlabpool;
    
    % Loop through params
    parfor i = 1:numel(paramsArr)
        % Save current parameter value for plotting
        X(i) = paramsArr(i).(parameter);
        
        % Create an empty matrix that'll be filled with decision values
        runResults = struct(); %ones(length(varargin), runsPerParam);
        
%        saver = struct();
        
        % loop through runs
        for run = 1:1:runsPerParam
            field = sim1L(paramsArr(i));
            
            % Save Field-Struct to "saver" Struct
%            varName = [parameter '__' genvarname(num2str(paramsArr(i).(parameter))) '__fieldnr__' num2str(run)];
%            saver.(varName) = field;
            
            % loop through decision makers
            for j = 1:length(varargin)
                if ~isempty(addParams{j})
                    runResults.(['d' num2str(j)])(run) = varargin{j}(field, addParams{j}{:});
                else
                    runResults.(['d' num2str(j)])(run) = varargin{j}(field);
                end
            end
        end
        
        % Write fields from this run to file
        if (i == 1) 
%            save(fullfile(pwd, filename), '-struct', 'saver');
        else
%            save(fullfile(pwd, filename),'-struct', 'saver', '-append');
        end
        
        % Calculate the average of decision values stored in runResults and
        % store it in storage(diff) for getting ploted later on
        storageTemp    = ones(1, length(varargin));
        deviationsTemp = ones(1, length(varargin));
        for j = 1:length(varargin)
            storageTemp(j)      = mean(runResults.(['d' num2str(j)]));
            deviationsTemp(j)   = std(runResults.(['d' num2str(j)])) / runsPerParam;
        end
        
        storage(i,:)      = storageTemp;
        deciations(i,:)   = deviationsTemp;
        
        fprintf(['Processed ' parameter ' ' num2str(X(i)) ', mean value was ' num2str(storageTemp(1)) ' with SEM ' num2str(deviationsTemp(1)) '\n']);
    end

    
    
% PLOTTING

global SEM;
SEM = deviations; 

if 0
    figure();
    hold on;
    for j = 1:length(varargin)
        aa = plot(X, storage);
%        confplot(X, storage, deviations, deviations);
        mini = min(min(storage(1:numel(paramsArr), j)));
        maxi = max(max(storage(1:numel(paramsArr), j)));
        if mini ~= maxi
            ylim([mini - 0.1 * mini, maxi + 0.1 * maxi]);
        end
        xlabel(strrep(parameter, '_', '\_'));
        ylabel('Average decision');
    end
    hold off;
end
if 1
    for j = 1:length(varargin)
        figure();
        hold on;
%        plot(X, storage(:,j));
        confplot(X, storage(:,j), deviations, deviations);
        mini = min(min(storage(1:numel(paramsArr), j)));
        maxi = max(max(storage(1:numel(paramsArr), j)));
        if mini ~= maxi
            ylim([mini - 0.1 * mini, maxi + 0.1 * maxi]);
        end
        title(func2str(varargin{j})); 
        xlabel(strrep(parameter, '_', '\_'));
        ylabel('Average decision');
        hold off;
    end
end
    res = storage;
end
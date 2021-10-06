% Scans a set of parameters and plots the decision specified by the
% decision maker function

function res = scanParamsArray2L(paramsArr, runsPerParam, varargin)

% Find out which parameter changes in paramsArr
names = fieldnames(paramsArr(1));
for i = 1:length(names)
    if (paramsArr(1).(names{i}) ~= paramsArr(2).(names{i}))
        parameter = names{i};
    end
end

% This matrix will be filled with values for the x axis
X = 1:length(paramsArr);

% Stores the average of runPerDiff different runs for every diff in
% diffRange in the end
storage = ones(numel(paramsArr), length(varargin));

    % Loop through diffs
    for i = 1:numel(paramsArr)
        % Save current parameter value for plotting
        X(i) = paramsArr(i).(parameter);
        
        % Create an empty matrix that'll be filled with decision values
        runResults = ones(length(varargin), runsPerParam);

        % loop through runsPerDiff
        for run = 1:1:runsPerParam
            fields = sim2L(paramsArr(i));
            ULayer = struct();
            ULayer.params = paramsArr(i);
            ULayer.field  = fields.field.u;
            % loop through decision makers
            for j = 1:length(varargin)
                runResults(j, run) = varargin{j}(ULayer);
            end
        end
        
        % Calculate the average of decision values stored in runResults and
        % store it in storage(diff) for getting ploted later on
        for j = 1:length(varargin)
            storage(i, j) = mean(runResults(j));
        end
        fprintf(['Processed ' parameter ' ' num2str(X(i)) ', mean value was ' num2str(storage(i)) '\n']);
    end
    
% plot storage data
figure();
plot(X, storage, '--o');
ylim([min(min(storage)) - 1, max(max(storage)) + 1]);
title(' first decision maker (blue), second (green), third (red)'); 
xlabel(parameter);
ylabel('Average decision');

res = storage;
end
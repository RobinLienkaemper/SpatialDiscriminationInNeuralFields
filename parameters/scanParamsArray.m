% Calls the corresponding function for 1 or two layer simulations

function [res, dev] = scanParamsArray(paramsArr, runsPerDiff, varargin)
    if (paramsArr(1).layers == 1)
        [res,dev] = scanParamsArray1L(paramsArr, runsPerDiff, varargin{:});
    elseif (paramsArr(1).layers == 2)
        res = scanParamsArray2L(paramsArr, runsPerDiff, varargin{:});
    end
end
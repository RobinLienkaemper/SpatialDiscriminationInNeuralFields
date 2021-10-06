% Returns an array of param-structs that differ in one param

function paramsArr = paramsArray(params, varargin) 

if (~isfield(params, 'layers'))
    error('Invalid input: Pass a params structure!');
end

for param = 1:2:length(varargin)
    for i = 1:1:length(varargin{param+1})
        paramsArr(param, i) = params;
        paramsArr(param, i).(varargin{param}) =  varargin{param+1}(i);
    end
end
end
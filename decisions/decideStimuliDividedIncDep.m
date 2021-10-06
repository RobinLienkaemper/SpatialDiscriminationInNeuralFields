function res = decideStimuliDivided (field)
field = cleanField(field);
% Decides if stimuli are **TOTALLY** divided
    res = stimuliIncisionDepth(field) >= 0.9975 * field.params.inp_str;
end
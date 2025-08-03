function [x_best, fval] = GA(lb, ub, options)
    nVars = numel(lb);
    [x_best, fval] = ga(@F_q2, nVars, [],[],[],[], ...
                        lb, ub, [], [], options);
end
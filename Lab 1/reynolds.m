% function reynolds(): calculates the Reynolds number given a specific
% flowrate and pipe diameter.
function Re = reynolds(q, diameter)
    Re = 4 .* q ./ pi ./ diameter ./ 0.0000010533;
end
% function haaland(): calculates the Darcy friction factor using the
% Haaland approximation based on Reynolds number, roughness, and pipe
% diameter.
function f = haaland(Re, eps, D)
    A = ((eps/D)/3.7)^1.11;
    B = 6.9./Re;
    invsqrtF = -1.8*log10(A + B);
    f = 1./(invsqrtF.^2);
end
% function churchill(): calculates the Darcy friction factor using the
% Churchill approximation based on Reynolds number, roughness, and diameter
function f = churchill(Re, eps, D)
    denom = (7/Re)^0.9+0.27*(eps/D);
    a = (2.457*log(1/denom))^16;
    b = (37530/Re)^16;
    f = 8*((8/Re)^12+(1/(a+b)^1.5))^(1/12);
end
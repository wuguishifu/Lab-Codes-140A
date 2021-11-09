% function invHaaland(): calculates the roughness using the inverse of the
% Haaland approximation based on Darcy friction factor, pipe diameter, and
% Reynolds number
function e = invHaaland(f, D, Re)
    lhs = 1./sqrt(f);
    lhs = lhs./-1.8;
    lhs = 10.^lhs;
    lhs = lhs - 6.9./Re;
    lhs = log(lhs)./1.11;
    lhs = exp(lhs);
    lhs = lhs.*3.7;
    e = lhs .* D;
end

% @clark the above function is when i did each step separately and below
% is a function where i actually algebraically solved for epsilon from
% the Haaland equation
% function e = invHaaland(f, D, Re)
%     e = 3.7 .* D .* log(10.^(-1./(1.8.*sqrt(f)))-6.9./Re) ./ log(1.11);
% end
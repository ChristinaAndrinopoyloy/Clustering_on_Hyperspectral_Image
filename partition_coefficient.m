function [pc]=partition_coefficient(U)
    size_of_U = size(U);
    square_U = U.^2;
    S = sum(sum(square_U));
    pc = S/size_of_U(1);
end
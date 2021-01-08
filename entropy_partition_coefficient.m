function [pe]=entropy_partition_coefficient(U)
    size_of_U = size(U);
    
    temp = [];
    for i=1:size_of_U(1)
        for j=1:size_of_U(2)           
            temp = [temp ; U(i,j)*log(U(i,j))];
        end
    end 
    pe = -(sum(temp))/(size_of_U(1));
end
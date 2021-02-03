function [coordinates] = rnd_coordinates(n)
%INPUT  set size
%OUTPUT random coordinates between 0 and 1, that do not overlap
duplicates = 1;
coordinates = zeros(n,2);
while duplicates
    for i = 1:n
        for j = 1:2
            coordinates(i,j) = rand();
        end
    end
    if length(coordinates) == length(unique(coordinates, 'rows'))
        duplicates = 0;
    end
end

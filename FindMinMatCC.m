function [M, P] = FindMinMatCC(DMC,c)
n = 0;

    for i = 1:size(DMC,1)
        Temp = DMC(i,:);
        [M(i), P(i)] = min(Temp(Temp>n));
    end
%X = M;
%Y = P;

if c > 1
    for j = 2:c
        for i = 1:size(DMC,1)
            n = M(j-1,i);
            Temp = DMC(i,:);
            [M(j,i), P(j,i)] = min(Temp(Temp>n));
        end
        %X = M;
        %Y = P;
    end
end
    
    %X(:,j) = M(i);
    %Y(;,j) = P(i);
    
end
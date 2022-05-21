function [CCC, MMM, XXX] = placeinbin(B, MC)
CCC = zeros(1,100);
MMM = zeros(5,100);

    for j = 1:size(MC,2)
         Bin = B(j);
         CCC(1,Bin) = CCC(1,Bin)+1;
         MMM(:,Bin) = MC(:,j) + MMM(:,Bin);
    end
    for i = 1:size(MMM,1)
        XXX(i,:) = MMM(i,:)./CCC(1,:);
    end
    
        
        
    
end

         
    

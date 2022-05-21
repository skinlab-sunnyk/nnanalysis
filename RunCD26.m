function [DM1Yum, CC,CCs,CCm, XXX, I1, I1s, MCum] = RunCD26(Cells, Epi, c)
%figure, scatter(Cells(:,1), Cells(:,2)), hold on, scatter(Epi(:,1), Epi(:,2)), hold off;
[DM1X, DM2C] = DistMats(Cells, Epi);
[ME, PE] = FindMinMat(DM1X);
[MC, PC] = FindMinMatCC(DM2C,c); %c is number of neighbours
[DM1Y] = EpiCellDistVec(Epi, Cells, PE);
%convert to um
pixelperum = 6.5; %40x IX73 camera
DM1Yum = Pixel2um(DM1Y,pixelperum);
MCum = Pixel2um(MC,pixelperum);
%figure, plot(DM1Yum);
%organise cells in bins
binsize = 5; %based on average nuclear size measured via threshold and particle size
[CC, B] = Binit(DM1Yum, binsize);
%max(B)
CCs = CC/sum(CC);
CCm = CCs/max(CCs);
%figure, plot(CC);
[CCC, MMM, XXX] = placeinbin(B, MCum);
%size(CCC)
%size(MMM)
%size(XXX)
I1s = ImType1(CCs, size(CCs,2)); 
I1 = ImType1(CCm, size(CCm,2));
%figure, HeatMap(XXX);






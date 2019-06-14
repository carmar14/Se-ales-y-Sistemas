 I = imread('batman.jpg');
 BW = imbinarize(I);
 [B,L] = bwboundaries(BW,'noholes'); 
    
 hold on 
 for k = 1:length(B)   
        bordes = B{k};    
        plot(bordes(:,2), bordes(:,1), 'b', 'LineWidth', 2)
 end
% Computer Vision Tester for Written Numbers
% Input: Camera Image
% Output: Camera Pixel Coords of the bottom left of the rightmost letter
% https://www.mathworks.com/help/supportpkg/usbwebcams/ug/acquire-images-from-webcams.html
function fR = visiontester(I)
imageString = 'one.png';
subplot(2,2,1);
Icolor = imread(imageString);
I = rgb2gray(Icolor);
imshow(I);
title('Original');

subplot(2,2,2);
BW = imbinarize(imcomplement(I),'adaptive','Sensitivity',0.3); %Potential problem is seeing other stuff in the frame/reflections
imshow(BW);
title('Binary');

subplot(2,2,3);
BWTrimmed = bwareaopen(BW,50000); %Tune this number to only highlight big enough numbers (it's relative to resolution)
imshow(BWTrimmed);
title('Filtered');

subplot(2,2,4);
CH = bwconvhull(BWTrimmed,'objects'); %Convex hulls are actually not needed.
imshow(CH);
title('Convex Hulls');

stats = regionprops(BWTrimmed, 'BoundingBox'); % Note, will need to grab a specific hull out of CH
% stats(1).BoundingBox
% size(stats)
% subplot(2,2,4);
allCorners =[];
for s = 1:size(stats,1)
    allCorners = [allCorners [stats(s).BoundingBox(1) stats(s).BoundingBox(2)+stats(s).BoundingBox(4)]]; %TODO: Make this less time intensive
end
% size(allCorners)
farRight = [allCorners(1) allCorners(2)];
if(size(allCorners,2) > 2)
    for i = 1:(size(allCorners,2)/2)
    %     allCorners(i*2)
        if allCorners(i*2) >= farRight(1)
            farRight = [allCorners(i*2-1) allCorners(i*2)];
        end 
    end
end
farRight(2)
figure();
CH_markers = insertShape(I,'FilledCircle',[farRight(1) farRight(2) 40]);
imshow(CH_markers);
%Can return farRight as the output of this pipeline. NOTE that convex hulls
%can also be streamlined and are just in to debug the filters.
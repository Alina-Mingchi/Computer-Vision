%reads in the image, converts it to grayscale, and converts the intensities
%from uint8 integers to doubles. (Brightness must be in 'double' format for
%computations, or else MATLAB will do integer math, which we don't want.)

dark = double(rgb2gray(imread('u2dark.png')));
imshow(dark,[]);
%%%%%% Your part (a) code here: calculate statistics
avepi = mean2(dark);
Max = max(max(dark));
Min = min(min(dark));
%%%%%% Your part (b) code here: apply offset and scaling
fixedimg = (dark-Min)/(Max-Min)*255;

%displays the image
figure;
buffer = sprintf('Fixedimg');
imshow(uint8(fixedimg));
title(buffer);

%%%%%% Your part (c) code here: apply the formula to increase contrast,
% and display the image
contrasted = 2*(fixedimg-128)+128;

figure;
buffer = sprintf('Contrasted');
imshow(uint8(contrasted));
title(buffer);
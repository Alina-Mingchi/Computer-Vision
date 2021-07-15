function features = ComputeFeaturesGradient(img)
% Compute a feature vector for all pixels of an image. You can use this
% function as a starting point to implement your own custom feature
% vectors.
%
% INPUT
% img - Array of image data of size h x w x 3.
%
% OUTPUT
% features - Array of computed features for all pixels of size h x w x f
%            such that features(i, j, :) is the feature vector (of
%            dimension f) for the pixel img(i, j, :).

    img = double(img);
    height = size(img, 1);
    width = size(img, 2);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                                         %
    %                              YOUR CODE HERE                             %
    %                                                                         %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
features = zeros([height, width, 6]);
%Since there are x and y directions, then it is 3*2=6 features
% gradient x direction
for c = 1:3
    for a = 1: i
        for b = 1:(j-1)
            features(a,b,c*2-1) = img(a,b,c) - img(a,b+1,c);
        end
    end
end

% gradient y direction
for c = 1:3
    for a = 1: (i-1)
        for b = 1:j
            features(a,b,c*2) = img(a,b,c) - img(a+1,b,c);
        end
    end
end
end

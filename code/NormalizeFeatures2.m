function featuresNorm = NormalizeFeatures2(features)
% Normalize image features to distribute on [0,1]. This
% normalization can cause k-means clustering to perform better.
%
% INPUTS
% features - An array of features for an image. features(i, j, :) is the
%            feature vector for the pixel img(i, j, :) of the original
%            image.
%
% OUTPUTS
% featuresNorm - An array of the same shape as features where each feature
%                has been normalized to have zero mean and unit variance.

    features = double(features);
    featuresNorm = features;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%                                                                              %
%                HINT: The functions mean and std may be useful                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find mean on the third entry fij = mu
i = size(features,1);
j = size(features,2);
k = size(features,3);
minimum = zeros(1,k);
maximum = zeros(1,k);
temp = features(:,:,a);
for a = 1:k
    minimum(a) = min(temp(:));
    maximum(a) = max(temp(:));
end

for b = 1:k
    if minimum(b) < 0
        featuresNorm(:,:,b) = (features(:,:,b)-minimum(b))/(maximum(b)-minimum(b));
    else
        featuresNorm(:,:,b) = features(:,:,b)/maximum(b);
    end
end
end

function featuresNorm = NormalizeFeatures(features)
% Normalize image features to have zero mean and unit variance. This
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
 mu = zeros(1,k);
 sigma = zeros(1,k);
 sepfeatures = zeros(i,j);
 for a = 1:k
     mu(a) = sum(sum(features(:,:,a)))/(i*j); 
     %calculate std of all elements
     temp = features(:,:,a);
     %temp(:), write all columns in one column
     sigma(a) = std(temp(:));
 end
 for b = 1:k
    sepfeatures = (features(:,:,b)-mu(1,b))/sigma(1,b);
    featuresNorm(:,:,b) = sepfeatures;
 end
end

function match = SIFTSimpleMatcher(descriptor1, descriptor2, thresh)
% SIFTSimpleMatcher 
%   Match one set of SIFT descriptors (descriptor1) to another set of
%   descriptors (decriptor2). Each descriptor from descriptor1 can at
%   most be matched to one member of descriptor2, but descriptors from
%   descriptor2 can be matched more than once.
%   
%   Matches are determined as follows:
%   For each descriptor vector in descriptor1, find the Euclidean distance
%   between it and each descriptor vector in descriptor2. If the smallest
%   distance is less than thresh*(the next smallest distance), we say that
%   the two vectors are a match, and we add the row [d1 index, d2 index] to
%   the "match" array.
%   
% INPUT:
%   descriptor1: N1 * 128 matrix, each row is a SIFT descriptor.
%   descriptor2: N2 * 128 matrix, each row is a SIFT descriptor.
%   thresh: a given threshold of ratio. Typically 0.7
%
% OUTPUT:
%   Match: N * 2 matrix, each row is a match.
%          For example, Match(k, :) = [i, j] means i-th descriptor in
%          descriptor1 is matched to j-th descriptor in descriptor2.
    if ~exist('thresh', 'var'),
        thresh = 0.7;
    end

    match = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    num = size(descriptor1,1);
    num2 = size(descriptor2,1);
    euclidean = [];
    for i=1:num2
        copy2 = repmat(descriptor2(i,:),num,1);
        new = sqrt(sum(((descriptor1-copy2).^2)')');
        euclidean = [euclidean,new];
    end
    
    [distance,order] = sort(euclidean,2);
    ratio = distance(:,1)./distance(:,2);
    index = ratio<thresh;
    index=order(:,1).*index;
    match=[find(index>0) index(find(index>0))];
    
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                 END YOUR CODE                                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

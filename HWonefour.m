RGB = imread('flower.bmp');
imshow(RGB)
grayflower= double(rgb2gray(RGB));
figure;
imshow(grayflower,[]);
%first convert to grayscale and double
[U,S,V] = svd(grayflower);
svalue = svds(grayflower,10);
s = diag(S);
%this gives all the singular values
rank = linspace(1,300,300);
plot(rank,s);

A = U * S * V';
figure; 
notes = sprintf('Reconstruct');
imshow(uint8(A));
title(notes);
%show that after SVD compression, it is the same as the original image


for N = 10:10:300
    if  (N == 10)||(N == 50)||(N == 100)||(N == 200)
    % store the singular values in a temporary variable
        C = S;
    % set diagonal values not used to be 0
        C(N+1:end,:)=0;
        C(:,N+1:end)=0;
    % Construct image using selected singular values
        D=U*C*V';
        figure;
        buffer = sprintf('Image output using %d singular values', N);
        imshow(uint8(D));
        title(buffer);
    end
    
end


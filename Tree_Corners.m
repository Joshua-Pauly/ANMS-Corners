%%Question 2
I = imread('tree_input_image.jpeg');
if size(I,3) > 1 % image has three channels
    I = im2gray(I);
end

if size(I,3) > 1 % image has three channels
    I = im2gray(I);
end
corners = detectFASTFeatures(I, 'MinQuality',0.0001, 'MinContrast', 0.25);
imshow(I); hold on;
plot(corners);
savefig('Tree_corners.fig')
[~,index] = sort(corners.Metric,'descend');
sorted_corners = corners.Location(index,:);
rad = 1:length(index);
rad(1) = 1000;
numpoints = 500;
for c1 = 2:length(index)
    dist = [];
       for c2 = 1:c1-1
           tmp_dist = norm(sorted_corners(c1)-sorted_corners(c2)); %euclidean distance
           dist(end+1) = tmp_dist;
       end
       rad(c1) = min(dist);
end 
rad = transpose(rad);
[rad_sort, sortIdx] = sort(rad,'descend');
sorted_corners1 = sorted_corners(sortIdx,1);
sorted_corners1 = sorted_corners1(1:numpoints);
sorted_corners2 = sorted_corners(sortIdx,2);
sorted_corners2 = sorted_corners2(1:numpoints);
sorted_corners3 = [sorted_corners1,sorted_corners2]; %500 Corners
corners_500 = cornerPoints(sorted_corners3);
imshow(I); hold on;
plot(corners_500);
savefig('Tree_500corners.fig')
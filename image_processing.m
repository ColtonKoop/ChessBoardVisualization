format long

for n = 0:1942

% load the image
I = im2double(imread(sprintf('synthetic_data\\%d.jpg', n)));

% open and extract the corner information from the json file
fid = fopen(sprintf('synthetic_data\\%d.json', n)); 
raw = fread(fid, inf); 
str = char(raw');
fclose(fid); 
val = jsondecode(str);

% pad the image
padding = 200;
I_padded = padarray(I,[padding padding],'replicate','both');
% imshow(I_padded)

% process the corner matrix into a more intuitive convention
val.corners = length(I)*val.corners + padding;
val.corners = fliplr(val.corners);
val.corners = val.corners([1,2,4,3], :);

% % visualize the corners
% pos = [val.corners(1,1) val.corners(1,2); ...
%        val.corners(2,1) val.corners(2,2); ...
%        val.corners(3,1) val.corners(3,2); ...
%        val.corners(4,1) val.corners(4,2)];
% I_corners = insertMarker(I_padded, pos, 'x', 'color', 'green', 'size', 10);
% imshow(I_corners)

% transform the image, crop and resize the output
XWorldLimits = 100*[-2.5 12.5];
YWorldLimits = 100*[-2.5 12.5];
ImageSize = [1500 1500];
J_ref = imref2d(ImageSize, XWorldLimits, YWorldLimits);

fixedPoints = [10, 10; 0, 10; 0, 0; 10, 0;];
tform = fitgeotrans(val.corners, 100*fixedPoints, 'projective');
[J, J_ref] = imwarp(I_padded, tform, 'OutputView', J_ref);
% imshow(J)

% save the processed image
imwrite(J,sprintf('synthetic_data_processed\\%d.jpg', n))

end

function label = classify_church(image, feature_collection)

% Extract points of interest and their features
points = detectSIFTFeatures(image);
[descs, validPoints] = extractFeatures(image,points);

% Match againts known features
corrs = matchFeatures(descs, feature_collection.descriptors', ...
    'MatchThreshold', 100, 'MaxRatio', 0.7);

% Get the most prevelent label of the matched features
labels = zeros(1, length(corrs));
for index = 1:length(corrs)
   labels(index) = feature_collection.labels(corrs(index,2));
end
label = mode(labels);
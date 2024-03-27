function label = classify_digit(digit_image, digits_training, centre, radius)
% get descriptor of the digit to classify
desc = gradient_descriptor(digit_image, centre, radius);

% search for the best candidate in the database
best_candidate_index = 0;
best_candidate_diff = intmax;
for digit = 1:length(digits_training)
    diff = pdist2(digits_training(digit).descriptor, desc);
    if diff < best_candidate_diff
        best_candidate_diff = diff;
        best_candidate_index = digit;
    end
end

label = digits_training(best_candidate_index).label;
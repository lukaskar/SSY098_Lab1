load digits.mat digits_training
for digit = 1:length(digits_training)
    digits_training(digit).descriptor = ...
    gradient_descriptor(digits_training(digit).image, [20,20], 19);
end
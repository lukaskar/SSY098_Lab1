correct_guess = 0;

% Classify all validation digits to the closest match in the training set
for digit = 1:length(digits_validation)
    guess = classify_digit(digits_validation(digit).image, digits_training, [20,20], 19);
    if guess == digits_validation(digit).label
        correct_guess = correct_guess + 1;
    end
end

score = correct_guess / length(digits_validation);
disp(['Score: ' num2str(round(score * 100, 3)) ' %'])
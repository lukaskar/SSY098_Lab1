function desc = gradient_descriptor(image, position, radius)
patch = get_patch(image, position(1), position(2), radius);

% Compute gaussian gradients. Let the standard deviation be proportional to radius.
proportional_std = 0.1;  % can be changed!
[grad_x, grad_y] = gaussian_gradients(patch, floor(radius * proportional_std));

% Divide your gradients into 3 x 3 regions defined by place_regions.
region_centres = place_regions([radius,radius], radius/3);

desc = [];
for pos = region_centres
    % Compute a gradient histogram for the gradients from each region.
    sub_grad_x = get_patch(grad_x, pos(1), pos(2), radius/3);
    sub_grad_y = get_patch(grad_y, pos(1), pos(2), radius/3);
    % Stack the histograms into a 72-vector.
    desc = [desc, gradient_histogram(sub_grad_x, sub_grad_y)];
end

% Normalize that vector to unit length.
desc = desc / sum(desc);
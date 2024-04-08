function [grad_x, grad_y] = gaussian_gradients(img, std)
filtered_img = gaussian_filter(img, std);
derivative_x = [-0.5, 0, 0.5];
derivative_y = [-0.5, 0, 0.5]';

grad_x = imfilter(filtered_img, derivative_x, 'symmetric');
grad_y = imfilter(filtered_img, derivative_y, 'symmetric');

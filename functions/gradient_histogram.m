function histogram = gradient_histogram(grad_x, grad_y)
% angle of all gradients, 0 -> 2*pi
angles = mod(atan2(grad_y, grad_x) + 2*pi, 2*pi);

% matrix of bucket number for all pixels
bucket_nr = floor(angles/pi*4) + 1;

% add gradient magnitude to corresponding bucket
histogram = zeros(1,8);
image_size = size(grad_x);
for y = 1:image_size(1)
    for x = 1:image_size(2)
        gradient_mag = norm([grad_x(y, x), grad_y(y, x)]);
        histogram(bucket_nr(y, x)) = histogram(bucket_nr(y, x))...
        + gradient_mag;
    end
end

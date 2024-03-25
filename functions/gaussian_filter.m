function filtered_img = gaussian_filter(img, std)
filter = fspecial('gaussian', 4 * std, std);
filtered_img = imfilter(img, filter,"symmetric");
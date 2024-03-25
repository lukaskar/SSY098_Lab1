function patch = get_patch(image, x, y, patch_radius)
sz = size(image);
left = x - patch_radius;
right = x + patch_radius;
upper = y - patch_radius;
lower = y + patch_radius;

if any(left < 1 | right > sz(1) | upper < 1 | lower > sz(2))
    error('Patch outside image border')
end

patch = image(upper:lower, left:right);

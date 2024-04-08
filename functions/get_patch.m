function patch = get_patch(image, x, y, patch_radius)
sz = size(image);
patch_radius = floor(patch_radius);
left = x - patch_radius;
right = x + patch_radius;
upper = y - patch_radius;
lower = y + patch_radius;

if any(left < 1 | right > sz(2) | upper < 1 | lower > sz(1))
    disp(['Rows:' num2str(sz(1))])
    disp(['Columns:' num2str(sz(2))])
    disp(['Left:' num2str(left)])
    disp(['Right:' num2str(right)])
    disp(['Upper:' num2str(upper)])
    disp(['Lower:' num2str(lower)])
    error('Patch outside image border')
end

patch = image(upper:lower, left:right, :);

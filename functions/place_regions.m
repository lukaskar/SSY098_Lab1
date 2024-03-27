function region_centres = place_regions(centre, radius)

% distance between the centre of two sqares
cc_distance = floor(2 * radius);

% positions in the 3x3 grid
mid_row = centre(1);
top = mid_row - cc_distance;
bottom = mid_row + cc_distance;

mid_col = centre(2);
left = mid_col - cc_distance;
right = mid_col + cc_distance;

region_centres = [
    [top; left], [top; mid_col], [top; right]...
    [mid_row; left], [mid_row; mid_col], [mid_row; right]...
    [bottom; left], [bottom; mid_col], [bottom; right]];

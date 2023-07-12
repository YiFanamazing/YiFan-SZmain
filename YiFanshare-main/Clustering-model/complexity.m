function c = complexity(x, y, z)
% Compute the complexity of each point

% Compute the distances between all pairs of points
distances = pdist2([x, y, z], [x, y, z]);

% Compute the average distance of each point to all other points
avg_distances = mean(distances, 2);

% Compute the standard deviation of the distances of each point to all other points
std_distances = std(distances, 0, 2);

% Compute the complexity as the product of the average distance and the standard deviation
c = avg_distances .* std_distances;
end

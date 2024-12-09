x = zeros(4, 50); % Preallocate x with dimensions 4x50
for n = 1:4
    x(n, :) = rand(1, 50) - 0.5; % Generate random values and assign to x
end

m = 0:49; % Generate x-axis values
for i = 1:4
    subplot(4, 1, i); % Create subplot (4 rows, 1 column, index i)
    stem(m, x(i, :), 'k'); % Plot the data using a stem plot in black ('k')
end
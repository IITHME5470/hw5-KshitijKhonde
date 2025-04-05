clear
px = 4;
py = 4;

combined_data = cell(1, 3); % Initialize a cell array
l = [40, 80, 101];

% Read and store files in combined_data
for i = 1:3
    combined_data{i} = []; % Initialize each cell as an empty array
    
    for j = 0:(2 * py - 1)
        filename = sprintf('T_x_y_%06d_%04d.dat', l(i), j);
        file_data = readmatrix(filename); % Read file data
        
        % Append data to the i-th index
        combined_data{i} = [combined_data{i}; file_data]; 
    end
    combined_data{i} = sortrows(combined_data{i}, [1, 2]);
end

% Save data with six decimal places
filename = sprintf('combined_data_%06d_%dx%d.dat', l(1), px, py); % Generate file name
fileID = fopen(filename, 'w'); % Open file for writing

% Loop through the data and write it with fixed precision
for row = 1:size(combined_data{1}, 1)
    fprintf(fileID, '%.6f %.6f %.6f\n', combined_data{1}(row, :));
end

fclose(fileID); % Close file
fprintf('Saved: %s\n', filename);



% Save data with six decimal places
filename = sprintf('combined_data_%06d_%dx%d.dat', l(2), px, py); % Generate file name
fileID = fopen(filename, 'w'); % Open file for writing

% Loop through the data and write it with fixed precision
for row = 1:size(combined_data{2}, 1)
    fprintf(fileID, '%.6f %.6f %.6f\n', combined_data{2}(row, :));
end

fclose(fileID); % Close file
fprintf('Saved: %s\n', filename);


% Save data with six decimal places
filename = sprintf('combined_data_%06d_%dx%d.dat', l(3), px, py); % Generate file name
fileID = fopen(filename, 'w'); % Open file for writing

% Loop through the data and write it with fixed precision
for row = 1:size(combined_data{3}, 1)
    fprintf(fileID, '%.6f %.6f %.6f\n', combined_data{3}(row, :));
end

fclose(fileID); % Close file
fprintf('Saved: %s\n', filename);

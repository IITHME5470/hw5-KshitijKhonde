clear
px = 4;
py = 4;

combined_data = cell(1, 3); % Initialize a cell array
l = [40, 80, 101];

for i = 1:3
    a = dlmread(sprintf('combined_data_%06d_%dx%d.dat', l(i), px,py));  
    
    % Assuming the data is structured as a grid, calculate n
    n = sqrt(size(a,1));
    x = a(1:n:n^2,1);
    y = a(1:n, 2);
    T = reshape(a(:,3), [n, n]);
    
    figure, clf
    contourf(x,y,T','LineColor', 'none')
    xlabel('x'), ylabel('y'), title(strcat('t = ',sprintf(' %06d',l(i))));
    xlim([-0.05 1.05]), ylim([-0.05 1.05]), clim([-0.05 1.05]), colorbar
    colormap('jet')
    set(gca, 'FontSize', 14)

    figure, clf
    Tmid = T(:,n/2);
    
    plot(x, Tmid, '-', 'LineWidth', 2)
    xlabel('x'), ylabel('T'), title(strcat('Profile along mid-y at t=',sprintf('%06d',l(i))))
    xlim([-0.05 1.05])
    set(gca, 'FontSize', 14)
        
end


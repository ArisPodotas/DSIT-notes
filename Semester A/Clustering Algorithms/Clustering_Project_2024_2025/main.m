% This is the file that implements the changes made for the project
% By Aris Podotas for DIT , Clustering Algorithms.

% NOTE: Only the pixels with nonzero class label will be taken into consideration in this
% project.
% The data that will be used are in the file “Salinas_Data.mat” which contains (a) a
% 150x150x204 three-dimensional matrix named “Salinas_Image” (the Salinas hypercube)
% and (b) a 150x150 two-dimensional image named “Salinas_Labels” (the class label for
% each pixel).

% Getting data input
labels = load('Labels_Salinas.mat');
data = load('Salinas_Data.mat');

% Dealing with the zeros
function filter = missing(data)

end

% Prerequisite functions

% Implementing a function to generate for theta values
function theta = generate(sheet, number)
    % This is going to need to return values within the convex hull
    % Example theta that could be output
    % theta = [0, 20, 0, 20;
    %          0, 0, 20, 20;
    %          1, 5, 20, 20;
    %          0, 0, 20, 20;
    %          0, 0, 20, 20;
    %          0, 0, 20, 20;
    %          0, 0, 20, 20;
    %          0, 0, 20, 20;
    %          0, 0, 20, 20;];
    [~,N] = size(sheet.Countrydata);
    data = [max(sheet.Countrydata);
            min(sheet.Countrydata);];
    theta = ones(number,N);
    for i=1:number
        for j=1:N
            % Normalized random initial value in the range [min, max]
            theta(i,j) = (max(data(1)))*(randn()) + min(data(2));
        end
    end
end

% Implementing a function to find the number of clusters
function amount(sheet, seed)
    figure(1000 + seed)
    costs = ones(1,10);
    for j = 2:10
        theta = generate(sheet, j);
        [theta,bel,J] = k_means(sheet.Countrydata', theta');
        costs(:,j-1) = J;
    end
    plot(1:10, costs)
    xlabel('Number of clusters')
    ylabel('Cost function')
end

% Number of clusters
amount(x, 4);
% All the below are problematic figures mentioned in the report
% amount(xcopy, 62);
% amount(normalization, 102);
% amount(ncopy, 1038);

function cluster(sheet, clusters)
    % Clusters refers to the number of clusters
    % Implementing a function to do each iteration of the clustering for each alrgorithm so that the iterations throught the data is simple
    % Remember that the previous final figure was figure 90
    [l, N] = size(sheet.Countrydata); % Keep in mind that this N is variable
    % Looping to try different clusterings
    theta = generate(sheet, clusters);
    % k-means
    % Note we need to transpose since our data vectors are on rows
    [theta,bel,J] = k_means(sheet.Countrydata', theta');
    [N, m] = size(theta);
    for i=1:(N/3)
        figure(90 + i), hold on
        figure(90 + i), grid on
        for j=1:m
            figure(90 + i), plot3(theta(i,j), theta(i + 1,j), theta(i + 2,j), 'k+')
        end
        figure(90 + i), plot3(sheet.Countrydata(bel==1,i), sheet.Countrydata(bel==1, i+ 1), sheet.Countrydata(bel==1,i+2), 'ro')
        figure(90 + i), plot3(sheet.Countrydata(bel==2,i), sheet.Countrydata(bel==2, i+ 1), sheet.Countrydata(bel==2,i+2), 'g*')
        figure(90 + i), plot3(sheet.Countrydata(bel==3,i), sheet.Countrydata(bel==3, i+ 1), sheet.Countrydata(bel==3,i+2), 'b.')
        figure(90 + i), plot3(sheet.Countrydata(bel==4,i), sheet.Countrydata(bel==4, i+ 1), sheet.Countrydata(bel==4,i+2), 'ys')
        for k = 1:l
            text(sheet.Countrydata(k,i),sheet.Countrydata(k,i+1) ,sheet.Countrydata(k,i+2) , sheet.country(k), 'FontSize', 8, 'HorizontalAlignment', 'left')
        end
        if i == 1
            title('k-means first 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        elseif i==2
            title('k-means second 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        else
            title('k-means final 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        end
    end

    close all
    % k-medoids
    [bel,cost,theta,a] = k_medoids(sheet.Countrydata', clusters, 72);
    [N, m] = size(theta);
    for i=1:(N/3)
        figure(90 + i + N/3), hold on
        figure(90 + i + N/3), grid on
        for j=1:m
            figure(90 + i + N/3), plot3(theta(i,j), theta(i + 1,j), theta(i + 2,j), 'k+')
        end
        figure(90 + i + N/3), plot3(sheet.Countrydata(bel==1,i), sheet.Countrydata(bel==1, i+ 1), sheet.Countrydata(bel==1,i+2), 'ro')
        figure(90 + i + N/3), plot3(sheet.Countrydata(bel==2,i), sheet.Countrydata(bel==2, i+ 1), sheet.Countrydata(bel==2,i+2), 'g*')
        figure(90 + i + N/3), plot3(sheet.Countrydata(bel==3,i), sheet.Countrydata(bel==3, i+ 1), sheet.Countrydata(bel==3,i+2), 'b.')
        figure(90 + i + N/3), plot3(sheet.Countrydata(bel==4,i), sheet.Countrydata(bel==4, i+ 1), sheet.Countrydata(bel==4,i+2), 'ys')
        for k = 1:l
            text(sheet.Countrydata(k,i),sheet.Countrydata(k,i+1) ,sheet.Countrydata(k,i+2) , sheet.country(k), 'FontSize', 6, 'HorizontalAlignment', 'left')
        end
        if i == 1
            title('k-medoids first 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        elseif i==2
            title('k-medoids second 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        else
            title('k-medoids final 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        end
    end

    % k-medians
    theta = generate(sheet, clusters);
    [theta,bel,J] = k_medians(sheet.Countrydata', theta');
    [N, m] = size(theta);
    for i=1:(N/3)
        figure(90 + i + 2*N/3), hold on
        figure(90 + i + 2*N/3), grid on
        for j=1:m
            figure(90 + i + 2*N/3), plot3(theta(i,j), theta(i + 1,j), theta(i + 2,j), 'k+')
        end
        figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==1,i), sheet.Countrydata(bel==1, i+ 1), sheet.Countrydata(bel==1,i+2), 'ro')
        figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==2,i), sheet.Countrydata(bel==2, i+ 1), sheet.Countrydata(bel==2,i+2), 'g*')
        figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==3,i), sheet.Countrydata(bel==3, i+ 1), sheet.Countrydata(bel==3,i+2), 'b.')
        figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==4,i), sheet.Countrydata(bel==4, i+ 1), sheet.Countrydata(bel==4,i+2), 'ys')
        for k = 1:l
            text(sheet.Countrydata(k,i),sheet.Countrydata(k,i+1) ,sheet.Countrydata(k,i+2) , sheet.country(k), 'FontSize', 8, 'HorizontalAlignment', 'left')
        end
        if i == 1
            title('k-medians first 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        elseif i==2
            title('k-medians second 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        else
            title('k-medians final 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        end
    end

    % Possibilistic
    eta = ones(1, clusters);
    [U, theta] = possibi(sheet.Countrydata', clusters, eta,1,73,1,0.01);
    [N, m] = size(theta);
    for i=1:(N/3)
        figure(90 + i + 3*N/3), hold on
        figure(90 + i + 3*N/3), grid on
        for j=1:m
            figure(90 + i + 3*N/3), plot3(theta(i,j), theta(i + 1,j), theta(i + 2,j), 'k+')
        end
        figure(90 + i + 3*N/3), plot3(sheet.Countrydata(bel==1,i), sheet.Countrydata(bel==1, i+ 1), sheet.Countrydata(bel==1,i+2), 'ro')
        figure(90 + i + 3*N/3), plot3(sheet.Countrydata(bel==2,i), sheet.Countrydata(bel==2, i+ 1), sheet.Countrydata(bel==2,i+2), 'g*')
        figure(90 + i + 3*N/3), plot3(sheet.Countrydata(bel==3,i), sheet.Countrydata(bel==3, i+ 1), sheet.Countrydata(bel==3,i+2), 'b.')
        figure(90 + i + 3*N/3), plot3(sheet.Countrydata(bel==4,i), sheet.Countrydata(bel==4, i+ 1), sheet.Countrydata(bel==4,i+2), 'ys')
        for k = 1:l
            text(sheet.Countrydata(k,i),sheet.Countrydata(k,i+1) ,sheet.Countrydata(k,i+2) , sheet.country(k), 'FontSize', 8, 'HorizontalAlignment', 'left')
        end
        if i == 1
            title('Possibilistic c-means first 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        elseif i==2
            title('Possibilistic c-means second 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        else
            title('Possibilistic clustering algorithm final 3 features')
            xlabel('x')
            ylabel('y')
            zlabel('z')
        end
    end
end

 
% This is the file that implements the changes made for the project
% By Aris Podotas for DSIT , Clustering Algorithms.

% NOTE: Only the pixels with nonzero class label will be taken into consideration in this
% project.
% The data that will be used are in the file “Salinas_Data.mat” which contains (a) a
% 150x150x204 three-dimensional matrix named “Salinas_Image” (the Salinas hypercube)
% and (b) a 150x150 two-dimensional image named “Salinas_Labels” (the class label for
% each pixel).

% Getting data input
x = struct('labels', load('Labels_Salinas.mat').Labelsinit, 'data', load('Salinas_Data.mat').Salinas_Image);
% editors note: honestly with the amount of times we call
% the size(x) function I was considering adding it to the
% struct itself.

% Before we begin we should equate aspects of this data to
% common values within clustering algorithms. With this we
% mean that we should identify what dimension corresponds
% to our data what dimension corresponds to the features.
% Actually we notice that our data vectors correspond to 
% the M, N dimensions, where each coordinate (M, N) is o-
% ne data vector of length L features along the L axis.
% In this way we re-phrase our problem to one that has
% M times N data vectors of length L featrues.

% Feeling the data

% Missing data

% Removing vectors with zeros in the labels
function output = filter(object)
    % Generating a matrix of boolians that has a true value
    % for all non-missing labels
    missing = object.labels~=0;
    % Using the matrix of boolians to remove false values
    output = struct('labels', object.labels(missing), 'data', object.data(missing));
end

% Testing to see if any more missing data exists
% If nothing appears in the terminal up to this point
% then we know we don't have missing data.
function evaluate(object)
    if find(isnan(object.data))
        output = 'Missing data in the data field'
    elseif find(ismissing(object.data))
        output = 'Missing data in the data field'
    elseif find(isnan(object.labels))
        output = 'Missing data in the label field'
    elseif find(ismissing(object.labels))
        output = 'Missing data in the label field'
    end
end

evaluate(x);
% Thus concludes the missing data

% Data type
function output = values(object)
    % I'm supposed to end up with a L dimensional vector
    % one dimension for each feature.
    [~,~,L] = size(object.data);
    object.mean = zeros(L, 1);
    object.median = zeros(L, 1);
    object.max = zeros(L, 1); 
    object.min = zeros(L, 1); 
    object.std = zeros(L, 1); 
    for i=1:L
        % Not sure why but the syntax
        % function(object.data(object.labels ~=0, i)) wont work
        % and calling the function without the loop wont output
        % in the format I need the data while removing zero label data.
        holder = object.data(:,:,i);
        object.mean(i) = mean(holder(object.labels ~= 0));
        object.median(i) = median(holder(object.labels ~= 0));
        object.max(i) = max(holder(object.labels ~= 0));
        object.min(i) = min(holder(object.labels ~= 0));
        object.std(i) = std(holder(object.labels ~= 0));
    end
    output = object;
end

x = values(x);

% Visualizing the distributions of the data
% 204 histograms seem a little excesive for inside
% the report so enable this optionally.
function visualize(object, autoclose, save)
    [M, N, L] = size(object.data);
    % Removing zero labels
    c = sum(sum(object.labels == 0)); % 8592
    % Using Sturge's rule
    % Writing this made me realise I had used the rule wrong last time
    optimal = ceil(log2(M*N-c)+1);
    % Hushing warning for already made folder
    [~, ~, ~] = mkdir('./Images/');
    for i=1:L
        fig = figure(i);
        % Not sure why but the syntax
        % histogram(object.data(object.labels ~=0, i)) wont work
        holder = object.data(:,:,i);
        histogram(holder(object.labels ~= 0), optimal)
        title(sprintf('Feature %.0f histogram', i))
        if save
            saveas(i, sprintf('./Images/Feature %.0f histogram.png', i))
        end
        if autoclose
            close (fig);
        end
    end
end

% Change autoclose and save to your preference.
% They only need to be on the first time.
% Current function call is autoclose on and save off
% Commented out for time complexity
% visualize(x, 1, 0);

% Before going to the feature selection
% I want to visualise the data in the way
% it was provided in the project description file
% and see what I can from the hyperspectral images themselves.
% To do this, I will visualize a 3d plot using the index
% of a pixel and the color of the feature at that location.
function images(object, resolution)
    figure(3000);
    hold on
    grid on
    [M,N,~] = size(object.data);
    for j=1:resolution:N
        for k=1:resolution:M
            if object.labels(k, j)~= 0
                figure(3000), scatter3(k, j, 1, 'ro');
            end
        end
    end
    saveas(3000, './Images/Overview of images.png')
end

% Change the resolution for more speed
% Higher values are faster
% Commented out for time complexity
% images(x, 10);

% Feature selection

% Principal componenet analysis

% Transforming data from (M)x(N)x(L) to (MxN)xL
% Essentiallly we need a funciton that turns the indexes
% 150, 1 -> 150
% 1, 2 -> 151
% 2, 2 -> 152
% .
% .
% 
% M + 150*(N-1)
% Keep in mind the labels should also be transformed
% if we dont undo the transformation of the data after the
% pca.
function unwind(object)
    [M, N, L] = size(object)
    copy = object
    for i=1:M
        for j=1:N
            copy.data(M + 150*(N-1),:) = object.data(M, N,:);
            copy.labels(M + 150*(N-1),:) = object.labels(M,N,:);
        end
    end
end

unwind(x)

% Determining m

[x.eigenval,x.eigenvec,x.explain,x.Y,x.mean_vec] = pca_fun(x, 50);

% undoing the transform
function rewind(object)

end

% Feature transformations

% Determining if we need to do a data transform
function range(object)
    max(object.max)
    min(object.max)
    max(object.min)
    min(object.min)
end

range(x)

function transform(object)

end

% Clustering

% Implementing a function to generate theta values
function theta = generate(object, number)
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
    [~,~,L] = size(object.data);
    theta = ones(number, L);
    for i=1:number
        for j=1:L
            % Normalized random initial value in the range [min, max]
            theta(i,j) = (object.max(i))*(randn()) + object.min(i);
        end
    end
end

% Implementing a function to find the number of clusters
function amount(object, seed)
    figure(seed)
    costs = ones(1,30);
    for j = 2:30
        theta = generate(sheet, j);
        [theta,bel,J] = k_means(object.data(object.labels~=0), theta);
        costs(:,j-1) = J;
    end
    plot(1:30, costs)
    xlabel('Number of clusters')
    ylabel('Cost function')
end

function cluster(object, clusters)
    [l, N] = size(sheet.Countrydata); % Keep in mind that this N is variable
    theta = generate(sheet, clusters);
    % k-means
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
end


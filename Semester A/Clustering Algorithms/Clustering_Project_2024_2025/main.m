 
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
filtered = filter(x);
% Thus concludes the missing data

% Data type

function values(object)
    object.stats= [mean(object.data(object.labels ~= 0));
    max(object.data(object.labels ~= 0));
    min(object.data(object.labels ~= 0));
    std(object.data(object.labels ~= 0));];
end

values(x);

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
    mkdir('./Images')
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
visualize(x, 1, 0);

% Feature selection

% Principal componenet analysis from the provided file

% Determining m

pca_fun(x)

% Feature transformations

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
            theta(i,j) = (max(data(1)))*(randn()) + min(data(2));
        end
    end
end

% Implementing a function to find the number of clusters
function amount(sheet, seed)
    figure(seed)
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

function cluster(sheet, clusters)
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


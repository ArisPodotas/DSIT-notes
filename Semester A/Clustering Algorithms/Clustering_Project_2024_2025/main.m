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

% Standard statistical values
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
% 204 histograms seem a little excesive
% enable this optionally.
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
function images(object, resolution, seed)
    figure(3000);
    hold on
    grid on
    % Actually there is a better way to do this that I might implement
    % Later in the tests.m file
    [M,N,~] = size(object.data);
    for j=1:resolution:N
        for k=1:resolution:M
            if object.labels(k, j)~= 0
                figure(3000), scatter3(k, j, 1, 'ro');
            end
        end
    end
    saveas(3000, sprintf('./Images/Overview of images %.0f.png', seed))
end

% Change the resolution for more speed
% Higher values are faster
% Commented out for time complexity
% images(x, 5, 0);

% Feature selection

% Principal componenet analysis

% Transforming data from (M)x(N)x(L) (3d) to (MxN)xL (2d)
% Essentiallly we need a funciton that turns the indexes
% 150, 1 -> 150
% 1, 2 -> 151
% 2, 2 -> 152
% 3, 2 -> 153
% 4, 2 -> 154
% .
% .
% .
% i, j -> i + N*(j-1)
% Keep in mind the labels should also be transformed
% if we dont undo the transformation of the data after the
% pca.
function copy = unwind(object)
    [M, N, L] = size(object.data);
    copy = object;
    % This might seem excesive but the index 151 would
    % map to index (1,2) in the (M),(N),(L) matrix
    % and because of that we need to define the shape and then the values
    copy.linear = -10 * ones(M*N,L);
    copy.linlabels= zeros(M*N,1);
    for i=1:M
        for j=1:N
            if object.labels(i,j) ~= 0
                copy.linear(i + (150*(j-1)),:) = object.data(i, j,:);
                copy.linlabels(i + (150*(j-1))) = object.labels(i,j);
            end
        end
    end
end

x = unwind(x);

[x.eigenval,x.eigenvec,x.explain,x.Y,x.mean_vec] = pca_fun(x.linear(x.linlabels~=0, :)', 3);

% Feature transformations

% Determining if we need to do a data transform
function output = range(object)
    output = [max(object.max)
    max(object.min)
    max(object.mean)
    max(object.median)
    min(object.max)
    min(object.min)
    min(object.mean)
    min(object.median)];
end

output = range(x);

% The verdict was no

% Visualising remaining data

function peek(object, seed)
    figure(seed)
    hold on
    grid on
    figure(seed), scatter3(object.Y(1,:), object.Y(2,:), object.Y(3,:))
    figure(seed), title('Salinas valley')
    figure(seed), xlabel('Component 1')
    figure(seed), ylabel('Component 2')
    figure(seed), zlabel('Component 3')
    saveas(seed, './Images/PCA result.png')
end

peek(x, 7);

% saving data after all pre-processing of the data to use
% without delays for the clustering files

% Saving data

save("process.mat","x", '-v7.3')

% Some mistakes are bound to be ones made in previous
% assignments and the pushback of the deadlines has
% made it so no feedback has been provided.
% An example is the use of Sturges rule that was incorrect
% and that I realised whilest doing this assignment.


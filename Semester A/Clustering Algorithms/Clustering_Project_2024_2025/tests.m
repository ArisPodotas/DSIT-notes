x = load('./process.mat');

% Clustering

% In order to keep the times we will
% make a matrix that holds all the times values for the algorithms
% This matrix will need to me ()x()
tic

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
end

toc
% Honestly some mistakes are bound to be ones made in previous
% assignments and the constant pushback of the deadlines has
% made it so no feedback has been provided.
% An example is the use of Sturges rule that was incorrect
% and that I realised whilest doing this assignment.

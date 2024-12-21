x = load('data_country.mat');
[l, N] = size(x.Countrydata); % 167, 9

% Normalization (linear)
normalization = x;
for i=1:N
    for j=1:l
        normalization.Countrydata(j, i) = (x.Countrydata(j,i) - mean(x.Countrydata(:,i)))/(std(x.Countrydata(:, i)));
    end
end

simplified = x;

missing = zeros(l, N);

% Taking all the parameters of the distributions of the data we are given
total = [mean(x.Countrydata);
         max(x.Countrydata);
         min(x.Countrydata);
         std(x.Countrydata);];

% Once for the optimal bins number
for k=1:N
    % Find missing data
    if any(find(x.Countrydata(:,k) == 0)) || any(find(isnan(x.Countrydata(:,k)))) || any(find(x.Countrydata(:,k) == missing))
    else
        % Updating the matrix of boolians
        missing(:, k) = 1;
    end
    % 1 will be a non missing field
    figure(k)
    % Using the Sturges Rule
    % Otherwise the bins used were 20
    optimal = ceil(log2(N)+1);
    % I use the same number of bins ofr all the graphs to be consistent
    histogram(x.Countrydata(:,k), optimal)
    % if k==1
    %     title('Histogram of Child mortality (Sturges Rule)')
    %     % saveas(k, 'Histogram of Child mortality (Sturges Rule).png')
    % elseif k==2
    %     title('Histogram of Exports (Sturges Rule)') 
    %     % saveas(k, 'Histogram of Exports (Sturges Rule).png')
    % elseif k==3
    %     title('Histogram of Health (Sturges Rule)')
    %     % saveas(k, 'Histogram of Health (Sturges Rule).png')
    % elseif k==4
    %     title('Histogram of Imports (Sturges Rule)')
    %     % saveas(k, 'Histogram of Imports (Sturges Rule).png')
    % elseif k==5 
    %     title('Histogram of Income (Sturges Rule)')
    %     % saveas(k, 'Histogram of Income (Sturges Rule).png')
    % elseif k==6
    %     title('Histogram of Inflation (Sturges Rule)')
    %     % saveas(k, 'Histogram of Inflation (Sturges Rule).png')
    % elseif k==7
    %     title('Histogram of Life expectancy (Sturges Rule)')
    %     % saveas(k, 'Histogram of Life expectancy (Sturges Rule).png')
    % elseif k==8
    %     title('Histogram of Total fertility (Sturges Rule)')
    %     % saveas(k, 'Histogram of Total fertility (Sturges Rule).png')
    % elseif k==9
    %     title('Histogram of GDPP (Sturges Rule)')
    %     % saveas(k, 'Histogram of GDPP (Sturges Rule).png')
    % end
    % clear optimal
end

% Showing if we have missing data or not
if find(missing == 0)
    problem = 'There was missing data found'
end

clear missing

% We are going to consider all the pairs of data and vidualize them
prior_relations = corrcoef(x.Countrydata);
posterior_relations = corrcoef(normalization.Countrydata);
% the prior and posterior end up the same
clear prior_relations

% % Making a figure for each of the pairs
% for i=1:N
%    for j=1:N
%        figure(i*9+j)
%        scatter(x.Countrydata(:,i), x.Countrydata(:,j))
%        title(sprintf('Correlation between features %.0f, %.0f', i, j)) 
%        % saveas(i*9+j, sprintf('Correlation between features %.0f, %.0f.png', i, j))
%    end
% end

% We will keep the total features and the selected ones seperatly. Applying the following on both sets of data.

% Deciding what features to use since some of them are evidently related very much
function output = selection(data, coef)
    [~, N] = size(data.Countrydata);
    % These loops go backwards because we run into memory erors otherwise from acessing memory that does not belong to the matrix
    for i=N:-1:1
        for j=N:-1:1
            if i<=j
                % Making sure that we remove really realted features
                if find(1 > coef(i,j) && coef(i,j) > 0.8)
                    data.Countrydata(:,i) = [];
                % Making sure that features that are related inversly are removed
                elseif find(coef(i,j) < -0.8)
                    data.Countrydata(:,j) = [];
                end
            end
        end
    end
    output = data;
end

% Running the function for all sets of data

% Making copies
% This variable will be aparent later (log transform)
xcopy = selection(x, posterior_relations);
ncopy = selection(normalization, posterior_relations);
simplified = selection(simplified, posterior_relations);

% Data transform

function out = transform(data, stats)
    % stats is the total variable, that has the max in position 2 and the min in position 3
    data.Countrydata = (data.Countrydata - min(stats(3,:)))/(max(stats(2,:))-min(stats(3,:)));
    out = data;
end

function out = logtransform(data, stats)
    % stats is the total variable, that has the max in position 2 and the min in position 3
    data.Countrydata = ((log(max(stats(2,:))))*(data.Countrydata - min(stats(3,:))))/(max(stats(2,:))-min(stats(3,:)));
    out = data;
end

% Regular transform of x
simplified = transform(simplified, total);
% log transform of x
xcopy = logtransform(xcopy, total);
% transform of normalization
ncopy = transform(ncopy, total);

% Clustering algorithm loops
% There is a general issue on how to represent the data that is this hight in dimensions
% The dimensionality issue will be discussed in the report
% Reminder
% x has the original data
% Normalization has the z score normalized data
% ncopy is the copy of the normalized data that has pruned features
% xcopy is the copy of the original data that has pruned features
% They all have both fields of the original struct

% Implementing a function to look for theta values
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
            theta(i,j) = (max(data(1,j)))*(randn()) + min(data(2,j));
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
    % [theta,bel,J] = k_means(sheet.Countrydata', theta');
    % [N, m] = size(theta);
    % for i=1:(N/3)
    %     figure(90 + i), hold on
    %     figure(90 + i), grid on
    %     for j=1:m
    %         figure(90 + i), plot3(theta(i,j), theta(i + 1,j), theta(i + 2,j), 'k+')
    %     end
    %     figure(90 + i), plot3(sheet.Countrydata(bel==1,i), sheet.Countrydata(bel==1, i+ 1), sheet.Countrydata(bel==1,i+2), 'ro')
    %     figure(90 + i), plot3(sheet.Countrydata(bel==2,i), sheet.Countrydata(bel==2, i+ 1), sheet.Countrydata(bel==2,i+2), 'g*')
    %     figure(90 + i), plot3(sheet.Countrydata(bel==3,i), sheet.Countrydata(bel==3, i+ 1), sheet.Countrydata(bel==3,i+2), 'b.')
    %     figure(90 + i), plot3(sheet.Countrydata(bel==4,i), sheet.Countrydata(bel==4, i+ 1), sheet.Countrydata(bel==4,i+2), 'ys')
    %     for k = 1:l
    %         text(sheet.Countrydata(k,i),sheet.Countrydata(k,i+1) ,sheet.Countrydata(k,i+2) , sheet.country(k), 'FontSize', 8, 'HorizontalAlignment', 'left')
    %     end
    %     if i == 1
    %         title('k-means first 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     elseif i==2
    %         title('k-means second 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     else
    %         title('k-means final 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     end
    % end

    % close all
    % k-medoids
    % [bel,cost,theta,a] = k_medoids(sheet.Countrydata', clusters, 72);
    % [N, m] = size(theta);
    % for i=1:(N/3)
    %     figure(90 + i + N/3), hold on
    %     figure(90 + i + N/3), grid on
    %     for j=1:m
    %         figure(90 + i + N/3), plot3(theta(i,j), theta(i + 1,j), theta(i + 2,j), 'k+')
    %     end
    %     figure(90 + i + N/3), plot3(sheet.Countrydata(bel==1,i), sheet.Countrydata(bel==1, i+ 1), sheet.Countrydata(bel==1,i+2), 'ro')
    %     figure(90 + i + N/3), plot3(sheet.Countrydata(bel==2,i), sheet.Countrydata(bel==2, i+ 1), sheet.Countrydata(bel==2,i+2), 'g*')
    %     figure(90 + i + N/3), plot3(sheet.Countrydata(bel==3,i), sheet.Countrydata(bel==3, i+ 1), sheet.Countrydata(bel==3,i+2), 'b.')
    %     figure(90 + i + N/3), plot3(sheet.Countrydata(bel==4,i), sheet.Countrydata(bel==4, i+ 1), sheet.Countrydata(bel==4,i+2), 'ys')
    %     for k = 1:l
    %         text(sheet.Countrydata(k,i),sheet.Countrydata(k,i+1) ,sheet.Countrydata(k,i+2) , sheet.country(k), 'FontSize', 6, 'HorizontalAlignment', 'left')
    %     end
    %     if i == 1
    %         title('k-medoids first 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     elseif i==2
    %         title('k-medoids second 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     else
    %         title('k-medoids final 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     end
    % end
    %
    % % k-medians
    % theta = generate(sheet, clusters);
    % [theta,bel,J] = k_medians(sheet.Countrydata', theta');
    % [N, m] = size(theta);
    % for i=1:(N/3)
    %     figure(90 + i + 2*N/3), hold on
    %     figure(90 + i + 2*N/3), grid on
    %     for j=1:m
    %         figure(90 + i + 2*N/3), plot3(theta(i,j), theta(i + 1,j), theta(i + 2,j), 'k+')
    %     end
    %     figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==1,i), sheet.Countrydata(bel==1, i+ 1), sheet.Countrydata(bel==1,i+2), 'ro')
    %     figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==2,i), sheet.Countrydata(bel==2, i+ 1), sheet.Countrydata(bel==2,i+2), 'g*')
    %     figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==3,i), sheet.Countrydata(bel==3, i+ 1), sheet.Countrydata(bel==3,i+2), 'b.')
    %     figure(90 + i + 2*N/3), plot3(sheet.Countrydata(bel==4,i), sheet.Countrydata(bel==4, i+ 1), sheet.Countrydata(bel==4,i+2), 'ys')
    %     for k = 1:l
    %         text(sheet.Countrydata(k,i),sheet.Countrydata(k,i+1) ,sheet.Countrydata(k,i+2) , sheet.country(k), 'FontSize', 8, 'HorizontalAlignment', 'left')
    %     end
    %     if i == 1
    %         title('k-medians first 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     elseif i==2
    %         title('k-medians second 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     else
    %         title('k-medians final 3 features')
    %         xlabel('x')
    %         ylabel('y')
    %         zlabel('z')
    %     end
    % end

    % Possibilistic
    eta = ones(1, clusters);
    [U, theta] = possibi(sheet.Countrydata', clusters, eta,1,73,1,0.01);
end

cluster(xcopy, 4);
% final2 = cluster(ncopy);
% cluster(simplified, 4);
% cluster(simplified, 3);
% cluster(simplified, 2);
% cluster(x, 4);
% supplement2 = cluster(normalization);


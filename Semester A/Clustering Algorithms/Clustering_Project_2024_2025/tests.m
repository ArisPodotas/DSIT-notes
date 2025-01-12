load('./process.mat');

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

% Clustering

% Implementing a function to generate theta values
function theta = generate(object, number, consider)
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
    theta = ones(number, consider);
    % Getting max and min of Y
    % I'm supposed to end up with a L dimensional vector
    % one dimension for each feature.
    [L,M] = size(object.Y);
    meany = zeros(L, 1);
    mediany = zeros(L, 1);
    maxy = zeros(L, 1); 
    miny = zeros(L, 1); 
    stdy = zeros(L, 1); 
    for i=1:L
        meany(i) = mean(object.Y(i,:));
        mediany(i) = median(object.Y(i,:));
        stdy(i) = std(object.Y(i,:));
        maxy(i) = max(object.Y(i,:));
        miny(i) = min(object.Y(i,:));
    end
    for i=1:number
        for j=1:consider
            % Normalized random initial value in the range [min, max]
            % for feature j
            theta(i,j) = (max(j))*(randn()) + min(j);
        end
    end
end

% We will take the average of 1000 trials
function copy = clust(object, clusters, trials)
    % In order to keep the times we will
    % make a matrix that holds all the times values for the algorithms
    % This matrix will need to me (trials)x(algorithms)
    object.times = ones(trials, 9);
    eta = ones(1, clusters);
    for i=1:trials
        % We would like to use the same initial theta values for all algorithms
        % that take cluster initialization positions
        init_theta = generate(object, clusters, 3);
        figure(9), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        % k-means
        tic;
        [theta,bel,J] = k_means(object.Y, init_theta');
        object.times(i, 1) = toc;
        figure(10)
        hold on
        grid on
        figure(10), scatter3(object.Y(1,bel==1), object.Y(2,bel==1), object.Y(3,bel==1), 'ro')
        figure(10), scatter3(object.Y(1,bel==2), object.Y(2,bel==2), object.Y(3,bel==2), 'b*')
        figure(10), scatter3(object.Y(1,bel==3), object.Y(2,bel==3), object.Y(3,bel==3), 'g+')
        figure(10), scatter3(object.Y(1,bel==4), object.Y(2,bel==4), object.Y(3,bel==4), 'y.')
        figure(10), scatter3(object.Y(1,bel==5), object.Y(2,bel==5), object.Y(3,bel==5), 'ro')
        figure(10), scatter3(object.Y(1,bel==6), object.Y(2,bel==6), object.Y(3,bel==6), 'ro')
        figure(10), scatter3(object.Y(1,bel==7), object.Y(2,bel==7), object.Y(3,bel==7), 'ro')
        figure(10), scatter3(object.Y(1,bel==8), object.Y(2,bel==8), object.Y(3,bel==8), 'ro')
        figure(10), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(10), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(10), title('K-means clustering')
        figure(10), xlabel('Component 1')
        figure(10), ylabel('Component 2')
        figure(10), zlabel('Component 3')
        saveas(10, './Images/k-means.png')
        % Possibilistic
        tic;
        [U, theta] = possibi(object.Y, clusters, eta, 1, 73, 1, 0.0001);
        object.times(i,2) = toc;
        figure(11)
        hold on
        grid on
        figure(11), scatter3()
        figure(11), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(11), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(11), title('Possibilistic clustering')
        figure(11), xlabel('Component 1')
        figure(11), ylabel('Component 2')
        figure(11), zlabel('Component 3')
        saveas(11, './Images/k-means.png')
        % Fuzzy
        tic;
        [theta, U, obj_fun] = fuzzy_c_means(object.Y, 8, 1);
        object.times(i,3) = toc;
        figure(12)
        hold on
        grid on
        figure(12), scatter3()
        figure(12), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(12), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(12), title('Possibilistic clustering')
        figure(12), xlabel('Component 1')
        figure(12), ylabel('Component 2')
        figure(12), zlabel('Component 3')
        saveas(12, './Images/k-means.png')
        % Probabilistic
        tic;
        [ap, cp, mv, mc, iter, diffvec] = GMDAS(object.Y, clusters, eta, 1, 73, 1, 59);
        object.times(i,4) = toc;
        figure(13)
        hold on
        grid on
        figure(13), scatter3()
        figure(13), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(13), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(13), title('Possibilistic clustering')
        figure(13), xlabel('Component 1')
        figure(13), ylabel('Component 2')
        figure(13), zlabel('Component 3')
        saveas(13, './Images/k-means.png')
        % single link
        tic
        % Here is the code for the clustering algorithm
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 6) = toc;
        figure(14)
        hold on
        grid on
        figure(14), scatter3()
        figure(14), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(14), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(14), title('Possibilistic clustering')
        figure(14), xlabel('Component 1')
        figure(14), ylabel('Component 2')
        figure(14), zlabel('Component 3')
        saveas(14, './Images/k-means.png')
        % complete link
        tic
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 7) = toc;
        figure(15)
        hold on
        grid on
        figure(15), scatter3()
        figure(15), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(15), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(15), title('Possibilistic clustering')
        figure(15), xlabel('Component 1')
        figure(15), ylabel('Component 2')
        figure(15), zlabel('Component 3')
        saveas(15, './Images/k-means.png')
        % WPGMC
        tic
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 8) = toc;
        figure(16)
        hold on
        grid on
        figure(16), scatter3()
        figure(16), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(16), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(16), title('Possibilistic clustering')
        figure(16), xlabel('Component 1')
        figure(16), ylabel('Component 2')
        figure(16), zlabel('Component 3')
        saveas(16, './Images/k-means.png')
        % Ward
        tic
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 9) = toc;
        figure(17)
        hold on
        grid on
        figure(17), scatter3()
        figure(17), scatter3(theta(:,1)', theta(:,2)', theta(:,3)','kx')
        figure(17), scatter3(init_theta(:,1)', init_theta(:,2)', init_theta(:,3)','kx')
        figure(17), title('Possibilistic clustering')
        figure(17), xlabel('Component 1')
        figure(17), ylabel('Component 2')
        figure(17), zlabel('Component 3')
        saveas(17, './Images/k-means.png')
    end
    % time averages
    object.finals = [mean(object.times(1));
        mean(object.times(2));
        mean(object.times(3));
        mean(object.times(4));
        mean(object.times(5));
        mean(object.times(6));
        mean(object.times(7));
        mean(object.times(8));
        mean(object.times(9))];
    copy = object;
end

x = clust(x, 8, 100);

save("clustered.mat","x", '-v7.3')

% I think this report has kept a more reasonable emphasis on the subsections of the clustering analysis
% like what had been mentioned.


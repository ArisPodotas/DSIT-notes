load('./process.mat');

% undoing a unwinding
% 1 -> 1, 1
% 2 -> 2, 1
% 150 -> 150, 1
% 151 -> 1, 2
% 152 -> 2, 2
% .
% .
% .
% 
% i -> i - N*(j-1), j += 1 if i % 150 == 0
% and % means modulo in the above equation
function copy = rewind(object, size)
    [M, L] = size(object.data);
    copy = object;
    N = size;
    copy.data = ones(N,N,L);
    copy.labels = ones(N,N);
    j = 1;
    for i=1:M
        copy.data(i - (size*(j-1)),j,:) = object.data(i,:);
        copy.labels(i - (size*(j-1)),j) = object.labels(i);
        % Why are we updating j after the iteration?
        % Because if I update it at the start
        % index 300 will have a j of 2
        % and a i - 150*j-1 of 0
        if mod(i, size) == 0
            j = j + 1;
        end
    end
end

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
    for i=1:number
        for j=1:consider
            % Normalized random initial value in the range [min, max]
            % for feature j
            theta(i,j) = (object.max(j))*(randn()) + object.min(j);
        end
    end
end

% We will take the average of 1000 trials
function copy = clust(object, clusters, trials)
    % In order to keep the times we will
    % make a matrix that holds all the times values for the algorithms
    % This matrix will need to me (trials)x(algorithms)
    object.times = ones(trials, 9);
    % These next variables are for the outputs of the algorithms
    % so essentially the clusterings
    % Each matrix will have (trials)x(outputs)
    % We use multiple matrices because we cant
    % have rows with different widths
    object.means = ones(trials, 3);
    object.possibi= ones(trials, 2);
    object.fuzzy= ones(trials, 3);
    object.prob= ones(trials, 6);
    object.slinkg= ones(trials, 9);
    object.clinkg= ones(trials, 9);
    object.ward= ones(trials, 9);
    object.wpgmc= ones(trials, 9);
    eta = ones(1, clusters);
    for i=1:trials
        % We would like to use the same initial theta values for all algorithms
        % that take cluster initialization positions
        init_theta = generate(object, clusters, 3);
        % k-means
        tic;
        [theta,bel,J] = k_means(object.Y, init_theta');
        object.means(i, 1) = theta;
        object.means(i, 2) = bel;
        object.means(i, 3) = J;
        object.times(i, 1) = toc;
        % Possibilistic
        tic;
        [U, theta] = possibi(object.Y, clusters, eta, 1, 73, 1, 0.0001);
        object.possibi(i, 1) = theta;
        object.possibi(i, 2) = U;
        object.times(i,3) = toc;
        % Fuzzy
        tic;
        [theta, U, obj_fun] = fuzzy_c_means(object.Y, 8, 1);
        object.fuzzy(i, 1) = theta;
        object.fuzzy(i, 2) = U;
        object.fuzzy(i, 3) = obj_fun;
        object.times(i,4) = toc;
        % Probabilistic
        tic;
        [ap, cp, mv, mc, iter, diffvec] = GMDAS(object.Y, clusters, eta, 1, 73, 1, 59);
        object.prob(i, 1) = ap;
        object.prob(i, 2) =  cp;
        object.prob(i, 3) =  mv;
        object.prob(i, 4) =  mc;
        object.prob(i, 5) =  iter;
        object.prob(i, 6) =  diffvec;
        object.times(i,5) = toc;
        % single link
        tic
        % Here is the code for the clustering algorithm
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 6) = toc;
        % complete link
        tic
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 7) = toc;
        % WPGMC
        tic
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 8) = toc;
        % Ward
        tic
        Z = linkage(X,'ward','euclidean');
        cl_label = cluster(Z,'maxclust',8);
        cr_tab=crosstab(cl_label,y);
        dendrogram(Z)
        object.times(i, 9) = toc;
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


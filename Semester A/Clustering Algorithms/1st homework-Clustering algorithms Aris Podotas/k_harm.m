function [theta,bel,J]=k_harm(X,theta)

% FUNCTION [theta,bel,J]=k_harm(X,theta)
% This function implements the k-harmonic mean algorithm, which requires
% as input the number of clusters underlying the data set. The algorithm
% starts with an initial estimation of the cluster representatives and
% iteratively tries to move them into regions that are "dense" in data
% vectors, so that a suitable cost function is minimized. This is
% achieved by performing (usually) a few passes on the data set. The
% algorithm terminates when the values of the cluster representatives
% remain unaltered between two successive iterations.
%
% INPUT ARGUMENTS:
%  X:       lxN matrix, each column of which corresponds to
%           an l-dimensional data vector.
%  theta:   a matrix, whose columns contain the l-dimensional (mean)
%           representatives of the clusters.
%
% OUTPUT ARGUMENTS:
%  theta:   a matrix, whose columns contain the final estimations of
%           the representatives of the clusters.
%  bel:     N-dimensional vector, whose i-th element contains the
%           cluster label for the i-th data vector.
%  J:       the value of the cost function (reciprocal of the mean of the reciprocal values of x) that corresponds to the  estimated clustering.

% Initialization of the variables
[l,N]=size(X);
[l,m]=size(theta);
e=1;
iter=0;
while(e~=0)
    iter=iter+1;
    theta_old=theta;
    dist_all=[];
    for j=1:m
        % compute the distance between the cluster representative and the data vectors
        dist=sum(((ones(l, N)'/X' -[1; 1]'/(theta(:,j)'+[0.1; 0.1]')).^2)');
        %% 
        % append the distnce to the distane list
        dist_all=[dist_all; dist];
    end
    [q1,bel]=min(dist_all);
    J=sum(min(dist_all));
    
    for j=1:m
        if(sum(bel==j)~=0)
            for r=1:l
                theta(r,j)=l*sum(bel==j)/(sum((bel==j)/X(r,:)));
            end
        end
    end
    e=sum(sum(abs(theta-theta_old)));
end


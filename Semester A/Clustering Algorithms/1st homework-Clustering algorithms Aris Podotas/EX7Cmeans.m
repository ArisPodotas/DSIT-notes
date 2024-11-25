% This file is for the first requirement of exercise 6.
l = 2;  % The dimension of the data vectors
N = 100;  % The number of data vectors
% This will be the theta input into the algorithm
theta = [0, 20, 0, 20; 0, 0, 20, 20];

randn('seed',0)
m = [10 10; 20 10; 10 19; 19 18]; % The distribution means of the clusters
S(:,:,1)=eye(2);
S(:,:,2)=[1.0 .2; .2 1.5];
S(:,:,3)=[1.0 .4; .4 1.1];
S(:,:,4)=[.3 .2; .2 .5];
n_points=N*ones(1,5);
noise=rand(2,100)*16+6;
X=[];

figure(1), hold on
for i=1:4
    X=[X; mvnrnd(m(i,:),S(:,:,i),n_points(i))];
end
X=X';
X=[X, noise];

% Plotting the way the data should be.
for i=1:5 
    figure(1), plot(X(1,(i-1)*100+1:i*100),X(2,(i-1)*100+1:i*100),'.', 'Color', rand(1, 3))
end
figure(1), axis equal

% run the algorithm
[theta,bel,J]=k_means(X,theta);

% Plot the clusters
figure(2), hold on
figure(2), plot(X(1,bel==1),X(2,bel==1),'r.',...
X(1,bel==2),X(2,bel==2),'g*',X(1,bel==3),X(2,bel==3),'bo',...
X(1,bel==4),X(2,bel==4),'cx',X(1,bel==5),X(2,bel==5),'md',...
X(1,bel==6),X(2,bel==6),'yp',X(1,bel==7),X(2,bel==7),'ks')
figure(2), plot(theta(1,:),theta(2,:),'k+')
figure(2), axis equal



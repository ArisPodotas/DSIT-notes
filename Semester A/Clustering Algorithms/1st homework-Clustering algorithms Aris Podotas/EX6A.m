% This file is for the first requirement of exercise 6.
N = 100;  % The number of data vectors

randn('seed',0)
m = [10 10; 20 10; 10 19; 19 18]; % The distribution means of the clusters
S(:,:,1)=eye(2);
S(:,:,2)=[1.0 .2; .2 1.5];
S(:,:,3)=[1.0 .4; .4 1.1];
S(:,:,4)=[.3 .2; .2 .5];
n_points=N*ones(1,4);
X=[];

figure(1), hold on
for i=1:4
    X=[X; mvnrnd(m(i,:),S(:,:,i),n_points(i))];
end
X=X';

for i=1:4 
    figure(1), plot(X(1,(i-1)*100+1:i*100),X(2,(i-1)*100+1:i*100),'.', 'Color', rand(1, 3))
end
figure(1), axis equal


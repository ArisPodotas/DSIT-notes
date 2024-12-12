% This is a script for homework 2 - period 2020-2021
clear
format compact
close all
rand('seed',0)
randn('seed',0)

load data_country
X=Countrydata;
[N,l]=size(X);
clear Countrydata

%Computing the correlation coefficient for the raw data
c=corrcoef(X)

%Normalizing each row as a zero mean unit variance distributions
X1=(X-ones(N,1)*mean(X)) ./ (ones(N,1)*std(X));
c1=corrcoef(X1)

%Normalizing each row in the min-max range
X2=(X-ones(N,1)*min(X)) ./ (ones(N,1)*(max(X)-min(X)));
c2=corrcoef(X2)

% Clustering of the data with k-means. For each m we perform s=10 different
% runs, with different initializations
J_tot=[];
for m=2:15
    m
    J_temp=[];
    for s=1:100
        te=randperm(N);
        theta_ini=X(te(1:m),:);
        theta=theta_ini;
        [theta,bel,J]=k_means(X',theta');
        J_temp=[J_temp J];
    end
    J=mean(J_temp);
    J_tot=[J_tot J];
end

figure(1), plot(2:1:15,J_tot,'b')

% Run for the best clustering m=4
m=6;
J_temp=[];
bel_temp=[];
for s=1:50
    te=randperm(N);
    theta_ini=X(te(1:m),:);
    theta=theta_ini;
    [theta,bel,J]=k_means(X',theta');
    J_temp=[J_temp J];
    bel_temp=[bel_temp; bel];
end
[J,pos]=min(J_temp);
bel_best=bel_temp(pos,:);

% For the best clustering derive the mean and the std per feature, for each
% cluster
mean_tot=[];
std_tot=[];
cardinali=[];

for i=1:m
    qw=find(bel_best==i);
    cardinali=[cardinali length(qw)];
    mean_tot=[mean_tot; mean(X(qw,:))];
    std_tot=[std_tot; std(X(qw,:))];
    clust_country{i}=country(qw);
end

for j=1:l
    [mean_tot(:,j) std_tot(:,j)]
end
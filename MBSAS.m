function [bel, m]=MBSAS(X,theta,q,order)
% Ordering the data
[l,N]=size(X);
if(length(order)==N)
X1=[];
for i=1:N
X1=[X1 X(:,order(i))];
end
X=X1;
clear X1
end
% Cluster determination phase
n_clust=1; % no. of clusters
[l,N]=size(X);
bel=zeros(1,N);
bel(1)=n_clust;
m=X(:,1);
for i=2:N
[m1,m2]=size(m);
% Determining the closest cluster representative
[s1,s2]=min(sqrt(sum((m-X(:,i)*ones(1,m2)).^ 2)));
if(s1>theta) && (n_clust<q)
n_clust=n_clust+1;
bel(i)=n_clust;
m=[m X(:,i)];
end
end
[m1,m2]=size(m);
% Pattern classification phase(*4)
for i=1:N
if(bel(i)==0)
% Determining the closest cluster representative(*7)
[s1,s2]=min(sqrt(sum((m-X(:,i)*ones(1,m2)).^ 2)));
bel(i)=s2;
m(:,s2)=((sum(bel==s2)-1)*m(:,s2) + X(:,i))/sum(bel==s2);
end
end
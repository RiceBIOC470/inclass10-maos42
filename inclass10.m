%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points
%GB comments
1)100
2)100
3)95 line graphs are not appropriate way to represent the data. Next time, use a scatter plot function.   
4)100
overall: 99


%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.

load('example_data.mat');
[coeff, sc, eig] = pca(dat)

%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 

eig

% eig =
% 
%     5.6314
%     0.1830
%     0.0958
%     0.0860
%     0.0823
%     0.0805
%     0.0732
%     0.0681

%Miguel Angel: Just one, because the variance within the rest is too
%little.

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 

ids=kmeans(dat,3);
tt=[0.25 0.5 1 2 3 5 7 8];
for ii=1:3
    inds=ids==ii;
    subplot(1,3,ii);
    plot(tt,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster' int2str(ii), ' ngenes: ' int2str(sum(inds))]);
end
    
colors={'r','g','b','c','m','k','y'};
figure; hold on;
plot(sc(:,1), sc(:,2), 'r.', 'LineWidth',2,'MarkerSize',24);
plot(sc(end,1),sc(end,2),'k.','MarkerSize',24);
xlabel('PC1','FontSize',32);
ylabel('PC2','FontSize',32);

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?

%Miguel Angel: If we look closer at the graphs, cluster 1 and 6 have the
%same behavior, same as for cluster 2 and 5. Finally, cluster 3, 4 and 7
%behave similar as well. Which means that with only 3 clusters is enough to
%account for the rest of the data.

ids=kmeans(dat,7);
tt=[0.25 0.5 1 2 3 5 7 8];
for ii=1:7
    inds=ids==ii;
    subplot(4,2,ii);
    plot(tt,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster' int2str(ii), ' ngenes: ' int2str(sum(inds))]);
end

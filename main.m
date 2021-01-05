% find non zero pixels
[pixels_dataset, labels] = code_for_project();

% normalization
pixels_dataset = normalize(pixels_dataset);

% pca
[eigenval,eigenvec,explain,Y,mean_vec]=pca_fun(pixels_dataset',3);
dataset = Y';

% plot the dataset after pca
plot_pca(dataset,labels, explain)

% CFO
number_of_clusters = 8;
cfo(dataset,number_of_clusters,'fuzzy')
C = confusionmat(labels,c);
figure()
confusionchart(C)

% % Hierarchical
% % Complete Link
% Z_complete = linkage(dataset,'complete','minkowski');
% c = cluster(Z_complete,'Maxclust',length(unique(labels)));
% figure()
% scatter3(dataset(:,1),dataset(:,2),dataset(:,3),1,c);
% % confusion matrix
% C = confusionmat(labels,c);
% confusionchart(C)
% 
% % Ward
% Z_ward = linkage(dataset,'ward');
% c = cluster(Z_ward,'Maxclust',length(unique(labels)));
% figure()
% scatter3(dataset(:,1),dataset(:,2),dataset(:,3),1,c);
% % confusion matrix
% C = confusionmat(labels,c);
% confusionchart(C)
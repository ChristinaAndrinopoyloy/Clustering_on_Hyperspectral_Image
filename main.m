% find non zero pixels
[pixels_dataset, labels] = code_for_project();

% normalization
pixels_dataset = normalize(pixels_dataset);

% pca
[eigenval,eigenvec,explain,Y,mean_vec]=pca_fun(pixels_dataset',3);
dataset = Y';

% plot the dataset after pca
plot_pca(dataset,labels, explain,'DataSet after PCA')

% CFO
% number_of_clusters = 8;
% for number_of_clusters = 3:10
%     predict_labels = cfo(dataset,number_of_clusters,'kmeans');
% %     plot_dataset(dataset, predict_labels,int2str(number_of_clusters))
% end

% figure()
% plotconfusion(categorical(labels),categorical(predict_labels))

% Hierarchical
for number_of_clusters=7:8
    predict_labels = hier_clustering(dataset,number_of_clusters,'ward');
    [conttbl,~,~,~] = crosstab(labels,predict_labels);
    figure()
    heatmap(conttbl)
end
% find non zero pixels
[pixels_dataset, labels] = code_for_project();

% normalization
% figure()
% boxplot(pixels_dataset);
% xlabel('Features')
% ylabel('Range of Values')
% title('Dataset Statistics before Standard Normalization')
pixels_dataset = normalize(pixels_dataset);
% figure()
% boxplot(pixels_dataset);
% xlabel('Features')
% ylabel('Range of Values')
% title('Dataset Statistics after Standard Normalization')

% pca
[~,~,explain,Y,~]=pca_fun(pixels_dataset',3);
dataset = Y';

% plot the dataset after pca
% plot_pca(dataset,labels, explain,'DataSet after PCA')

% select number of clusters
get_number_of_clusters(dataset','kmeans');

kind_of_clustering = 'CFO';
switch kind_of_clustering
    case 'CFO'
        predict_labels = cfo(dataset,7,'kmeans');
        %     plot_dataset(dataset, predict_labels,int2str(number_of_clusters))
    case 'hier'    
        predict_labels = hier_clustering(dataset,7,'ward');
%         [conttbl,~,~,~] = crosstab(labels,predict_labels);
%         figure()
%         heatmap(conttbl);
%         end
    otherwise
        disp('Error')
end     

 view_image(predict_labels);

% figure()
% plotconfusion(categorical(labels),categorical(predict_labels))
disp('END')

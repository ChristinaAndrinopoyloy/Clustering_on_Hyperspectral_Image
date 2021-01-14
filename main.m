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
% seeds = get_number_of_clusters(dataset','.');
% number_of_clusters = input('Give the number of clusters, please:');
% if ~isempty(seeds)
%     seed = seeds(number_of_clusters);
% else
%     seed = [];
% end

kind_of_clustering = 'hier';
switch kind_of_clustering
    case 'CFO'
        predict_labels = cfo(dataset,number_of_clusters,'possibilistic',seed);
%         plot_dataset(dataset, predict_labels,'Dataset after Kmeans')
    case 'hier'    
        predict_labels = hier_clustering(dataset,'WPGMC');
%         [conttbl,~,~,~] = crosstab(labels,predict_labels);
%         figure()
%         heatmap(conttbl);
%         end
    otherwise
        disp('Error')
end     

%  view_image(predict_labels); 

% figure()
% plotconfusion(categorical(labels),categorical(predict_labels))
disp('END')

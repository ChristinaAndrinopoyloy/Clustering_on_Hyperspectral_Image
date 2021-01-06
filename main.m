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
plot_pca(dataset,labels, explain,'DataSet after PCA')

% select number of clusters
% get_number_of_clusters(dataset');

kind_of_clustering = 'hier';
switch kind_of_clustering
    case 'CFO'
        for number_of_clusters = 3:10
            predict_labels = cfo(dataset,number_of_clusters,'kmeans');
        %     plot_dataset(dataset, predict_labels,int2str(number_of_clusters))
        end
    case 'hier'    
%         for number_of_clusters=4:10
        number_of_clusters = 8;
        predict_labels = hier_clustering(dataset,number_of_clusters,'ward');
%         [conttbl,~,~,~] = crosstab(labels,predict_labels);
%         figure()
%         heatmap(conttbl);
        view_image(predict_labels);
%         end
    otherwise
        disp('Error')
end     



% figure()
% plotconfusion(categorical(labels),categorical(predict_labels))
disp('END')

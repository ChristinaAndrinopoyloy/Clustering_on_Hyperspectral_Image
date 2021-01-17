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
% seeds = get_number_of_clusters(dataset','fuzzy');
seeds = [];
number_of_clusters = input('Give the number of clusters, please:');
if ~isempty(seeds)
    seed = seeds(number_of_clusters);
else
    seed = [];
end

kind_of_clustering = 'hier';
switch kind_of_clustering
    case 'CFO'
        predict_labels = cfo(dataset,number_of_clusters,'probabilistic',seed);
%         plot_dataset(dataset, predict_labels,'Dataset after Kmeans')
        if number_of_clusters == 8
            [tbl,chi2,~,lbls] = crosstab(labels,predict_labels);

            [assignment,cost] = munkres(-tbl');

            new_label = zeros(1,length(predict_labels));
            for i=1:8
                new_label(predict_labels==i)=assignment(i);
            end
            C = confusionmat(new_label,labels);
            figure()
            heatmap(C);
            xlabel('Predicted Labels')
            ylabel('Real Labels')
            acc = sum(diag(C))/length(predict_labels)
        end   
    case 'hier'    
        predict_labels = hier_clustering(dataset,number_of_clusters,'ward');
        if number_of_clusters == 8
            [tbl,chi2,~,lbls] = crosstab(labels,predict_labels);

            [assignment,cost] = munkres(-tbl');

            new_label = zeros(1,length(predict_labels));
            for i=1:8
                new_label(predict_labels==i)=assignment(i);
            end
            C = confusionmat(new_label,labels);
            figure()
            heatmap(C);
            xlabel('Predicted Labels')
            ylabel('Real Labels')
            acc = sum(diag(C))/length(predict_labels)
        end    
    otherwise
        disp('Error')
end     

 view_image(predict_labels); 
 figure()
silhouette(dataset,predict_labels)
 title('Silhouette')
 disp('END')

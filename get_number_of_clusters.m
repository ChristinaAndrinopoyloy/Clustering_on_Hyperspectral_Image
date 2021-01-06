function []=get_number_of_clusters(dataset)
    total_cost = [];
    clusters = [];
    for m=3:20
        [theta]=rand_data_init(dataset,m,1);
        [~,~,J]=k_means(dataset,theta);
        total_cost = [total_cost;J];
        clusters = [clusters;m];
    end
    figure()
    plot(clusters, total_cost)
    
   
%     clusters = [];
%     distances = [];
%     for dist_threshold = 1.0:0.5:20.0
%         temp_clusters = [];
%         for i=1:10
%             [~, m]=MBSAS(dataset,dist_threshold,20,[]);
%             number_of_clusters = size(m);
%             temp_clusters = [temp_clusters;number_of_clusters(2)];
%         end
%        clusters = [clusters;mode(temp_clusters(:))];
%        distances = [distances;dist_threshold];
%     end    
%     figure()
%     plot(clusters, distances)
%     xlabel('Number of Clusters')
%     ylabel('Threshold of Distance')
%     title('Number of Clusters VS Threshold of Distance')
end
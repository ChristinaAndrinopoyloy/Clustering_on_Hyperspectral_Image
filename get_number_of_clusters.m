function []=get_number_of_clusters(dataset,approach)
    
    switch approach
        case 'kmeans'
            total_cost = [];
            clusters = [];
            for m=3:20
                J_temp = [];
                for i=1:10
                    [theta]=rand_data_init(dataset,m,1);
                    [~,~,J]=k_means(dataset,theta);
                    J_temp = [J_temp;J];
                end    
                J_optimal = min(J_temp);
                total_cost = [total_cost;J_optimal];
                clusters = [clusters;m];
            end
            figure()
            plot(clusters, total_cost)
            xlabel('Number of Clusters')
            ylabel('Cost')
            title('Number of Clusters VS Cost')
        case 'MBSAS'       
            clusters = [];
            distances = [];
            for dist_threshold = 1.0:0.5:20.0
                temp_clusters = [];
                for i=1:10
                    [~, m]=MBSAS(dataset,dist_threshold,20,[]);
                    number_of_clusters = size(m);
                    temp_clusters = [temp_clusters;number_of_clusters(2)];
                end
               clusters = [clusters;mode(temp_clusters(:))];
               distances = [distances;dist_threshold];
            end    
            figure()
            plot(clusters, distances)
            xlabel('Number of Clusters')
            ylabel('Threshold of Distance')
            title('Number of Clusters VS Threshold of Distance')
        case 'fuzzy'
            figure()
            for q=1.5:0.5:4.0
                options = [q NaN NaN 0];
                clusters = [];
                pc = [];
                pe = [];
                for number_of_clusters=2:15
                    [~,U] = fcm(dataset',number_of_clusters, options);
                    clusters = [clusters;number_of_clusters];
                    pc = [pc;partition_coefficient(U')];
                    pe = [pe;entropy_partition_coefficient(U')];
                end  
                subplot(1,2,1)
                plot(clusters, pc)
                text(max(clusters),pc(length(pc))+0.001,num2str(q))
                xlabel('Number of Clusters')
                ylabel('Parition Coefficient')
                title('Partition Coefficient VS  Number of Clusters')
                hold on
                
                subplot(1,2,2)
                plot(clusters, pe)
                text(max(clusters),pe(length(pe))+0.001,num2str(q))
                xlabel('Number of Clusters')
                ylabel('Entropy Parition Coefficient')
                title('Entropy Partition Coefficient VS  Number of Clusters')
                hold on
            end    
            hold off
        otherwise 
            disp('Error: No approach')
    end    
end
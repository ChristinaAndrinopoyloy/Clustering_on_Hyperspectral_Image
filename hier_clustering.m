function [c]=hier_clustering(dataset, number_of_clusters, algorithm)
    switch algorithm
        case 'complete'
            % Complete Link
            Z_complete = linkage(dataset,'complete','minkowski');
            c = cluster(Z_complete,'Maxclust',number_of_clusters);
            figure()
            scatter3(dataset(:,1),dataset(:,2),dataset(:,3),5,c);
            figure()
            dendrogram(Z_complete)
        case 'ward'
            % Ward
            Z_ward = linkage(dataset,'ward');
            c = cluster(Z_ward,'Maxclust',number_of_clusters);
%             figure()
%             scatter3(dataset(:,1),dataset(:,2),dataset(:,3),5,c);
%             figure()
%             dendrogram(Z_ward)
        case 'WPGMC'
            Z_complete = linkage(dataset,'median');
            c = cluster(Z_complete,'Maxclust',number_of_clusters);
            figure()
            scatter3(dataset(:,1),dataset(:,2),dataset(:,3),5,c);
        otherwise
            disp('Error: There is no CFO algorithm with this name')
    end    
end
function [c]=hier_clustering(dataset, number_of_clusters, algorithm)
    switch algorithm
        case 'complete'
            Z = linkage(dataset,'complete');
        case 'ward'
            Z = linkage(dataset,'ward');
        case 'WPGMC'
            Z = linkage(dataset,'median');
        otherwise
            disp('Error: There is no CFO algorithm with this name')
    end    
    c = cluster(Z,'Maxclust',number_of_clusters);
%     figure()
%     scatter3(dataset(:,1),dataset(:,2),dataset(:,3),5,c);
%     figure()
%     dendrogram(Z)
end
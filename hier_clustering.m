function [c]=hier_clustering(dataset, algorithm)
    switch algorithm
        case 'complete'
            Z = linkage(dataset,'complete');
        case 'ward'
            Z = linkage(dataset,'ward');
        case 'WPGMC'
            Z = linkage(dataset,'median');
        otherwise
            disp('Error: There is no hierarchical algorithm with this name')
    end    
%     figure()
%     dendrogram(Z,13908)
%     xlabel('Nodes - Patterns')
%     tlt = "Agglomerative Clustering (" + algorithm + ")";
%     title(tlt)
    
    termination = input('Stop?','s');
    while strcmp(termination,'no')
        number_of_clusters = input('Give the number of clusters, please:');
     
        c = cluster(Z,'Maxclust',number_of_clusters);
%         cuttoff = input('Give the cutoff, please:');
%         depth = input('Give the depth, please:');
%         c = cluster(Z,'cutoff',cuttoff, 'Criterion', 'distance');
        
%         uv = unique(c)
%         n = histc(c,uv)
%         [~,i] = min(n);
%         minmode = uv(i);
%         if minmode < 50
%            disp('remove outliers')
%            
%         end    

        figure()
        scatter3(dataset(:,1),dataset(:,2),dataset(:,3),5,c);
        xlabel('PC1')
        ylabel('PC2')
        zlabel('PC3')
        tlt = "Dataset after Agglomerative Clustering (" + algorithm + ")";
        title(tlt)

        figure()
        scatter(dataset(:,1),dataset(:,2),5,c);
        xlabel('PC1')
        ylabel('PC2')
        title(tlt)
        
        view_image(c); 
         
        termination = input('Stop?','s');
    end    
    
end
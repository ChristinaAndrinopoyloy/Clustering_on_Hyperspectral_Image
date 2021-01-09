function [eta]=find_eta(dataset,number_of_clusters)
    q = 1.5;
    options = [q NaN NaN 0];
    [cluster_representatives,U] = fcm(dataset,number_of_clusters, options);
    U = U';
    size_of_u = size(U);
    size_of_dataset = size(dataset);
    size_of_cluster_representatives = size(cluster_representatives);
    eta = [];
    for j=1:size_of_cluster_representatives(1)
        numerator = 0;
        denominator = 0;
        for i=1:size_of_dataset(1)
            numerator = U(i,j)^q * sqrt(distan(dataset(i),cluster_representatives(j)));
            denominator = U(i,j)^q;
        end
        eta = [eta;numerator/denominator];
    end    
end
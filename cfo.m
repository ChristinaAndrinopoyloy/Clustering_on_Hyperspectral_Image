function []=cfo(dataset, number_of_clusters,algorithm)

    switch algorithm
        case 'kmeans'
            [idx,C] = kmeans(dataset,number_of_clusters);
            disp(idx)
            disp(C)
        case 'fuzzy'
            [centers,U] = fcm(dataset,number_of_clusters);
            disp(centers)
            disp(U)
        otherwise
            disp('Error: There is no CFO algorithm with this name')
    end    
end
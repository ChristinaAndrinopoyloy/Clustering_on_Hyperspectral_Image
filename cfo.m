function [predict_labels]=cfo(dataset, number_of_clusters,algorithm)

    switch algorithm
        case 'kmeans'
            [predict_labels,~] = kmeans(dataset,number_of_clusters);
        case 'fuzzy'
            [centers,U] = fcm(dataset,number_of_clusters);
            disp(centers)
            disp(U)
        case 'possibilistic'
            disp('possibilistic')
        case 'probabilistic'
            disp('probabilistic')
        otherwise
            disp('Error: There is no CFO algorithm with this name')
    end    
end
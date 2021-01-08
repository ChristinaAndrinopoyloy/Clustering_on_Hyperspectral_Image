function [predict_labels, U]=cfo(dataset, number_of_clusters,algorithm)
    U = [];
    switch algorithm
        case 'kmeans'
            [predict_labels,~] = kmeans(dataset,number_of_clusters);
        case 'fuzzy'
            options = [1.5 NaN NaN 0];
            [predict_labels,U] = fcm(dataset,number_of_clusters, options);
            plot_fuzzy(number_of_clusters,predict_labels,U,dataset)
        case 'possibilistic'
            disp('possibilistic')
        case 'probabilistic'
            disp('probabilistic')
        otherwise
            disp('Error: There is no CFO algorithm with this name')
    end    
end
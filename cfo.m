function [predict_labels, U]=cfo(dataset, number_of_clusters,algorithm,seed)
    U = [];
    switch algorithm
        case 'kmeans'
%             [predict_labels,~] = kmeans(dataset,number_of_clusters);
                [theta]=rand_data_init(dataset',number_of_clusters,seed);
                [~,predict_labels,~]=k_means(dataset',theta);
        case 'fuzzy'
            options = [1.5 NaN NaN 0];
            [predict_labels,U] = fcm(dataset,number_of_clusters, options);
            plot_fuzzy(number_of_clusters,predict_labels,U,dataset)
        case 'possibilistic'
            eta = find_eta(dataset,number_of_clusters)
            [U,predict_labels]=possibi(dataset',number_of_clusters,eta,1,0,3,0.01);
            plot_possibilistic(number_of_clusters,predict_labels',dataset,'Possibilistic Clustering')
        case 'probabilistic'
            disp('probabilistic')
        otherwise
            disp('Error: There is no CFO algorithm with this name')
    end    
end
function [predict_labels, U]=cfo(dataset, number_of_clusters,algorithm,seed)
    U = [];
    switch algorithm
        case 'kmeans'
%             [predict_labels,~] = kmeans(dataset,number_of_clusters);
                [theta]=rand_data_init(dataset',number_of_clusters,seed);
                [~,predict_labels,~]=k_means(dataset',theta);
        case 'fuzzy'
            options = [2.0 NaN NaN 0];
            [theta,U] = fcm(dataset,number_of_clusters, options);
            predict_labels = plot_fuzzy(number_of_clusters,theta,U,dataset);
        case 'possibilistic'
            q = 3.5;
            eta = find_eta(dataset,number_of_clusters,q)
            [U,predict_labels]=possibi(dataset',number_of_clusters,eta,q,0,3,0.01);
            plot_possibilistic(number_of_clusters,predict_labels',dataset,'Possibilistic Clustering')
        case 'probabilistic'
            [theta]=rand_data_init(dataset',number_of_clusters,0);
            v = ones(3,1); 
            D = diag(v);
            for i=1:number_of_clusters
               cov(:,:,i) = D; 
            end 
            [~,~,mv,mc,~,~]=GMDAS(dataset',theta,cov,0.1,10,0);
            plot_probabilistic(dataset, mv', mc)
            
        otherwise
            disp('Error: There is no CFO algorithm with this name')
    end    
end
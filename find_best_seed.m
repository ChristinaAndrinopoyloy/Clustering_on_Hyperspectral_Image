function [seeds]=find_best_seed(dataset)
    for m=3:20
        J_temp = [];
        for i=1:10
            [theta]=rand_data_init(dataset,m,i);
            [~,~,J]=k_means(dataset,theta);
            J_temp = [J_temp;J];
        end    
        [~, seed_optimal] = min(J_temp);
        seeds = [seeds;seed_optimal];
    end
end

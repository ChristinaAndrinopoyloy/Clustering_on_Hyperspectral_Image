function [labels]=get_fuzzy_labels(index, index3, number_of_clusters)
    labels=zeros(13908,1);
    temp_labels = [];
    for i=1:number_of_clusters
        temp_labels = index{i};
        for j=1:length(temp_labels)
            idx = temp_labels(j);
            labels(idx) = i;
        end    
    end   
    for i=1:length(index3)
       labels(index3(i)) = 0; 
    end    
end
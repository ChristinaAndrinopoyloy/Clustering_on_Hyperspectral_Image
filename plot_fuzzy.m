function [labels]=plot_fuzzy(number_of_clusters, centers, U, data) 

% Classify the data points.
    maxU = max(U);
    index = {};
    for i=1:number_of_clusters
        temp = find(U(i,:) == maxU);
        index{i} = temp;
    end    
    
    % Find data points with lower maximum membership values.
    index3 = find(maxU < 0.01);
    
    labels = get_fuzzy_labels(index, index3, number_of_clusters);
    % Plot the results.
     figure()
     colors = rand(number_of_clusters, 3);
     for i=1:number_of_clusters
%         disp(colors(i))
        plot(data(index{i},1),data(index{i},2),'.', 'MarkerEdgeColor',colors(i,:), 'MarkerFaceColor',colors(i,:))
        hold on
     end   
    plot(data(index3,1),data(index3,2),'ok','MarkerSize',2)
    for i=1:number_of_clusters
        plot(centers(i,1),centers(i,2),'xk','MarkerSize',8,'LineWidth',2)
        hold on
    end 
     title('Probabilistic Clustering')
     xlabel('PC1')
     ylabel('PC2')
   hold off
end    
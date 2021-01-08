function []=plot_fuzzy(number_of_clusters, centers, U, data) 

% Classify the data points.
    maxU = max(U);
    index = {};
    for i=1:number_of_clusters
        temp = find(U(i,:) == maxU);
        index{i} = temp;
    end    
    
    % Find data points with lower maximum membership values.
    index3 = find(maxU < 0.6);
    
    % Plot the results.
     figure()
     title('Fuzzy c-means')
     xlabel('PC1')
     ylabel('PC2')
%      colors = rand(number_of_clusters, 3);
     for i=1:number_of_clusters
%          disp(colors(i))
        plot(data(index{i},1),data(index{i},2),'.')
        hold on
     end   
    plot(data(index3,1),data(index3,2),'xk','LineWidth',2)
    for i=1:number_of_clusters
        plot(centers(i,1),centers(i,2),'xk','MarkerSize',8,'LineWidth',2)
        hold on
    end 
   hold off
end    
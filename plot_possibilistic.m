function []=plot_possibilistic(number_of_clusters, centers, data, plottitle)
     figure()
     scatter(data(:,1),data(:,2),1, '.c');
     hold on
     for i=1:number_of_clusters
        plot(centers(i,1),centers(i,2),'xk','MarkerSize',7,'LineWidth',1)
        hold on
     end 
     title(plottitle)
     hold off
end
function []=plot_probabilistic(dataset, predicted_means, predicted_covs, number_of_clusters)
    
    figure()
    scatter(dataset(:,1), dataset(:,2), 3)
    hold on
    scatter(predicted_means(:,1),predicted_means(:,2),40,'MarkerEdgeColor',[0.6350 0.0780 0.1840],'MarkerFaceColor',[0.6350 0.0780 0.1840],'LineWidth',1.5);
    predicted_means(1,:)
    predicted_covs(:,:,1)
    f = pdf('Normal','mu',predicted_means(1,:),'sigma',predicted_covs(:,:,1));
    fcontour(f)
    
    title('Dataset after Probabilistic Clustering')
    xlabel('PC1')
    ylabel('PC2')

end
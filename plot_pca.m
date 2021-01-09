function []=plot_pca(dataset, labels, explain, plotitle)

figure()
pareto(explain)
xlabel('Principal Component')
ylabel('Variance Explained (%)')

figure()
colors = rand(length(unique(labels)), 3); % generate random rgb triples
                                       % according to the number of clusters
Colormap = colors(labels, :);
scatter3(dataset(:,1),dataset(:,2),dataset(:,3),1,Colormap);
% scatter(dataset(:,1),dataset(:,2),1,Colormap);
title(plotitle)
xlabel('PC1')
ylabel('PC2')
zlabel('PC3')

figure()
scatter(dataset(:,1),dataset(:,2),1,Colormap);
title(plotitle)
xlabel('PC1')
ylabel('PC2')

end
function []=view_image(predicted_y)
    % The following code can be used after the execution of an algorithm 
    % Let "cl_label" be the px-dimensional vector, whose i-th element is the label
    % of the class where the i-th vector in X has been assigned
    % The code below, helps in depicting the results as an image again
%     clear
%     format compact
%     close all

    load Salinas_Data

    [p,n,l]=size(Salinas_Image); % Size of the Salinas cube
    
    L=reshape(Salinas_Labels,p*n,1);
    existed_L=(L>0);
    
    cl_label = predicted_y;
    
    cl_label_tot=zeros(p*n,1);
    cl_label_tot(existed_L)=cl_label;
    im_cl_label=reshape(cl_label_tot,p,n);
    figure(), imagesc(im_cl_label), axis equal
    figure(), imagesc(Salinas_Labels), axis equal
end
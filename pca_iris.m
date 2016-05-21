clear
load('iris.mat');

% PCA1: Perform PCA using covariance.
[PC, V] = pca1(X);

[M, N] = size(X);
meanArr = zeros(1, N);
X_m = zeros(M,N);
X_n = zeros(M,N);

for i = 1 : M
    X_m(i, :) = repmat( mean(X(i, :)) , 1, N);
end

x_f = X - X_m;
U_t = transpose(PC);
Z = U_t * x_f; %z is a M-dimensional vector encoding a data point x

%---- VISUALIZE IN LOW DIMENTIONS ( 2 ) ------------

c = linspace(1,2,length(Z)); % set colors
subplot(1, 3,1);
scatter(Z(1,:), Z(2,:), [], c);
daspect([1 1 1]);
title('Projection of the data on PC1-PC2');
xlabel('PC1');
ylabel('PC2');

subplot(1, 3,2);
scatter(Z(1,:), Z(3,:), [], c);
daspect([1 1 1]);
title('Projection of the data on PC1-PC3');
xlabel('PC1');
ylabel('PC3');


subplot(1, 3,3);
scatter(Z(2,:), Z(3,:), [], c);
daspect([1 1 1]);
title('Projection of the data on PC2-PC3');
xlabel('PC2');
ylabel('PC3');

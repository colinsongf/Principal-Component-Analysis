clear
load('digit.mat');

[n, ImageNumber] = size(train);
[n1, ImageNumber1] = size(test);

N = 784;
VectorImageMatrix = zeros(N,ImageNumber);
VectorImageMatrix1 = zeros(N,ImageNumber1);
MeanMatrix1 = zeros(N,ImageNumber1);

% reshape the matrix for each image in a vector
for i = 1 : ImageNumber
    X = train{i};
    v = reshape(X,[],1);
    VectorImageMatrix(:,i) = v;
end

for i = 1 : ImageNumber1
    X1 = test{i};
    v1 = reshape(X1,[],1);
    VectorImageMatrix1(:,i) = v1;
end


%compute PCA
[PC, V] = pca2(VectorImageMatrix);
[PC1, V1] = pca2(VectorImageMatrix1);

%---- Compute Proportion of Variance (PoV) ------------

PoV = zeros(1,ImageNumber);
sumEigTot = sum(V);
appropriateM = ImageNumber;
for i = 1 : ImageNumber
    reducedEigSum = sum(V(1 : i));
    PoV(i) = reducedEigSum / sumEigTot;
    if PoV(i) > 0.9
        if i < appropriateM
            appropriateM = i;
        end
    end
end


plot(PoV);
ylabel('Proportion of Variance (PoV)');
xlabel('Number of used PC');
title('Proportion of Variance (PoV)');

hold on
treshold = 0.9;
x = 1 : appropriateM;
y( 1 : appropriateM) = treshold;
plot(x,y);
plot(x,y, 'r');
x1( 1 : 10 ) = appropriateM;
y1 = 0: 0.1: treshold;
plot(x1,y1, 'r');

%---- Reconstruction errors ------------

recError = zeros(1, ImageNumber1);
for usedComponent = 1 : ImageNumber1
    recError(usedComponent) = sum(V(usedComponent : ImageNumber1));
end

figure();
plot(recError);
ylabel('Reconstruction Error');
xlabel('Number of used PC');
title('Reconstruction Error');

figure();

k = 1;
for j = 1 : 50 : 300
    PCtemp = PC;
    m = j;
    PCtemp(:, m + 1 : 784) = [];
    for i = 1 : N
        MeanMatrix1(i, :) = repmat( mean(VectorImageMatrix1(i, :)), 1, ImageNumber1);
    end
    x_f = VectorImageMatrix1 - MeanMatrix1;
    U_t = transpose(PCtemp);
    %Encoding data point
    Z = U_t * x_f;  %z is a M-dimensional vector encoding a data point x
    %Reconstructing data point
    X_1 = MeanMatrix1 + (PCtemp * Z); % x?is a d-dimensional vector for the data point x
    
    myImage = reshape(X_1(:,1),[28,28]);
    subplot(1,7,k+1);
    display_digit(myImage);
    title(num2str(j));
    daspect([1 1 1]);
    k = k + 1;
    
end

hold on 
myImage = test{1};
subplot(1,7,1);
display_digit(myImage);
daspect([1 1 1]);
title('original');

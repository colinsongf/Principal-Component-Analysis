-----------------------------------
Principal Component Analysis (PCA)
-----------------------------------

This code includes 2 Matlab implementations of PCA used for 2 image reconstruction and clustering:

	- pca1.m -> computation of PCA by using covariance matrix.
	- pca2.m -> computation of PCA by Singular Value Decomposition (SVD).
	- pca_digit.m -> reconstruction of images of digit dataset using PCA.
	- pca_iris.m -> clustering of the iris dataset on 3 principal components.

The 3 following figures represent the results obtained in the applications.

Digits reconstructed by using principal componenets.

![alt tag](https://raw.githubusercontent.com/giangi023/Principal-Component-Analysis/master/pca_digit.png)

Clustering by projecting the iris dataset on 2 principal components.

![alt tag](https://raw.githubusercontent.com/giangi023/Principal-Component-Analysis/master/pca_iris.png)

A possible solution to find a suitable number of principal components

![alt tag](https://raw.githubusercontent.com/giangi023/Principal-Component-Analysis/master/pca_PC.png)

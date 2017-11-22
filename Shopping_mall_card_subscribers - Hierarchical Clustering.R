
#################################################################################
#####################   Hierarchical Clustering - R  #################################
#################################################################################

#---------------------------------------------------------------------------------
# Step : 1 Installing the Packages
---------------------------------------------------------------------------------
# install.packages('cluster')
library(cluster)

#---------------------------------------------------------------------------------
# Step : 2 Data Preprocessing
#--------------------------------------------------------------------------------
         #2(a) Importing the dataset
dataset = read.csv('Shopping_mall_card_subscribers.csv')
dataset = dataset[4:5]

--------------------------------------------------------------------------------
# Step : 3 Data modelling
--------------------------------------------------------------------------------
       #3(a) Using the dendrogram to find the optimal number of clusters
dendrogram = hclust(d = dist(dataset, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean distances')

      #3(b) Fitting Hierarchical Clustering to the dataset
hc = hclust(d = dist(dataset, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)

      #3(c) Visualising the clusters
				   
#The clusplot uses PCA to draw the data. It uses the first two principal components to explain the data.
clusplot(dataset,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels= 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
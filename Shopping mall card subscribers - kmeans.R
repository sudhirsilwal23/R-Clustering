
#################################################################################
#####################   K-Means Clustering - R  #################################
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
       #3(a) Using the elbow method to find the optimal number of clusters
          
		                  #Elbow method
#-----------------------------------------------------------------------
#The elbow method looks at the percentage of variance explained as a 
#function of the number of clusters: One should choose a number of 
#clusters so that adding another cluster doesn’t give much better 
#modeling of the data. More precisely, if one plots the percentage of 
#variance explained by the clusters against the number of clusters,
#the first clusters will add much information (explain a lot of variance),
#but at some point the marginal gain will drop, giving an angle in the graph. 
#The number of clusters is chosen at this point, hence the “elbow criterion”.
#This “elbow” cannot always be unambiguously identified.

set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

                   #3(b) Fitting K-Means to the dataset
				   
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster

                   #3(c) Visualising the clusters
				   
#The clusplot uses PCA to draw the data. It uses the first two principal components to explain the data.
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')

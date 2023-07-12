clc;clear;
num=xlsread('/Users/naomi/Desktop/cluster80.xlsx')
%num = xlsread('//Users/naomi/Desktop/12.14clusterSZ/PCA10.xlsx')
num1 = num (:,1:80) ;
[centroid, result] = Clustering(num1,'kmeans++',2,100);  

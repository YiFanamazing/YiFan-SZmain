#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jul 12 10:20:36 2023

@author: naomi
"""
#%% Main code for drawing 2D graphs with PCA under Kmeans++ algorithm
import matplotlib.pyplot as plt
pca = PCA(n_components=2).fit(data)
pca_3d = pca.transform(data)
for i in range(0,pca_3d.shape[0]):
    if  label[i] == 1:    
        c2 = plt.scatter(pca_3d[i,0],pca_3d[i,1],c='#3399FF',alpha =0.8,marker='o')
    elif label[i] == 2:
        c3 = plt.scatter(pca_3d[i,0],pca_3d[i,1],c='#FF9933',alpha =0.8,marker='*')

mpl.rcParams.update({'font.size': 12})

plt.legend([c3, c2],['Cluster 2','Cluster 1'])
plt.title('kmeans++ with 2 clusters under PCA', fontsize = 12,fontweight="bold")
plt.show
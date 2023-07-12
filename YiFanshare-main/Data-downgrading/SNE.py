#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jul 12 10:10:34 2023

@author: naomi
"""
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import numpy as np
from sklearn.cluster import KMeans
from sklearn.datasets import make_blobs
import pandas as pd
from sklearn.cluster import DBSCAN
import numpy as np
from sklearn import manifold
from sklearn.manifold import TSNE
import matplotlib.pyplot as plt
import torch
from sklearn.decomposition import PCA

Data= pd.read_excel('cluster80.xlsx')
data=Data.iloc[:,1:81]

#%%  Kmeans++ algorithm results using T-SNE to draw 2D graphs
import matplotlib as mpl
model = TSNE(n_components=2,learning_rate=100)
transformed = model.fit_transform(data)
label= pd.read_excel('cluster-label.xlsx') 
label=label.iloc[:,1:2]
label=label.values
#pca = PCA(n_components=2).fit(data)
#pca_2d = pca.transform(data)
x_axis = transformed[:,0]
y_axis = transformed[:,1]
plt.figure(dpi=900)

for i in range(0,transformed.shape[0]):
    if label[i] == 0:
        c1 = plt.scatter(transformed[i,0],transformed[i,1],c='r',marker='+')
    elif label[i] == 2:
        #c2 = plt.scatter(transformed[i,0],transformed[i,1],c='darkorange',alpha =0.8,marker='o')
        c3 = plt.scatter(transformed[i,0],transformed[i,1],c='#3399FF',alpha =0.8,marker='o')
    elif label[i] == 1:
        #c3 = plt.scatter(transformed[i,0],transformed[i,1],c='dodgerblue',alpha =0.8,marker='*')
        #c3 = plt.scatter(transformed[i,0],transformed[i,1],c='#e1b290',alpha =1,marker='*')
        c2 = plt.scatter(transformed[i,0],transformed[i,1],c='#FF9933',alpha=1,marker='*')


mpl.rcParams.update({'font.size': 12})

plt.legend([c2, c3],['Cluster 1','Cluster 2'])
#plt.title('kmeans++ with 2 clusters under T-SNE', fontsize = 30,fontweight="bold")

plt.show
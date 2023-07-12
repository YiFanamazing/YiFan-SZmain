#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jul 12 10:28:50 2023

@author: naomi
"""

#%%Kmeans++算法下用PT-SNE 画三维图HC
import matplotlib as mpl
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import numpy as np
from sklearn.cluster import KMeans
#from sklearn.datasets.samples_generator import make_blobs
from sklearn.datasets import make_blobs
import pandas as pd
from sklearn.cluster import DBSCAN
import numpy as np
from sklearn import manifold
from sklearn.manifold import TSNE
import matplotlib.pyplot as plt
import torch
from sklearn.decomposition import PCA

data= pd.read_excel('cluster80SCZHC.xlsx') 
data=data.iloc[:,1:81]
#26和34人的分类标签
label= pd.read_excel('cluster24+63.xlsx') 
label=label.iloc[:,1:2]
label=label.values

pca = PCA(n_components=2).fit(data)
pca_3d = pca.transform(data)


plt.figure(dpi=600)
for i in range(0,pca_3d.shape[0]):
    
    if  label[i] == 1:
        c1 = plt.scatter(pca_3d[i,0],pca_3d[i,1],c='#9DBBD5',alpha =1,marker='o')
    elif label[i] == 2:
        c2 = plt.scatter(pca_3d[i,0],pca_3d[i,1],c='#E3CCA2',alpha =1,marker='^')
    elif label[i] == 3:
        c3 = plt.scatter(pca_3d[i,0],pca_3d[i,1],c='#DF9F9A',alpha =1,marker='*')
        
mpl.rcParams.update({'font.size': 12})

plt.legend([c1, c2,c3],['Cluster 1','Cluster 2','HC'])
#plt.title('kmeans++ with 2 clusters under PCA', fontsize = 12,fontweight="bold")

plt.show
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jul 12 10:07:16 2023

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
kmeans = KMeans(init="k-means++",n_clusters=2)
kmeans.fit(data)
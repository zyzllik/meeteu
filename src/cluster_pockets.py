import pandas as pd
import numpy as np
import os
import networkx as nx
import matplotlib.pyplot as plt

def load_file (path):
    df = pd.read_csv(path)
    df = df[df['IoMIN']>0.95]
    df.rename(columns={'Unnamed: 0':'pocket_id'},
              inplace=True)
    df['overlap_ids'] = ''
    return df

def get_overlaps(df):
    edgelist = []
    for row in range(df.shape[0]):
        resi_str = df.iloc[row,:]['Common_residues']
        resi = resi_str.split(',')
        resi = [int(r) for r in resi]
        overlaps = []
        for i in range(df.shape[0]):
            if i!=row:
                other_resi_str = df.iloc[i,:]['Common_residues']
                other_resi = other_resi_str.split(',')
                other_resi = [int(r) for r in other_resi]
                if np.intersect1d(resi, other_resi).size > 0:
                    overlaps.append(str(df.iloc[i,:]['pocket_id']))
                    edgelist.append((df.iloc[row,:]['pocket_id'], df.iloc[i,:]['pocket_id']))
        col_index = df.columns.get_loc('overlap_ids')
        df.iat[row, col_index] = ', '.join(overlaps)
    return df, edgelist
                    
        
#structures = ['5rm2', '5rme', '6zsl', '7nio']#, '7nn0']
structures = ['7nio']
folder = '/mnt/c/Users/liza_/Documents/2. Studium/0 Master/Meet-EU/meeteu/pocket_overlap_results/'
for structure in structures: 
    print(structure)
    df = load_file(os.path.join(folder, f'{structure}_all_IoMIN.csv'))
    df, edgelist = get_overlaps(df)
    df.to_csv(os.path.join(folder, f'{structure}_all_IoMIN_with_overlaps.csv'))
    
    G = nx.from_edgelist(edgelist)
    fig, ax = plt.subplots()
    fig.set_size_inches(20, 20)
    nx.draw_shell(G, with_labels=True, ax=ax)
    #nx.draw(G, pos=nx.spring_layout(G), with_labels=True, ax=ax)
    plt.savefig(os.path.join(folder, f'{structure}_all_IoMIN_graph.png'))
    
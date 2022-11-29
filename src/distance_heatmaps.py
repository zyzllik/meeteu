import glob
import os
import pandas as pd
import numpy as np
from sklearn import metrics
import seaborn as sns
import matplotlib.pyplot as plt
import scipy.spatial as sp
import scipy.cluster.hierarchy as hc

def prepare_fpocket(path, cut=15):
    
    # Load file (FWF because sometimes no whitespaces between columns)
    fpocket_df = pd.read_fwf(path, 
                             colspecs=[(0,4), (6, 11), (12, 16), (17, 20), (23, 26), 
                                       (31, 38), (40, 46), (48, 54), (58, 62), (67, 70)],
                            names=['ATOM', 'Atom_number', 'Polarity', 'STP',
                                    'rank', 'center_x', 'center_y', 
                                    'center_z', '0.00', 'radius'],
                            skiprows=3,
                            skipfooter=2,
                            delim_whitespace=True,
                            engine='python')
    
    # Calculate center of mass for each pocket
    fpocket_central = fpocket_df.groupby('rank')[['center_x', 'center_y', 'center_z']].mean()
    
    
    # Generate column with the number of pocket (Fpocket rank)
    fpocket_central.reset_index(inplace=True)
    
    # Just take the pockets with rank >= cut
    fpocket_central = fpocket_central[fpocket_central['rank'] <= cut]

    
    return fpocket_central

def prepare_p2rank(path):
    
    # Load file
    p2rank_df = pd.read_csv(path)
    
    # Remove whitespaces from column names
    p2rank_df.rename(columns=lambda x: x.strip(), inplace = True)
    
    # Name the column with the rank of pocket P2Rank rank
    #p2rank_df.rename(columns={'rank':'P2Rank rank'}, inplace=True)
    
    return p2rank_df

def generate_dist_matrix(df1, df2):
    
    # Calculate pairwise distances
    distances = metrics.pairwise_distances(
                        df1.loc[:,['center_x', 'center_y', 'center_z']],
                        df2.loc[:,['center_x', 'center_y', 'center_z']],
                        metric='euclidean'
                        )
    
    # Create a dataframe with calculated distances
    distances_df = pd.DataFrame(distances, 
                                index=df1['rank'],
                                columns=df2['rank'])
    
    return distances_df

def generate_heatmap(dist_df, output_path, x_label, y_label, size):
    
    fig, ax = plt.subplots()
    
    # Set image size
    fig.set_size_inches(size)
    
    # Plot heatmap
    heatmap = sns.heatmap(dist_df, 
                        cmap='viridis_r', 
                        annot=True,
                        ax=ax)
    heatmap.set(xlabel=x_label, ylabel=y_label)
    
    # Save plot
    fig.savefig(output_path, dpi=200)
    
    # Close figure (Otherwise RuntimeWarning appears)
    plt.close()
    
def generate_clustermap(dist_df, output_path, x_label, y_label, size):
    
    # Distance matrix to linkage
    # print(np.allclose(dist_df, dist_df.T))
    # condensed_dist = dist_df.to_numpy()[np.triu_indices(dist_df.shape[0],1)]
    # linkage = hc.linkage(condensed_dist, 
    #                     method='average')
    
    # Plot clustermap
    clustermap = sns.clustermap(dist_df.to_numpy(),
                                # row_linkage = linkage,
                                # col_linkage = linkage,
                                figsize=size, 
                                cmap='viridis_r',
                                annot=True,
                                xticklabels = dist_df.columns,
                                yticklabels = dist_df.index)
    clustermap.ax_heatmap.set_xlabel(x_label)
    clustermap.ax_heatmap.set_ylabel(y_label)
    
    # Save plot
    
    clustermap.savefig(output_path, dpi=200)
    
    # Close figure (Otherwise RuntimeWarning appears)
    plt.close()
    
def fpocket_vs_p2rank(dirname, name, cluster = False):
    
    # Load and prepare data
    fpocket_path = f'../fpocket_output/{name}_pockets.pqr.txt'
    p2rank_path = f'../p2rank_output/{name}.pdb_predictions.csv'
    fpocket_df = prepare_fpocket(fpocket_path)
    p2rank_df = prepare_p2rank(p2rank_path)
    
    # Calculate distance matrix
    distance_df = generate_dist_matrix(fpocket_df, p2rank_df)
    
    # Create a directory if it doesn't yet exist
    if not os.path.exists(dirname):
        os.makedirs(dirname)
    
    # Generate and save the plot
    if cluster == True:
        generate_clustermap(distance_df,
                     os.path.join(dirname, f'{name}_distances.png'),
                     'P2Rank rank', 'Fpocket rank', (16,16))
    else:
        generate_heatmap(distance_df,
                        os.path.join(dirname, f'{name}_distances.png'),
                        'P2Rank rank', 'Fpocket rank', (16,16))
    
def fpocket_within_distance(dirname, name, cluster = False):
    
    # Load and prepare data
    fpocket_path = f'../fpocket_output/{name}_pockets.pqr.txt'
    fpocket_df = prepare_fpocket(fpocket_path)
    
    # Calculate distance matrix
    distance_df = generate_dist_matrix(fpocket_df, fpocket_df)
    
    # Create a directory if it doesn't yet exist
    if not os.path.exists(dirname):
        os.makedirs(dirname)
    
    # Generate and save the plot
    if cluster==True:
        generate_clustermap(distance_df,
                            os.path.join(dirname, f'{name}_fpocket_distances.png'),
                            'Fpocket rank', 'Fpocket rank', (10, 10))
    else:
        generate_heatmap(distance_df,
                        os.path.join(dirname, f'{name}_fpocket_distances.png'),
                        'Fpocket rank', 'Fpocket rank', (10, 10))
        
    
if __name__=="__main__":
    filelist = glob.glob('../fpocket_output/*.pdb')
    names = ['_'.join(n.split('_')[:-1]).split('/')[-1] for n in filelist]
    for name in names:
        print(f'Generating plot for {name}')
        fpocket_within_distance('../fpocket_distance_cluster/', 
                                name, 
                                cluster = True)
        fpocket_within_distance('../fpocket_distance_comparison/', 
                                name, 
                                cluster = False)
        fpocket_vs_p2rank('../distance_cluster/', 
                            name, 
                            cluster = True)
        fpocket_vs_p2rank('../distance_comparison/', 
                            name, 
                            cluster = False)
        
    
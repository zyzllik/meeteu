import glob
import pandas as pd
import numpy as np
from sklearn import metrics
import seaborn as sns
import matplotlib.pyplot as plt

def prepare_fpocket(path):
    
    # Load file (FWF because sometimes no whitespaces between columns)
    fpocket_df = pd.read_fwf(path, 
                            names=['ATOM', 'Atom_number', 'Polarity', 'STP',
                                    'Pocket_num', 'x', 'y', 'z', '0.00', 'radius'],
                            skiprows=3,
                            skipfooter=2,
                            delim_whitespace=True,
                            engine='python')
    
    # Calculate center of mass for each pocket
    fpocket_central = fpocket_df.groupby('Pocket_num')[['x', 'y', 'z']].mean()
    
    # Generate column with the number of pocket (Fpocket rank)
    fpocket_central.reset_index(inplace=True)
    fpocket_central.rename(columns={'Pocket_num': 'Fpocket rank'}, 
                        inplace=True)

    
    return fpocket_central

def prepare_p2rank(path):
    
    # Load file
    p2rank_df = pd.read_csv(path)
    
    # Remove whitespaces from column names
    p2rank_df.rename(columns=lambda x: x.strip(), inplace = True)
    
    # Name the column with the rank of pocket P2Rank rank
    p2rank_df.rename(columns={'rank':'P2Rank rank'}, inplace=True)
    
    return p2rank_df

def generate_dist_matrix(fpocket, p2rank):
    
    # Calculate pairwise distances
    distances = metrics.pairwise_distances(
                        fpocket.loc[:,['x', 'y', 'z']],
                        p2rank.loc[:,['center_x', 'center_y', 'center_z']]
                        )
    
    # Create a dataframe with calculated distances
    distances_df = pd.DataFrame(distances, 
                                index=fpocket['Fpocket rank'],
                                columns = p2rank['P2Rank rank'])
    
    return distances_df

def generate_heatmap(dist_df, output_path):
    
    fig, ax = plt.subplots()
    
    # Set image size
    fig.set_size_inches(5, 10)
    
    # Plot heatmap
    sns.heatmap(dist_df, 
                cmap='viridis_r', 
                annot=True,
                ax=ax)
    
    # Save plot
    fig.savefig(output_path, dpi=200)
    
def prepare_and_plot(name):
    
    # Load and prepare data
    fpocket_path = f'../fpocket_output/{name}_pockets.pqr.txt'
    p2rank_path = f'../p2rank_predictions/{name}.pdb_predictions.csv'
    fpocket_df = prepare_fpocket(fpocket_path)
    p2rank_df = prepare_p2rank(p2rank_path)
    
    # Calculate distance matrix
    distance_df = generate_dist_matrix(fpocket_df, p2rank_df)
    
    # Generate and save heatmap
    generate_heatmap(distance_df,
                     f'../distance_comparison/{name}_distances.png')
        
    
if __name__=="__main__":
    filelist = glob.glob('../fpocket_output/*.pdb')
    names = ['_'.join(n.split('_')[:-1]).split('/')[-1] for n in filelist]
    for name in names:
        print(f'Generating heatmap for {name}')
        prepare_and_plot(name)
    
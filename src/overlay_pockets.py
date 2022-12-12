from pymol import cmd, stored
import numpy as np
import pandas as pd
import itertools
import os
import re
import matplotlib.pyplot as plt
import seaborn as sns
from functools import reduce
      

def load_fpocket(path, name='A'):
    # Load file, select fpocket predictions and the protein
    cmd.load(path, f'fpocket_file_{name}')
    cmd.select(f'fpocket_{name}', f'hetatm and not metals and fpocket_file_{name}')
    cmd.select(f'protein_{name}', f'not fpocket_{name} and not metals and fpocket_file_{name}')
    
    # Generate single selections for each pocket
    pockets = {}
    # Get the list of all pockets (the total number used below)
    stored.spheres = []
    cmd.iterate(f'fpocket_{name}', 'stored.spheres.append(resv)')  
    for i in range(1, stored.spheres[-1]+1): # For each pocket
        # Select alpha-spheres
        cmd.select(f'fpocket_sphere_{name}_{i}', 
                   f'fpocket_{name} and resi {i}')
        # Select atoms in radius of 6 A from alpha-spheres
        cmd.select(f'fpocket_atoms_{name}_{i}', 
                   f'protein_{name} near_to 6.0 of fpocket_sphere_{name}_{i}')
        # Select residues of which these atoms are part
        cmd.select(f'fpocket_{name}_{i}',
                   f'byresidue fpocket_atoms_{name}_{i}')
        # Save residues for each pocket
        stored.residue_number = []
        stored.residue_name = []
        cmd.iterate(f'fpocket_{name}_{i}', 'stored.residue_number.append(resv)')
        pockets[i] = np.unique(stored.residue_number)
    
    # Dictionary to datafram
    df = pd.DataFrame.from_dict(pockets, orient='index')
    df.reset_index(inplace=True)
    df.rename(columns={'index':'rank'}, inplace=True)
    return df
    

def load_p2rank(path):
    
    # Load the csv
    df = pd.read_csv(path, sep=',', skipinitialspace=True)
    
    # Split column containing a list of residues in multiple columns
    new_df = pd.DataFrame(df['residue_ids'].str.split().to_list(), 
                          index = df['rank'])
    
    # Delete chain name from each value
    for c in new_df.columns:
        new_df.loc[:, c] = new_df.loc[:, c].str.replace('._', '', regex=True)
        
    # Rank as column, not as index
    new_df.reset_index(inplace=True)
    
    return new_df

def prepare_residue_array(df, row):
    df_row = df.loc[df['rank']==row, 
                    df.columns != 'rank']
    df_row = df_row.dropna(axis=1)
    df_row = df_row.astype(int)
    return np.array(df_row)
    
def calculate_overlap(df_list):
    index_list = [df['rank'] for df in df_list]
    combinations = itertools.product(*index_list)
    results = np.zeros([len(i) for i in index_list], dtype=np.float16)#.flatten()
    intersection_residues = np.empty([len(i) for i in index_list], dtype=object)
    i = 1
    for combi in combinations:
        if 20 in combi:
            continue
        residues = []
        for df_i in range(len(df_list)):
            
            residues.append(prepare_residue_array(df_list[df_i], combi[df_i]))

        intersection = reduce(np.intersect1d, residues)
        union = reduce(np.union1d, residues)
        #overlap = len(intersection) / len(union)
        overlap = len(intersection) / np.min([r.size for r in residues])
        
        if intersection.size > 0:
            str_intersection = ','.join(str(i) for i in intersection)
        else:
            str_intersection = ''
    
        if len(combi) == 2:
            results[combi[0]-1, combi[1]-1] = overlap
            intersection_residues[combi[0]-1, combi[1]-1] = str_intersection
        if len(combi) == 4:
            results[combi[0]-1, combi[1]-1, combi[2]-1, combi[3]-1] = overlap
            intersection_residues[combi[0]-1, combi[1]-1, combi[2]-1, combi[3]-1] = str_intersection
        if len(combi) == 8:
            results[combi[0]-1, combi[1]-1, combi[2]-1,
                    combi[3]-1, combi[4]-1, combi[5]-1,
                    combi[6]-1, combi[7]-1] = overlap
            intersection_residues[combi[0]-1, combi[1]-1, combi[2]-1,
                    combi[3]-1, combi[4]-1, combi[5]-1,
                    combi[6]-1, combi[7]-1] = str_intersection
        
    #print(intersection_residues)
    return results, intersection_residues

def generate_heatmap(dist_df, output_path, title, x_label, y_label, size):
    
    fig, ax = plt.subplots()
    
    # Set image size
    fig.set_size_inches(size)
    
    # Plot heatmap
    heatmap = sns.heatmap(dist_df, 
                        cmap='viridis_r', 
                        annot=True,
                        ax=ax,
                        xticklabels = dist_df.columns,
                        yticklabels = dist_df.index)
    heatmap.set(xlabel=x_label, ylabel=y_label)
    ax.set_title(title)
    
    # Save plot
    fig.savefig(output_path, dpi=200)
    
    # Close figure (Otherwise RuntimeWarning appears)
    plt.close()

if __name__=='__main__':
    structures = ['5rm2', '5rme', '6zsl', '7nio', '7nn0']
    #structures = ['7nn0']
    all_p2rank_files = os.listdir('../p2rank_output/')
    all_fpocket_files = os.listdir('../fpocket_output/')
    for structure in structures:
        print(structure)
        regex_p2rank = re.compile(f'.*{structure}_OK_.*.pdb_predictions.csv')
        p2rank_files = []
        for p2rank in all_p2rank_files:
            if regex_p2rank.search(p2rank):
                p2rank_files.append(p2rank)
        print(p2rank_files)
        regex_fpocket = re.compile(f'.*{structure}_OK_.*_out.pdb')
        fpocket_files = []
        for fpocket in all_fpocket_files:
            if regex_fpocket.search(fpocket):
                fpocket_files.append(fpocket)
        print(fpocket_files)
        
        # Comparison for each chain
        print('Overlaps for each chain')
        # for i in range(len(fpocket_files)):
        #     print(fpocket_files[i], p2rank_files[i])
        #     fpocket_df = load_fpocket(
        #         os.path.join('../fpocket_output/', fpocket_files[i]))
        #     p2rank_df = load_p2rank(
        #         os.path.join('../p2rank_output/', p2rank_files[i])
        #     )
        #     results = calculate_overlap([fpocket_df, p2rank_df])
            
        #     name = '_'.join([fpocket_files[i].split('_')[0],
        #                     fpocket_files[i].split('_')[2]])
            
        #     df = pd.DataFrame(results, 
        #                       index = fpocket_df['rank'],
        #                       columns = p2rank_df['rank'])
        #     generate_heatmap(df, f'../pocket_overlap_results/{name}_fpVSp2r_IoMIN.png',
        #                      structure,
        #                      'P2Rank', 'Fpocket', (15, 15))
        
        # Compare different chains
        print('Overlaps for all chains')
        
        fpocket_dfs = []
        for fpocket_file in fpocket_files:
            fpocket_dfs.append(
                load_fpocket(
                    os.path.join('../fpocket_output/', fpocket_file)
                    )
                )
        p2rank_dfs = []
        for p2rank_file in p2rank_files:
            p2rank_dfs.append(
                load_p2rank(
                    os.path.join('../p2rank_output/', p2rank_file)
                    )
                )
        results, intersection_residues = calculate_overlap(fpocket_dfs+p2rank_dfs)
        hits = np.argwhere(results > 0.0).transpose()
        # hit_values = []
        # for i in hits.transpose():
        #     hit_values.append(results[*i])
        print(hits)
        if len(hits) == 4:
            hit_values = results[np.array(hits[0]), 
                                 np.array(hits[1]),
                                 np.array(hits[2]),
                                 np.array(hits[3])]
            hit_residues = intersection_residues[np.array(hits[0]), 
                                 np.array(hits[1]),
                                 np.array(hits[2]),
                                 np.array(hits[3])]
        if len(hits) == 8:
            hit_values = results[np.array(hits[0]), 
                                 np.array(hits[1]),
                                 np.array(hits[2]),
                                 np.array(hits[3]),
                                 np.array(hits[4]), 
                                 np.array(hits[5]),
                                 np.array(hits[6]),
                                 np.array(hits[7])]
            hit_residues = intersection_residues[np.array(hits[0]), 
                                 np.array(hits[1]),
                                 np.array(hits[2]),
                                 np.array(hits[3]),
                                 np.array(hits[4]), 
                                 np.array(hits[5]),
                                 np.array(hits[6]),
                                 np.array(hits[7])]
        print(hit_values)
        df_names = fpocket_files + p2rank_files
        print(df_names)
        df_names_new = []
        for name in df_names:
            name = name.replace('_OK_', '_')
            name = name.replace('out.pdb', 'fpocket')
            name = name.replace('.pdb_predictions.csv', '_p2rank')
            df_names_new.append(name)
            
        hist_df = pd.DataFrame(hits.transpose(), columns = df_names_new)
        hist_df += 1
        hist_df['IoMIN'] = hit_values
        hist_df['Common_residues'] = hit_residues
        
        hist_df = hist_df.sort_values(by=['IoMIN'], ascending=False)
    
        hist_df.to_csv(f'../pocket_overlap_results/{structure}_all_IoMIN.csv')
        
        
                    
        

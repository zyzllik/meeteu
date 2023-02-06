import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import os

def sort_res(results_file):
    '''
    Input: csv with scores for each molecule with 2 columns: Molecules, Score
    Output: csv of the same structure with molecules filtered for score above certain threshold 
    '''
    results = pd.read_csv(results_file)
    #convert scores column to numeric values (convert ERROR message to NaN first)
    results[['Score']] = results[['Score']].replace('ERROR', np.NaN).apply(pd.to_numeric)
    #save hist with scores distribution to visualize the possible threshold
    results.hist()
    plt.savefig(f'{results_file[0:-4]}_threshold.png')
    #cutoff threshold 
    filtered = results[results['Score'] < -11]
    #save df to csv
    return filtered 
    #filtered.to_csv(f'filtered_{results_file[0:-4]}.csv', index=False)

def fix_eos(results): 
    '''
    Input: csv with wrong eos-names and scores after docking 
    Output: csv with fixed eos-names and same scores 
    '''
    #read datasets 
    origin = pd.read_csv('ecbd_all.csv')
    filtered = pd.read_csv('filtered_mols.csv')
    #merge datasets based on column to get the matching columns 
    df = pd.merge(origin.rename(columns={'eos': 'eos_right'})[['smiles', 'eos_right']], 
        filtered[['smiles', 'eos']], on='smiles')
    #now as we have the right match, fix the names in the results and sort the molecules by score
    results_fixed = pd.merge(df.rename(columns={'eos_right': 'Molecule'}), 
        results, on='Molecule').drop(columns = ['eos']).sort_values(by = 'Score', axis=0, na_position='first')
    results_fixed = results_fixed[['Molecule', 'Score', 'smiles']].rename(columns={'Molecule': 'eos'})
    #results_fixed.to_csv(f'fixed_{results_file}', index=False)
    results_fixed.to_csv(f'{results_file}_fixed.csv', index=False)

if __name__=='__main__':
    
    merged_path = sys.argv[1]
    filtered_df = sort_res(merged_path)
    folder, merged_file = os.path.split(merged_path)
    filtered_df.to_csv(os.path.join(folder,
                                    'filetered_-11_'+merged_file),
                       index=False)


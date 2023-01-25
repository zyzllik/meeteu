import pandas as pd
import numpy as np
import os
import sys

sample = sys.argv[1] # e.g. 7NIO_pocket1
main_folder = f"docking/{sample}"
folders = [os.path.join(main_folder, f) for f in os.listdir(main_folder) if f.startswith("docking_23-")]

complete_df = pd.DataFrame()
for path in folders:
    for f in os.listdir(path):
        if f.endswith('SMILES.csv'):
            df = pd.read_csv(os.path.join(path, f))
            complete_df = pd.concat([complete_df, df])

complete_df.drop(columns=['Unnamed: 0', 'Molecule'], inplace = True) 
complete_df.rename(columns={'admetlab_smiles':'smiles'}, inplace = True)
complete_df.to_csv(os.path.join(main_folder, f'{sample}_docking_results_merged.csv'),
                   index = False)        

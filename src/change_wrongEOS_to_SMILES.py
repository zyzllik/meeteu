import numpy as np
import pandas as pd

def generate_reference_df():
    # Generate dataframe containing wrong EOS and SMILES used
    # for docking from the two files
    smiles_file_1 = '/home/elizaveta/meeteu/docking/filtered_mols_1.csv'
    smiles_file_2 = '/home/elizaveta/meeteu/docking/filtered_mols_2.csv'
    
    df_1 = pd.read_csv(smiles_file_1)
    df_2 = pd.read_csv(smiles_file_2)
    df = df_1.append(df_2)
    
    return df

def add_smiles(df, smiles_df):
    # Add column with SMILES to df
    # smiles_df: df used for reference
    
    df['admet_smiles'] = ''
    
    # Iterate through molecules
    for i in range(df.shape[0]):
        mol = df['Molecule'].iloc[i] # Can be an EOS or a SMILES string
        if mol.startswith('EOS'):
            smiles = smiles_df[smiles_df['eos']==mol]['smiles']
        elif 'C' in mol:
            smiles = mol
        else:
            print('Error, should be SMILES or EOS: ', mol)
        df['admet_smiles'].iloc[i] = smiles.iloc[0]
    
    return df

if __name__=='__main__':
    file_n = '/home/elizaveta/meeteu/docking/docking_23-01-15_20-08/7nio_filtered_mols_1_23-01-15_20-08.csv'
    df = pd.read_csv(file_n)
    smiles_df = generate_reference_df()
    df = add_smiles(df, smiles_df)
    df.to_csv(file_n[:-4]+'_SMILES.csv')

import numpy as np
import pandas as pd
import sys

def generate_reference_df():
    # Generate dataframe containing wrong EOS and SMILES used
    # for docking from the two files
    smiles_file_1 = 'docking/filtered_mols_1.csv'
    smiles_file_2 = 'docking/filtered_mols_2.csv'
    
    df_1 = pd.read_csv(smiles_file_1)
    df_2 = pd.read_csv(smiles_file_2)
    df = df_1.append(df_2)
    
    return df

def add_smiles(input_df, smiles_df):
    # Add column with SMILES to df
    # smiles_df: df used for reference
    
    df = input_df.copy()
    df['admetlab_smiles'] = ''
    
    # Iterate through molecules
    for i in range(df.shape[0]):
        mol = df['Molecule'].iloc[i] # Can be an EOS or a SMILES string
        if mol.startswith('EOS'):
            smiles = smiles_df[smiles_df['eos']==mol]['smiles']
        elif 'C' in mol:
            smiles = mol
        else:
            print('Error, should be SMILES or EOS: ', mol)
              
        try:
            df['admetlab_smiles'].iloc[i] = smiles.iloc[0]
        except:
            df['admetlab_smiles'].iloc[i] = smiles
    
    return df

if __name__=='__main__':
    # Just change this
    #file_n = 'docking/7NIO_pocket1/docking_23-01-15_20-08/filtered_mols_1_23-01-15_20-08.csv'
    file_n = sys.argv[1]
    
    df = pd.read_csv(file_n)
    smiles_df = generate_reference_df()
    df = add_smiles(df, smiles_df)
    df.to_csv(file_n[:-4]+'_SMILES.csv')

import numpy as np
import pandas as pd
import os
import datetime

class File:
    '''
    Class for easier handling of the output files.
    '''
    def __init__(self, path):
        # Initiates the class with the path to the file
        self.path = path
        
    def write_text(self, text):
        # Writes text (appending to the previous content)
        with open(self.path, 'a') as file:
            file.write(text)
    
    def write_df(self, df):
        # Writes a pandas as .csv
        df.to_csv(self.path)

class Filter:
    '''
    Class for handling the whole filtering process
    '''
    def __init__(self, df, folder):
        
        # Data to be filtered, after each filtering step includes
        # molecules that passed the filter
        self.df = df.copy()
        # Molecules that did not pass the filter
        self.df_elim = pd.DataFrame()
        
        # Create output dir
        os.makedirs(folder, exist_ok=True) 
        # Create a logging file
        self.log_file = File(os.path.join(folder, 'log.txt')) 
        
        # Create output file objects
        self.elim_mols = File(os.path.join(folder, 'eliminated_mols.csv'))
        self.output = File(os.path.join(folder, 'filtered_mols.csv'))
        
        ### Definition of thresholds for different features ---> ###
        # Rules: either accepted or rejected
        self.rules = ['Pfizer', 'GSK', 'Lipinski', 'GoldenTriangle']
        self.rules_threshold = 2 # If rejected by 2 or more rules => eliminated
        
        # Scores predicted by ADMETlab ML models: values from 0 (better) to 1 (worse)
        self.scores = ['hERG',
                        'H-HT',
                        'DILI',
                        'Ames',
                        'ROA',
                        'NR-AR',
                        'NR-AR-LBD',
                        'NR-AhR',
                        'NR-Aromatase',
                        'NR-ER-LBD',
                        'NR-PPAR-gamma',
                        'SR-ARE',
                        'SR-ATAD5',
                        'SR-HSE',
                        'SR-MMP',
                        'SR-p53']
        self.score_value_thr = 0.7 # Value lower than 0.7 => marked as positive score
        self.score_thr = 10 # If less than 10 scores are positive => molecule eliminated
        
        # PAINS: number of substructures that may lead to false-positives
        # No elimination, just warning if the value is greater than 0
        self.warning_features = ['PAINS'] 
        ### ---> Definition of thresholds for different features ###
    
    def add_warnings_rules(self):
        # Adds warning to molecules that were rejected by just one of the rules
        try:
            mask = self.df['rules_sum'] == 3 # Test if the rules_sum column exist
        except:
            raise Exception('Apply rules before adding the warning column!')
        
        self.df.loc[:, 'warning_rules'] = 'None' # Initiate the warning column
        
        # Iterate through rules and add the according warning to molecules
        # rejected by this rule
        for rule in self.rules:
            mask = self.df[rule] == 'Rejected'
            self.df.loc[mask, 'warning_rules'] = rule
    
    def add_warnings_scores(self):
        # Adds warnings to molecules that had high value for one or more scores, 
        # but passed filtering
        try:
            mask = self.df['scores_sum'] == 3 # Test if the scores_sum column exist
        except:
            raise Exception('Apply scores before adding the warning column!')
        
        self.df['warning_scores'] = '' # Initiate the warning column
        
        for score in self.scores:
            # Select all molecules that has high value for a given score
            mask = self.df[score] > self.score_value_thr
            # Add the name of the score to the warning column of these
            # molecules, while retaining previous warnings
            self.df.loc[mask, 'warning_scores'] = self.df.loc[mask, 'warning_scores'] + score + ','

        # Change empty string to 'None' for molecules without warning
        self.df.loc[:, 'warning_scores'].where(self.df.loc[:, 'warning_scores']=='', 'None')
        
    def add_warnings_PAINS(self):
        # Adds a warning if a molecule has at least one PAINS substructure
        self.df.loc[:, 'warning_PAINS'] = 'None'
        self.df.loc[self.df.loc[:, 'PAINS'] != 0, 'warning_PAINS'] = 'Yes'
        
        # Write number of added warnings in the log file
        self.log_file.write_text(f"\nNumber of PAINS warnings: {np.sum(self.df['PAINS'] != 0)}\n")
    
    
    def apply_rules(self):
        # Filetrs molecules by the rules
        
        # Calculate number of positive scores for each molecule
        rules_mask = self.df.loc[:, self.rules] == 'Accepted'
        self.df['rules_sum'] = np.sum(rules_mask, axis=1) 
        
        # Write filtering stats to the log file
        self.log_file.write_text(
            f"\nFiltered by rules: {self.rules}\n"\
            f"If at least {self.rules_threshold} are negative, the molecule is eliminated.\n"\
            f"\tNumber of eliminated molecules: {np.sum(self.df['rules_sum'] <= self.rules_threshold)}\n"\
            f"If just 1 rule is negative, a warning is added.\n"\
            f"\tTotal number of new warnings: {np.sum(self.df['rules_sum'] == 3)}\n"
            )
        
        # Add eliminated entries to the df_elim
        eliminated_entries = self.df[self.df['rules_sum'] <= self.rules_threshold].copy()
        self.df_elim = pd.concat([self.df_elim, eliminated_entries])
        
        # Change the df to only contain molecules that passed the filter
        self.df = self.df[self.df['rules_sum'] > self.rules_threshold] 
        
        # Add warnings to the filtered molecules          
        self.add_warnings_rules()
    
    def apply_scores(self):
        # Filters molecules by the scores
        
        # Calculate number of positive scores for each molecule
        mask = self.df.loc[:, self.scores] < self.score_value_thr
        self.df['scores_sum'] = np.sum(mask, axis=1)
        
        # Write filtering stats to the log file
        self.log_file.write_text(
            f"\nFiltered by scores: {self.scores}\n"\
            f"Value threshold: {self.score_value_thr}\n"\
            f"If less than {self.score_thr} are positive, the molecule is eliminated.\n"\
            f"\tNumber of eliminated molecules: {np.sum(self.df['scores_sum'] <= self.score_thr)}\n"\
            f"If just less rules are negative, a warning is added.\n"\
            f"\tTotal number of new warnings: {np.sum((self.df['scores_sum'] > self.score_thr) & (self.df['scores_sum'] < len(self.scores)))}\n"
            )
        
        # Add eliminated entries to the df_elim
        eliminated_entries = self.df[self.df['scores_sum'] <= self.score_thr].copy()
        self.df_elim = pd.concat([self.df_elim, eliminated_entries])
        
        # Change the df to only contain molecules that passed the filter
        self.df = self.df[self.df['scores_sum'] > self.score_thr] 
        
        # Add warnings to the filtered molecules              
        self.add_warnings_scores()
        
    def save_results(self):
        # Write the obtained dataframes with filtered and with eliminated molecules
        # in the output files
        
        # Remove warnings and rules_/scores_sum from the dataframe with eliminated molecules
        elim_mols_cols = [c for c in self.df_elim.columns 
                          if c not in ['warning_scores', 'warning_rules', 'rules_sum', 'scores_sum']]
        self.elim_mols.write_df(self.df_elim.loc[:, elim_mols_cols])
        
        # Filtered molecules
        self.output.write_df(self.df)
        
    def whole_filtering(self):
        # The whole filtering workflow
        
        self.log_file.write_text("Filtering started...\n"\
                                 f"Total number of input molecules: {self.df.shape[0]}\n"\
                                 "-----------------------\n")
        self.apply_rules()
        self.apply_scores()
        self.add_warnings_PAINS()
        self.save_results()
        self.log_file.write_text('\n--------\nFiltering finished.')

def concatenate_all_files(folder, end_pattern):
    # We had to run ADMETlab in batches. This function combines the batches
    # in a single dataframe.
    
    file_list = os.listdir(folder)
    df = pd.DataFrame()
    
    for new_file in file_list:
        if new_file.endswith(end_pattern):
            new_df = pd.read_csv(os.path.join(folder, new_file))
            df = pd.concat([df, new_df])
            
    return df

if __name__ == '__main__':
    
    input_folder = '/mnt/c/Users/liza_/Documents/2. Studium/0 Master/Meet-EU/meeteu/Substances/'
    
    try:
        # Check if combined file exists
        df = pd.read_csv('/mnt/c/Users/liza_/Documents/2. Studium/0 Master/Meet-EU/meeteu/Substances/ecbd_all_admetlab.csv')
    except:
        # Otherwise concatenate the files from each batch
        df = concatenate_all_files(input_folder, '_admetlab.csv')
        df.to_csv('/mnt/c/Users/liza_/Documents/2. Studium/0 Master/Meet-EU/meeteu/Substances/ecbd_all_admetlab.csv')
    
    if 'eos' not in df.columns:
        df_original = pd.read_csv(os.path.join(input_folder, 'ecbd_all.csv'))
        print (df_original.shape)
        df_original = df_original.loc[df_original['smiles'] != 'O=[V]([O-])([O-])[O-].[Na+].[Na+].[Na+]']
        df_original = df_original.loc[df_original['smiles'] != 'NS(N)(=O)=O']
        print (df_original.shape)
        df['eos'] = df_original['eos']
        
    # Output folder name with the current date and tim
    now = datetime.datetime.now().strftime("%y-%m-%d_%-H-%M")
    output_folder = os.path.join(input_folder, f'admetlab_filter_{now}/')
    
    # Filter the dataframe
    my_filter = Filter(df, output_folder)
    my_filter.whole_filtering()

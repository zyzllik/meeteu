import os

### EXTRAKT DOCKING FILE NAMES ###
# Expected datastructure:
# docking
#  +---7NIO_pocket1
#        +---docking_date_time
#               +---filetered_mols_N_date_time.csv
#               +---filetered_mols_N_date_time_SMILES.csv
#        +---docking_otherdate_othertime
#        ....
#  +---7NN0_pocket1
#  .....

STRUCTURES = ['7NIO', '7NN0']
POCKETS = ['1', '2', '3', '4', '5']

DOCKING_MAIN_FOLDER = "docking/"
SAMPLE_FOLDERS = []
SAMPLES = []
for struct in STRUCTURES:
    for pocket in POCKETS:
        path = os.path.join(DOCKING_MAIN_FOLDER, f"{struct}_pocket{pocket}")
        if os.path.exists(path):
            SAMPLE_FOLDERS.append(path)
            SAMPLES.append(f"{struct}_pocket{pocket}")

DOCKING_RESULTS = []
for sample_folder in SAMPLE_FOLDERS:
    for folder in os.listdir(sample_folder):
        if os.path.isdir(os.path.join(sample_folder, folder)) and folder.startswith("docking"):
            for dockfile in os.listdir(os.path.join(sample_folder, folder)):
                if "SMILES" not in dockfile:
                    DOCKING_RESULTS.append(os.path.join(folder, '.'.join(dockfile.split('.')[:-1])))

# All targets
rule all:
    input:
        # Input files (docking results, wrong EOS)
        expand("{sample_f}/{result_f}.csv", sample_f=SAMPLE_FOLDERS, result_f=DOCKING_RESULTS),
        # Docking results, SMILES to wrong EOS, after wrong_EOS_add_SMILES
        expand("{sample_f}/{result_f}_SMILES.csv", sample_f=SAMPLE_FOLDERS, result_f=DOCKING_RESULTS),
        # Merged docking file
        expand("{sample_f}/{sample}_docking_results_merged.csv", sample_f=SAMPLE_FOLDERS, sample=SAMPLES),
        # Filterd docking results from the merged file
        expand("{sample_f}/{sample}_docking_results_merged_filtered_-11.csv", sample_f=SAMPLE_FOLDERS, sample=SAMPLES)

rule wrong_EOS_add_SMILES:
    input:
        script = "src/change_wrongEOS_to_SMILES.py",
        input_f = "{sample_f}/{result_f}.csv"
    output:
        output_f = "{sample_f}/{result_f}_SMILES.csv"
    shell:
        '''
        python {input.script} {input.input_f}
        '''

rule merge_docking_results:
    input:
        script = "src/merge_docking_results.py",
        input_f = expand("{sample_f}/{result_f}_SMILES.csv", sample_f=SAMPLE_FOLDERS, result_f=DOCKING_RESULTS)
    output:
        output_f = "{sample_f}/{sample}_docking_results_merged.csv"
    shell:
        '''
        python {input.script} {wildcards.sample}
        '''
rule filter_docking_results:
    input:
        script = "src/docking_postprocess.py",
        input_f = "{sample_f}/{sample}_docking_results_merged.csv"
    output:
        output_f = "{sample_f}/{sample}_docking_results_merged_filtered_-11.csv"
    shell:
        '''
        python {input.script} {input.input_f}
        '''
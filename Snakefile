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
for struct in STRUCTURES:
    for pocket in POCKETS:
        path = os.path.join(DOCKING_MAIN_FOLDER, f"{struct}_pocket{pocket}")
        if os.path.exists(path):
            SAMPLE_FOLDERS.append(path)

DOCKING_RESULTS = []
for sample_folder in SAMPLE_FOLDERS:
        for folder in os.listdir(sample_folder):
            for dockfile in os.listdir(os.path.join(sample_folder, folder)):
                if "SMILES" not in dockfile:
                    DOCKING_RESULTS.append(os.path.join(folder, '.'.join(dockfile.split('.')[:-1])))

# All targets
rule all:
    input:
        # Input files (docking results, wrong EOS)
        expand("{sample_f}/{result_f}.csv", sample_f=SAMPLE_FOLDERS, result_f=DOCKING_RESULTS),
        # Docking results, SMILES to wrong EOS, after wrong_EOS_add_SMILES
        expand("{sample_f}/{result_f}_SMILES.csv", sample_f=SAMPLE_FOLDERS, result_f=DOCKING_RESULTS)

rule wrong_EOS_add_SMILES:
    input:
        script = "src/change_wrongEOS_to_SMILES.py",
        input_f = "{sample_f}/{result_f}.csv"
    output:
        output_file = "{sample_f}/{result_f}_SMILES.csv"
    shell:
        '''
        python {input.script} {input.input_f}
        '''
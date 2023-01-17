import rdkit 
import meeko
import vina
from vina import Vina
import pandas as pd
import datetime
import os

def prepare_ligand(smiles):
    '''
    Input: SMILES string
    Output: Protonated molecule object
    '''
    #Create molecule object from SMILES string
    lig = rdkit.Chem.MolFromSmiles(smiles)
    
    #add hydrogens (without regard to pH)
    protonated_lig = rdkit.Chem.AddHs(lig)
    
    #generate 3D coordinates for the ligand
    rdkit.Chem.AllChem.EmbedMolecule(protonated_lig)

    #3D RDKit type molecule is converted to a PDBQT string directly
    meeko_prep = meeko.MoleculePreparation()
    meeko_prep.prepare(protonated_lig)
    lig_pdbqt = meeko_prep.write_pdbqt_string()
    
    return lig_pdbqt

def docking(protein_file, ligand, pocket, mode):
    '''
    Input:
        protein_file: Filename of the protein
        ligand: ligand molecule object
        pocket: sdf file of the binding pocket
        mode: running mode (screening or refinement)
    Output: 
        Vina object of the docking
    '''
    #Then we set, directly from string type, the prepared ligand for docking
    v = vina.Vina(sf_name='vina', verbosity=0)
    v.set_receptor(protein_file)
    v.set_ligand_from_string(ligand)

    #to get the coordinates of the docking active center, get the coordinated of the orogonal ligand
    #in our case, we will have to get the coordinates as centroid of the binding site?
    previous_ligand = next(rdkit.Chem.SDMolSupplier(pocket, sanitize = False))
    centroid = rdkit.Chem.rdMolTransforms.ComputeCentroid(previous_ligand.GetConformer())

    #compute the docking maps, run the docking, and generate 20 poses which are also written as a PDBQT string
    v.compute_vina_maps(center=[centroid.x, centroid.y,centroid.z], 
                        box_size=[25, 25, 25])
    
    #Select docking parameters depending on the mode
    if mode == 'screening':
        exhaust = 24
        num_poses = 10
    elif mode == 'refinement':
        exhaust = 32
        num_poses = 20
    
    #Docking
    v.dock(exhaustiveness=exhaust, n_poses=num_poses)
    print(v.score()[0])
    
    return v

def output(output_folder, output_file, v, eos, mode):
    '''
    Input:
        Output_folder: output folder
        Output_file: output file
        v: Vina object
        eos: EOS ID of the molecule
        mode: running mode (screening or refinement)
    '''
    
    # Write docking score to the output
    with open(output_file, 'a') as file:
            file.write(f'{eos},{v.score()[0]}\n')
            
    # If refinement mode, write also the poses
    if mode == 'refinement':
        v.write_poses(os.path.join(output_folder, f'{eos}_pose.pbqt'),
                            n_poses=1, overwrite=True)

def docking_pipeline(molecules, protein, pocket, mode='screening', start=0):
    '''
    Input:
        molecules: file with the molecules
        protein: pdbqt file of the protein
        pocket: sdf file of the pocket
        mode: running mode (screening or refinement)
        start: which row of the molecules file to start with
    '''
    
    mydata = pd.read_csv(molecules)

    # Output folder name with the current date and time
    now = datetime.datetime.now().strftime("%y-%m-%d_%-H-%M")
    output_folder = f'docking_{now}'
    os.makedirs(output_folder, exist_ok = True)
    output_file = output_folder + f'/{molecules}_{now}.csv'
    
    # Write output file header
    with open(output_file, 'w') as file:
        file.write('Molecule,Score\n')
    
    # Run docking for each molecule
    for candidate_num in range(len(mydata)):        
        if candidate_num < start:
            continue
        
        eos = mydata["eos"][candidate_num]
        print(eos + f" is being processed: {candidate_num+1} from {len(mydata)}")

        try:
            lig = prepare_ligand(mydata["smiles"][candidate_num])
            v_obj = docking(protein, lig, pocket, mode)
            output(output_folder, output_file, v_obj, eos, mode)
        except:
            with open(str(output_file), 'a') as file:
                file.write(f'{eos},ERROR\n')
            
if __name__=='__main__':
    molecules = "filtered_mols_1.csv"
    protein = "7nio_OK_A.pdbqt"
    pocket = 'pocket1_7nio.sdf'
    docking_pipeline(molecules, protein, pocket,
                     mode = 'screening', start = 2169)
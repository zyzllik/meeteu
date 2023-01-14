
import rdkit 
import meeko
import vina
from vina import Vina
import pandas as pd

scores_pocket1_7nn0 = []
mydata = pd.read_csv("filtered_mols_1.csv")
for candidate_num in range(len(mydata)):
    print(mydata["eos"][candidate_num] + " is being processed")
    lig = rdkit.Chem.MolFromSmiles(mydata["smiles"][candidate_num])
    #add hydrogens (without regard to pH)
    protonated_lig = rdkit.Chem.AddHs(lig)
    #generate 3D coordinates for the ligand
    rdkit.Chem.AllChem.EmbedMolecule(protonated_lig)

    #3D RDKit type molecule is converted to a PDBQT string directly
    meeko_prep = meeko.MoleculePreparation()
    meeko_prep.prepare(protonated_lig)
    lig_pdbqt = meeko_prep.write_pdbqt_string()

    #convert protein pdb file to the pbdqt on windows and copy it here

    #Then we set, directly from string type, the prepared ligand for docking
    v = vina.Vina(sf_name='vina', verbosity=0)
    v.set_receptor('7nio_OK_A.pdbqt')
    v.set_ligand_from_string(lig_pdbqt)

    #to get the coordinates of the docking active center, get the coordinated of the orogonal ligand
    #in our case, we will have to get the coordinates as centroid of the binding site?
    previous_ligand = next(rdkit.Chem.SDMolSupplier('pocket1_7nio.sdf', sanitize = False))
    centroid = rdkit.Chem.rdMolTransforms.ComputeCentroid(previous_ligand.GetConformer())

    #compute the docking maps, run the docking, and generate 20 poses which are also written as a PDBQT string
    v.compute_vina_maps(center=[centroid.x, centroid.y,
                                centroid.z], box_size=[25, 25, 25])
    #print(v.score()[0])
    v.dock(exhaustiveness=24, n_poses=10)
    print(v.score()[0])
    #output_pdbqt = v.poses(n_poses=20)
    #v.write_poses(mydata["eos"][candidate_num] + '_docking_results.pdbqt', n_poses=1, overwrite=True)
    #fill the data frame with the name of the tested molecule and the score
    scores_pocket1_7nn0.append([mydata["eos"][candidate_num], v.score()[0]])
df = pd.DataFrame(scores_pocket1_7nio, columns=["molecule", "score"])
df.to_csv('scores_pocket1_7nio.csv', index=False) 


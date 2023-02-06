# EUROPEAN BIOINFORMATICS MASTERS NETWORK
# Meet-EU Course 2022/2023
# Prediction of potential inhibitors for the Sars-CoV-2 Helicase (Nsp13) by virtual screening and MD simulations
### Supervised by PD Dr. Carl Herrmann, Dr. Gurdeep Singh, Magdalena Georgieva

## Description 
This repository contains code and results for virtual screening of the European Chemical Biology Database (ECBD) followed up by MD simulations to predict potential NSP13 helicase inhibitors. Results of this study may act as a starting point for anti-viral drug development targeting NSP13.

## Workflow
![Workflow](workflow.png)

## Contents of the folders:

Nsp13Structures: provided NSP13 structures, saved as separated chains
pocket_detection: output of Fpocket and P2Rank softwares for binding sites detection and results comparison
substances: csv files of the full and filteres ECBD 
docking: docking results obtained with AutoDock Vina 
MD: molecular dynamics input and trajectory files 
src: python scripts to run the tool when following instructions described below
env.yml file is a Python enviroment file

## Instructions 
Structures used for the study: [7NIO](https://www.rcsb.org/structure/7NIO) and [7NN0](https://www.rcsb.org/structure/7NN0)
### Binding sites identification
First, [P2Rank](https://github.com/rdk/p2rank) and [Fpocket](https://github.com/Discngine/fpocket) were used to predict the binding sites for both NSP13 structures. 
overlay_pockets.py script then can be run to predict the overlay in the results from different softwares
### Filtering database
[ECBD](https://ecbd.eu/) was used as a starting point and then was checked for toxicity and pharmacolokinetic properties with [ADMETlab web tool](https://admetmesh.scbdd.com/). 
substances_filter.py script filters then the ADMETlab output based on acceptance of at least 3 out of 4 rules (Lipinski Rule, Pfizer Rule, GSK Rule and Golden Triangle Rule).
### Molecular Docking
docking.py script takes the list of ligand in form of SMILES and the pdb file for protein and runs the docking with AutoDock Vina software, script has also the refinement option corresponding to the docking run with the higher exhaustiveness. Docking directly from SMILES strings is possible thanks to the [Meeko](https://www.blopig.com/blog/2022/08/meeko-docking-straight-from-smiles-string/) Python package.
docking_postprocess.py takes the docking output, filters and sorts the results 
### Molecular Dynamics simulations
XXX.ipynb jupyter notebook describes step by step the whole protein and ligand preparation process, necessary .mdp files can be found in the MD folder
This process was based on the [GROMACS tutorial](http://www.mdtutorials.com/gmx/complex/index.html) by Justin A. Lemkul, Ph.D.
### Variant analysis
[List of variants](https://www.ncbi.nlm.nih.gov/sars-cov-2/) was downloaded. 
get_mutations.py script was used then to 
### Results comparison with the Prague Team 2
XXX.py


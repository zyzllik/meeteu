import pandas as pd
import numpy as np
from pymol import cmd

# # 7NIO
# path = "../fpocket_output/7nio_OK_A_out.pdb"
# pockets = [
#     '120+123+124+135+138+139+142+143+146+179+180+181+228+230+231+232+233+283+284+285+287+288+289+290+309+310+311+312+313+316+320+360+361+374+375+378+380+381+382+383+386+404+407+408+409+410+422+442+443+537+538+539+540',
#     '175+177+178+179+406+407+408+409+412+415+416+417+485+514+515+516+532+534+553+554+557+560',
#     '161+162+178+201+202+210+212+516+519+520+523+530+531+532+535',
#     '261+264+265+286+287+290+438+440+442',
#     '281+402+419+429+430+434+456+458+460'    
# ]

# 7NN0
path = "../fpocket_output/7nn0_OK_A_out.pdb"
pockets = [
    '284+285+284+285+285+287+288+289+375+404+442+443+538+540+567+285+287+288+375+404+443+538+567+285+287+288+289+443+538+540+567+286+287+288+289+290+312+313+316+320+374+375+404+442+443+537+538+540+567',
    '139+142+143+146+177+179+180+181+230+309+361+380+382+383+405+406+407+408+409+410+412+416+417+514+534+554+557+559+560',
    '44+45+46+48+65+68+70+90+91+92'
]

# Generate list of all pockets
all_pockets = '+'.join(pockets).split('+')

### Preparing mutation list

mut_df = pd.read_csv('../sarscov2_mutations.csv')

# We are only interested in the AA mutations
mut_df = mut_df['aa_definition']

# Choose only rows containing NSP13
mut_df = mut_df[mut_df.str.contains('nsp13')]

# Concatenate all rows in one
mut_str = mut_df.str.cat(sep=',')

# Delete all not NSP13 entries
mut_list = mut_str.split(',')
nsp13_mut = [i.replace('nsp13:', '') for i in mut_list if i.startswith('nsp13')]

# Delete silent mutations
nsp13_mut = [i for i in nsp13_mut if i[0]!=i[-1]]
print('Total number of not silent mutations: ', len(np.unique(nsp13_mut)))
# Print mutations that overlap with pockets
for mut in np.unique(nsp13_mut):
    if mut[1:-1] in all_pockets:
        print(mut)

# Save only residue numbers
nsp13_mut = [i[1:-1] for i in nsp13_mut]
nsp13_mut = np.unique(nsp13_mut)
print('Total number of mutated positions: ', len(np.unique(nsp13_mut)))
### Preparing pymol figure

# Background
cmd.set('depth_cue', '1')
cmd.set('fog_start', '0.4')

cmd.set_color('b_col', '[36,36,85]')
cmd.set_color('t_col', '[10,10,10]')
cmd.set('bg_rgb_bottom', 'b_col')
cmd.set('bg_rgb_top', 't_col')
cmd.set('bg_gradient')

# cmd.set('spec_power  =  200')
# cmd.set('spec_refl   =  0')

# Load file
cmd.load(path, 'file')
cmd.select('fpocket', 'hetatm and not metals and file')
cmd.select('my_protein', 'not fpocket and not metals and file')

# Show protein
cmd.hide('everything', 'file')
cmd.show('cartoon', 'my_protein')
cmd.color('bluewhite', 'my_protein')
cmd.center('my_protein')

# Color pockets
colors = ['salmon', 'brightorange', 'paleyellow', 'lime', 'aquamarine']
for i in range(len(pockets)):
    cmd.color(
        colors[i],
        f'resi {pockets[i]} and my_protein'
    )

# Add spheres at mutation points (only mutations at pockets)
for mut in nsp13_mut:
    if mut in all_pockets:
        cmd.show(
            'spheres',
            f'resi {mut} and n. CA and my_protein'
        )
        cmd.color(
            'tv_red',
            f'resi {mut} and n. CA and my_protein'
        )
        cmd.set(
            'sphere_scale', '1',
            f'resi {mut} and n. CA and my_protein'
        )
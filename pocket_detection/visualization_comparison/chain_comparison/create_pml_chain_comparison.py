import os
import numpy as np

files = os.listdir("../../fpocket_output")
#files = ["/mnt/c/Users/liza_/Documents/2. Studium/0 Master/Meet-EU/meeteu/fpocket_output/5rm2_OK_B_out.pdb"]
proteins = [file_name.split('_')[0] for file_name in files]
proteins = np.unique(proteins)
for p in proteins:
    print('Creating visualization file for: ', p)
    
    # Get chain names
    chain_files = []
    for f in files:
        if f.startswith(p) and f.endswith('.pdb') and not f.endswith('OK_out.pdb'):
            print(f)
            chain_files.append(f)
    
    with open(f"comparison_{p}.pml", 'w') as output_f:
        output_f.write("""                  
            from pymol import cmd,stored
            
            set depth_cue, 1
            set fog_start, 0.4
            
            set_color b_col, [36,36,85]
            set_color t_col, [10,10,10]
            set bg_rgb_bottom, b_col
            set bg_rgb_top, t_col      
            set bg_gradient
            
            set  spec_power  =  200
            set  spec_refl   =  0
        """)
        chain_names = []
        for chain_file in chain_files:
            chain_name = chain_file.split('_')[2]
            chain_names.append(chain_name)
            output_f.write(f"load \"../../fpocket_output/{chain_file}\", file_{chain_name}")
            output_f.write(f"""
            select fpocket_{chain_name}, hetatm and not metals and file_{chain_name}
            select protein_{chain_name}, not fpocket_{chain_name} and not metals and file_{chain_name}

            # Select single fpocket pockets
            pockets_{chain_name} = []
            iterate fpocket_{chain_name}, pockets_{chain_name}.append(resv)
            for i in range(1, pockets_{chain_name}[-1]+1): cmd.select("fpocket_{chain_name}_"+str(i), "fpocket_{chain_name} and resi "+str(i))
            
            hide everything, all
            """)
        first_chain = chain_names[0]
        output_f.write(
            f"""
            color white, elem c
            color bluewhite, protein_{first_chain}
            show surface, protein_{first_chain}
            set transparency, 0.2, protein_{first_chain}
            """)
        for chain_name in chain_names[1:]:
            output_f.write(f"""align file_{chain_names[0]}, file_{chain_name}
                           hide everything, protein_{chain_name}""")
        
        colors = ['raspberry', 'marine', 'limon', 'deepteal']
        for n in range(len(chain_files)):
            name = chain_files[n][:-4]
            chain_name = chain_names[n]
            color = colors[n]
            
            output_f.write('\n# SAS points\n')
            output_f.write(f"load \"../../p2rank_output/visualizations/data/{name[:-4]}.pdb_points.pdb.gz\", points_{chain_name}")
            output_f.write('\n')
            
            with open(f'../../p2rank_output/visualizations/{name[:-4]}.pdb.pml', 'r') as p2rank_file:
                lines_to_write = []
                start = False
                for line in p2rank_file:
                    if 'set_color pcol1' in line or start==True:
                        start = True
                        if 'set_color' in line and '=' in line:
                            continue
                        elif 'orient' in line or 'deselect' in line:
                            continue
                        elif 'set surface_color' in line:
                            lines_to_write.append(f"set surface_color, {color}, {chain_name}_{line.split(',')[-1][1:]}")
                        elif 'select' in line:
                            surf_pocket = chain_name +'_' + line.split(',')[0].split(' ')[1]
                            #surf_pocket = chain_name+ '_surf_pocket' + line[len('select surf_pocket')]
                            ids = line.split('[')[1]
                            new_line = f"select {surf_pocket}, protein_{chain_name} and id [{ids}"
                            lines_to_write.append(new_line)
                        
            
            output_f.writelines(lines_to_write)
        output_f.write('\ndeselect\n orient')
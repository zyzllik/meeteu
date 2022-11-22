import os

files = os.listdir("../fpocket_output")
#files = ["/mnt/c/Users/liza_/Documents/2. Studium/0 Master/Meet-EU/meeteu/fpocket_output/5rm2_OK_B_out.pdb"]

for f in files:
    if f.endswith(".pdb"):
        name = f[:-4]
        with open(f"comparison_{name}.pml", 'w') as output_f:
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
            output_f.write(f"load \"../fpocket_output/{name}.pdb\", file")
            output_f.write("""
            select fpocket, hetatm and not metals
            select protein, not fpocket and not metals

            # Select single fpocket pockets
            pockets = []
            iterate fpocket, pockets.append(resv)
            for i in range(1, pockets[-1]+1): cmd.select("fpocket_"+str(i), "fpocket and resi "+str(i))

            #create ligands, protein and organic
            #select xlig, protein and organic
            #delete xlig
            
            hide everything, all
            
            color white, elem c
            color bluewhite, protein
            #show_as cartoon, protein
            show surface, protein
            set transparency, 0.2, protein
            
            show sticks, ligands
            set stick_color, magenta
            
            
            
            
            # SAS points
            """)
            output_f.write(f"load \"../p2rank_predictions/visualizations/data/{name}.pdb_points.pdb.gz\", points")
            output_f.write('\n')
            with open(f'../p2rank_predictions/visualizations/{name[:-4]}.pdb.pml', 'r') as p2rank_file:
                lines_to_write = []
                start = False
                for line in p2rank_file:
                    if 'set_color pcol1' in line or start==True:
                        lines_to_write.append(line)
                        start = True
            
            output_f.writelines(lines_to_write)
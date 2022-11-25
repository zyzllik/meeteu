                  
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
        load "../fpocket_output/7nn0_OK_B_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/7nn0_OK_B_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4416,4419,4420,4359,4371,4384,6869,8350,8352,6245,6246,8349,5776,5787,5790,4838,5777,4789,4797,4796,4405,4385,6861,6865,4386,4387,4391,6839,6840,6841,6843,4406,4412,4449,4438,4439,4837,4895,4434,4445,4897,8361,8362,8363,8364,8809,8385,8386,6868] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [8317,8604,8609,8692,6302,8602,8608,6376,6436,6445,6448,6449,6452,6312,6316,6291,6299,6277,6279,6280,8644,8645,8646,8647] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [667,727,999,1000,1340,1341,1364,689,696,677,1030,1031,725,1029,996,679] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        
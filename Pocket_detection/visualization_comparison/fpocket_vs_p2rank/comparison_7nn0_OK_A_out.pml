                  
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
        load "../fpocket_output/7nn0_OK_A_out.pdb", file
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
            load "../p2rank_output/visualizations/data/7nn0_OK_A_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4406,4410,4411,4417,4868,4421,4869,4378,4379,4384,4357,4358,4359,6833,6836,6840,6832,6810,6812,4377,8356,8357,8358,3997,4920,4942,4944,6811,6813,4422,4424,4425,4426,5762,8333,8335,4343,4392,6216,6217,8780,4356,4388,4391] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2038,2039,2042,5862,2087,5831,5860,5858,1979,2022,5832,2102,2152,3505,3508,2151,3479,6272,6274,2084,3509,5555,5553,6275,4722,5882,5538,5549,5550,5881] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2022,5830,5840,1732,5845,5846,1788,1800,5844,1968,5854,1976,1977,1980,5831,6290,1969] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [2731,2732,2733,2994,5212,5213,2995,2992,2993,5177,2671,3028,5191,3509,3510,4747,4750,5130,5555,3481] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1950,1952,259,283,305,326,50,28,318,324,1870,3582,1992,1993,1994,3569] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2150,2151,3479,2152,3508,2699,6272,6312,6313,2084,2082,2083,2149,2695,2707,2730,3464,2727,2713,2715] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [640,666,973,1004,972,1313,1314,1325,1003,967,968,969,937,939,962,652,1337,1326,650] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [6813,6814,3992,6816,4040,4053,4052,4423,4426,4366,6764,6812,4378] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        
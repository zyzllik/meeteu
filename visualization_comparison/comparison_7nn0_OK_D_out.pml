                  
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
        load "../fpocket_output/7nn0_OK_D_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/7nn0_OK_D_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4810,4410,4411,4388,4406,4356,4357,4358,4359,4377,6813,6833,4378,8336,8342,6840,6841,8358,6837,6811,6812,4391,5759,5761,6217,6218,4392,5749,5748,8324,4769,8321,8333,8334,8343,8781,4761] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [2699,6271,6274,6284,8577,8580,8664,8289,8618,8574,8617,8619,6408,6287,8578,8579,8581,8582,7986,2658,2659,6288,6290,6421,6251,6252,6263,6511,6420,6347,6417,6234,8287,8288,6249,8646,8647,8648] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1337,1325,652,1313,940,1314,972,967,973,650,662,666,668,1003,1004,969,698,700,1002,640] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [2707,2713,2695,2732,2151,2152,3508,2150,6313,6273,2715,2083,2149,6314,2087,2039,2041,2103,2040,2084] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [1624,242,243,244,550,231,237,220,228,1600,551,2006] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        
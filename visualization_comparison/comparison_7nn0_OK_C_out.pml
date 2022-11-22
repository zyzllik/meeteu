                  
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
        load "../fpocket_output/7nn0_OK_C_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/7nn0_OK_C_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4769,4810,5749,4388,4391,5748,4392,5758,5759,5760,5761,8324,6217,6219,6218,4343,4356,4406,4410,4417,4421,4411,4866,4867,4378,4377,4357,4358,4359,4363,4422,4869,4868,8360,8336,8337,4761,8320,8322,8334,8335,6842,8720,8721,8782,4346] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [8582,8664,8665,8289,6235,8583,7987,2697,2699,6275,8288,8290,6345,2660,8578,8579,8580,8581,6425,6409,6421,6348,6405,6410,6418,8619,6252,6253,8650,6272,6264,6250,6285,6288,6289,6347,6349,6400,6346] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2042,2103,3505,3507,6274,6265,6277,5833,5859,5881,5882,5883,5832,2038,2039,2084,2087,2101,2083,4724,5803,4723,4722,5556,5555,2695,2152,6314,6315,2151] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1947,1868,1870,1931,1946,97,1994,3569,1992,1993,3582,1952,1950,305,28,50,283,324,326,38,25,29] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1313,1314,972,940,973,1325,666,698,1003,1004,969,640,650,652,1337,662] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1624,550,1600,551,220,228,237,243,231,244,2006,242] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [3065,8076,3185,3184,8078,2676,8115,8116,8225,8228] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [7332,7657,9174,9158,9159,9171,7729,7731,7292,9211,7780,7783,7784,7806,7655] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        
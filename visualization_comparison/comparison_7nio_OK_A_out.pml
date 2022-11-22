                  
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
        load "../fpocket_output/7nio_OK_A_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/7nio_OK_A_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [2066,2067,2068,2069,2113,2114,2115,2129,3532,3533,3534,3535,3548,6291,6300,6303,6312,6317,6318,6319,6316,6313,6335,2065,5888,5886,3575,3580,5890,5892,5951,5859,5872,5882,5858,5860,5868,5910,6531,1827,2007,5873,5874,2111,2112,2048,3565,1759,2047,2049,1815,2006,2004,6340,2178,2722,2734,2740,2754,2760,2179,3506,3536,3537,2758,3507,2757,6302,2742,6341,2176,2177,4750,4761,4748,4749,4758,5580,5581,5582,5576,5577,5579,5830,5831,5832,5833,5834,5909,5564,5565,5950,5789,4762,5788,4768,4774,4789,2702,2703,8312,8346,8347] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [2725,2726,6301,2685,2686,2687,8052,8315,7548,2741,8600,8601,8604,8608,8691,8605,8606,8607,8609,8643,8032,8013,8025,8030,8593,6371,6388,6390,6336,6338,2652,2653,7534,7535,8580,6444,6448,6451,6278,6279,6447,8646,6435,8644,8645,8676,6290,6298,6299,6311,6315,6276,6375,6373,6426,6314,8314,8316,8284,2703,2700] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [4433,4444,4415,4386,4404,4405,4406,4411,4448,4437,4438,4837,4893,4894,4895,4358,4385,4383,4384,6860,6838,6840,4450,6842,4418,4419,6205,6245,8348,4370,6195,6201,4762,4788,4796,5776,5785,5786,5787,5788,5821,8349,8350,6241,8360,8361,8362,8363,8367,6868,8385,6861,6864,8346,4789] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [3090,3092,3091,3250,3251,8091,8254,8251,8248,2413,2415,2438,3211,3212,8102,8104,8140,8141,8142,8325,2699,8269,8326,8284,8235,3088,8049,3107,8105] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [4449,4450,4453,6842,6844,4451,4452,4019,4079,4066,4067,4065,6843,4023,4393,4405,4448,4407,4465,4080,6792,6816,6786,6811,6815,6817,6814] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [4173,4234,4235,3761,3763,3764,4304,6741,6742,6743,6630,4303,3730,4276,3728,6718,6703] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [6217,6665,6218,7054,7094,6661,6646,6663,7052,7122,4338,4339,6728,6666,6483,6482] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [1896,1897,78,56,3597,2020,2021,3596,310,332,345,73,55,65,351,353,286,3609] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [677,679,689,696,667,1363,1364,1365,177,178,967,1339,1341,1029,1031] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [264,269,270,577,247,2033,1651,1627,578,2099] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [6604,6605,6606,6607,1824,6565,1938,1939,1940,6567,6563,6566,1881,1836,1838,1852,3680,6631] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [3173,3175,2485,2318,2618,2486,2518,2522,3134,2482,3171,2668,3195] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        
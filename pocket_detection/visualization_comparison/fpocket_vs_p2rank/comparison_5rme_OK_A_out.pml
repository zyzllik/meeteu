                  
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
        load "../fpocket_output/5rme_OK_A_out.pdb", file
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
            load "../p2rank_output/visualizations/data/5rme_OK_A_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4404,6853,4389,4390,4378,6777,4821,4418,4419,4422,4423,4835,4434,4436,4437,4438,4879,4881,4004,4435,4065,4051,4052,4008,8368,8370,4822,6229,4402,4403,6230,5766,4783,5758,5760,8331,8345,8346,8347,8348,4772,4773,4784,4774,8333,8335,4747,5773,5767,5770,5771,4369,6824,6846,6849,6850,4370,4371,6827,6828,6825,6829,6799,6796,6802,4355,8793,6852,6771,6789] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [2672,2670,2710,8034,8037,2711,2647,2726,8032,2650,3073,3084,3088,7495,3087,6263,6264,6275,6283,6286,6287,6296,6301,6433,6523,8036,8268,8270,8310,2684,2686,8033,8090,8298,8299,8300,8301,8306,2638,6299,6356,6358,6360,2634,2637,7505,7506,7507,8577,8585,8586,8589,8590,8592,8593,8594,7532,7521,7528,7533,8018,8016,7517,7492,8045,8048,8676,7998,8044,8578,8628,8629,8630,6432,6469,8631,8658,8659,8661,6419,6420,6411,6416,6429] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [2053,6285,2098,6325,2114,2163,2051,2052,3491,6286,2719,2725,3476,2742,3493,2706,2707,2708,2739,2743,6326,2160,2094,2142,2144,2112,2113,2161,2162,2727,2728,2216,2095] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [2114,3517,2051,2052,5566,5568,3518,3520,2050,5876,5872,5874,5893,2053,5843,5844,6276,6285,2098,5894,4733,4734,5203,5565,5567,4735,5814,2111,3516,3550,2112] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [5852,5856,5857,5858,5859,1798,1919,1991,5839,5842,5844,6303,6304,6495,6516,1811,2033,1799,1987,1988,1743] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [6468,6651,6650,7037,7038,7039,6631,6646,6701,7077,7080,6200,6212,6213,8660,6216,7040,7041,8644,8661,4323,4324,6757,6759,7053,7054,7055,7058,7073,7104,6760,6755,6756,6455,6469,6203,6713] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [1349,1323,1325,984,661,680,650,651,709,711,1015,980,950,973,978,161,162,1348,663] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [1940,1957,1958,1963,1878,61,39,336,1879,2003,2004,2005,271,3581,270,294,316,329,3594,1942,1944] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [6613,6616,4289,6703,6688,6615,4259,4261,3712,3713,3715,3748,3749,6728,6727] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [798,809,821,788,789,793,794,1098,1099,1051,1083,1084] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [1808,6590,6591,6592,6673,1865,1923,1924,6548,6551,6552,6550,6614,6616,1820,1821,1822,1836] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [94,1435,1436,1437,116,120,103,104,105,115,126,1407,119] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        
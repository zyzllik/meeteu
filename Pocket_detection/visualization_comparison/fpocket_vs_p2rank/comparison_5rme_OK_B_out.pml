                  
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
        load "../fpocket_output/5rme_OK_B_out.pdb", file
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
            load "../p2rank_output/visualizations/data/5rme_OK_B_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4394,4414,5751,4413,4772,4774,4813,4395,4346,4359,4360,4361,4393,4812,4870,4871,4872,4362,6816,6818,4380,4381,5796,8326,6217,6220,6181,4775,5762,5765,5758,5761,5757,6177,6171,6844,8339,8361,6843,8359,8360,8321,8322,8323,8324,8336,8337,8338,8784,4764,4765,6837,6840,6814,6815,6836] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.353,0.702]
select surf_pocket2, protein and id [8569,8620,8621,8667,8622,8577,8580,8581,8582,8583,8584,8585,6237,8291,8290,8292,6274,6277,2663,2700,2701,2674,8261,8289,8297,8298,8301,6412,8576,2716,6289,6290,6347,7511,7520,8007,8009,8028,7989,2662,2661,2660,8259,8260,6252,6254,6255,6423,8652,6266,6287,6351,6407,6411,6420,6424,6402,6291,6349] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.388,0.361,0.902]
select surf_pocket3, protein and id [6267,2104,3508,3509,2042,2043,2044,5834,5883,5884,5885,5863,5867,5865,3524,3556,5926,3555,2089,2086,2088,2090,3541,3536,3551,4723,4724,4725,4734,5557,5558,5559,4753,4726,4737,5806,5809,5764,5765,5805,5540,5556,5553,5552,5555,2729,3482,2732,2733,3511,3512,2697,2709,6276,6278,6279,2735,2715,2085,2151,2152,2153,2154,3462,6316,2717,6317,4750] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.396,0.278,0.702]
select surf_pocket4, protein and id [4369,6787,6791,6793,4041,4055,4056,4042,4043,3995,4383,4425,4426,4428,4429,4362,6817,6818,6819,4381,6790,6820,4000,4427,6762,6763,6780,6744,6768] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.631,0.361,0.902]
select surf_pocket5, protein and id [2677,3224,3225,3226,2676,3066,8022,8024,8025,8255,8260,8067,8069,8078,8080,8081,8117,3186,3187,3077,8302,8245,8224,8227,8230,8239,8118,8246] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.584,0.278,0.702]
select surf_pocket6, protein and id [1734,1728,1731,1730,1979,2024,1790,1800,1982,5833,5835,5857,5843,6295,6294,6507,6486,5847,5848,5849,5850,1801,1803,6525] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.875,0.361,0.902]
select surf_pocket7, protein and id [4313,4314,6191,6192,6194,7030,6641,4315,7071,7031,7032,7028,6203,6204,6637,6622,6704,7098,8652,8635,6447,6459,6642,6639] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.627]
select surf_pocket8, protein and id [3706,4210,3704,3739,3740,4279,4280,4252,6606,6604,6679,4250,6694,6717,6718,6719,6675,4149] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.682]
select surf_pocket9, protein and id [1327,1315,1316,942,700,702,1006,1005,971,642,654,1339,664,652,670,641] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.439]
select surf_pocket10, protein and id [2643,3074,3170,2591,2593,3078,3079,2497,7487,7497,7498,8040,2637,2641,2642,2612,7513,2640,8027,2589,3137,3139,3082] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.439]
select surf_pocket11, protein and id [4725,4734,4744,5557,5558,5559,4753,5157,5158,5159,5133,5555,5216,5154,5155,5176,5177,5186,5180,4750] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.310,0.278]
select surf_pocket12, protein and id [260,284,50,306,309,319,325,327,1871,1872,1996,3572,1995,3585,3573,28,183,265] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.522,0.361]
select surf_pocket13, protein and id [3571,3583,3589,5926,3601,3606,3555,5865,5921,5925,5981,5970,5982,5983,5555] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.502,0.278]
select surf_pocket14, protein and id [7293,7294,7264,7295,7809,7262,9160,9161,7808,7850] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.765,0.361]
select surf_pocket15, protein and id [6542,6582,6583,6541,6581,6664,1856,1914,1915,1799,1811,1827,3656,6606,6607,3654,3672] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.690,0.278]
select surf_pocket16, protein and id [1400,1401,1402,1399,1380,1381] 
set surface_color,  pcol16, surf_pocket16 
   
        
        deselect
        
        orient
        
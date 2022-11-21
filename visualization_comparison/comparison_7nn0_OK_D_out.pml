                  
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
            hide nonbonded, points
            show nb_spheres, points
            set sphere_scale, 0.2, points
            cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)
            hide nb_spheres, points
            
            
            stored.list=[]
            cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
            lastSTP=stored.list[-1] # get the index of the last residue
            hide lines, resn STP
            
            cmd.select("rest", "resn STP and resi 0")
            
            for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
            for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
            for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
            for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))
            
            
            
            set_color pcol1 = [0.361,0.576,0.902]
    select surf_pocket1, protein and id [4402,4403,4404,4355,4368,4369,4370,4371,6825,6849,4389,4390,6827,6828,6829,4881,4783,4422,4821,4835,4423,4400,5760,4879,4880,4433,4434,4436,4437,4438,6853,8347,8348,8368,8369,6852,8370,4819,4822,6230,8331,8333,8335,8345,8346,8793,5805,6226,6228,6229,6189,6180,6181,6186,6190,5770,5771,5758,5766,5767,5773,4772,4773,4781,4784,4774,6846] 
    set surface_color,  pcol1, surf_pocket1 
    set_color pcol2 = [0.278,0.365,0.702]
    select surf_pocket2, protein and id [6275,8592,6263,8593,8594,6416,6429,6433,6432,6436,6521,6283,2710,6286,6296,6302,2637,2670,2672,7528,7529,7533,2711,8037,7532,2709,2647,3091,7495,7492,8045,8048,2650,3089,3084,3085,3088,3090,2651,8298,8299,8268,8269,8270,8301,7998,2684,8034,8030,8032,8044,2686,6261,6264,8300,8676,6523,8306,8307,8310,2638,7519,7521,7522,7506,7517,2634,6360,6411,8589,7520,8016,8018,8590,6419,6420,6421,8577,8578,8585,8586,8628,8629,8630,8631,8625] 
    set surface_color,  pcol2, surf_pocket2 
    set_color pcol3 = [0.361,0.361,0.902]
    select surf_pocket3, protein and id [2115,3517,3518,3519,3520,3521,2052,5872,5874,5893,2053,2054,5843,6285,2099,6276,2051,5565,5566,5567,5568,5818,4735,5814,5894,5202,5203,4733,4742,4743,4746,4734,2112,2100] 
    set surface_color,  pcol3, surf_pocket3 
    set_color pcol4 = [0.365,0.278,0.702]
    select surf_pocket4, protein and id [5852,6516,1812,5856,5857,5858,1920,2053,5842,5843,5844,6303,6304,2099,6495,2034,1744,1800,1980,1981,1988,1989] 
    set surface_color,  pcol4, surf_pocket4 
    set_color pcol5 = [0.576,0.361,0.902]
    select surf_pocket5, protein and id [6325,2115,2164,3491,2053,6285,2099,2051,2052,2719,2725,3476,2707,2739,2742,2743,3493,2708,2745,2161,2162,2163,2096,2095,2113,2112,6326,6324,2143,3475,3473,2727,2098,2100] 
    set surface_color,  pcol5, surf_pocket5 
    set_color pcol6 = [0.533,0.278,0.702]
    select surf_pocket6, protein and id [6216,7040,7041,7058,7039,7053,7054,7055,7073,7077,7080,6651,6760,6756,7103,7104,4323,4324,6203,6757,6759,6631,6701,6713,6212,6213,6754,6755,6468,6201,6467,6650,6646,6648] 
    set surface_color,  pcol6, surf_pocket6 
    set_color pcol7 = [0.792,0.361,0.902]
    select surf_pocket7, protein and id [4289,6703,6728,4259,3712,3715,4219,3713,3746,3748,3749,4220,4288,4158,4157,6615,6616,4261,6688] 
    set surface_color,  pcol7, surf_pocket7 
    set_color pcol8 = [0.702,0.278,0.702]
    select surf_pocket8, protein and id [162,1343,1348,1349,1350,1337,652,664,681,710,712,985,1322,1324,1326,951,1016,1014,981] 
    set surface_color,  pcol8, surf_pocket8 
    set_color pcol9 = [0.902,0.361,0.792]
    select surf_pocket9, protein and id [6827,6828,6829,4004,4052,4065,4051,4390,4378,6777,4435,4436,4437,4438,4392,6802] 
    set surface_color,  pcol9, surf_pocket9 
    set_color pcol10 = [0.702,0.278,0.533]
    select surf_pocket10, protein and id [1941,1958,1959,1962,2004,2005,2006,3581,1880,49,57,1877,1878,1879,59,274,275,60,61,39,329,333,336,1964,270,316,1943,1945,3594] 
    set surface_color,  pcol10, surf_pocket10 
    set_color pcol11 = [0.902,0.361,0.576]
    select surf_pocket11, protein and id [8236,8238,8126,8127,8264,8255,8036,8076,2687,2688,3077,3076,8090,8087,3073,3236,3197,3196,8269] 
    set surface_color,  pcol11, surf_pocket11 
    set_color pcol12 = [0.702,0.278,0.365]
    select surf_pocket12, protein and id [5565,5566,5567,5568,5563,5564,5202,5203,5199,5201,5164,5537,5141,5142,4734,4759,4762,5195] 
    set surface_color,  pcol12, surf_pocket12 
    set_color pcol13 = [0.902,0.361,0.361]
    select surf_pocket13, protein and id [5818,4743,4746,4747,4753,5773,4770,4774,4734,8297,4757,4759,5225,8296,8306,8307,6288] 
    set surface_color,  pcol13, surf_pocket13 
    set_color pcol14 = [0.702,0.365,0.278]
    select surf_pocket14, protein and id [1809,1859,1866,1923,1924,1925,1837,1863,6590,6591,6592,6548,6550,6614,6616,6551,3663,3665,3662] 
    set surface_color,  pcol14, surf_pocket14 
    set_color pcol15 = [0.902,0.576,0.361]
    select surf_pocket15, protein and id [799,1052,1084,1085,1099,798,1100,822,810,790,794,795] 
    set surface_color,  pcol15, surf_pocket15 
    set_color pcol16 = [0.702,0.533,0.278]
    select surf_pocket16, protein and id [5935,3580,5874,5876,3564,3565,5934,5979,5990,5991,5992,5993] 
    set surface_color,  pcol16, surf_pocket16 
    set_color pcol17 = [0.902,0.792,0.361]
    select surf_pocket17, protein and id [1731,1784,1637,1638,1582,1583,1584,1726] 
    set surface_color,  pcol17, surf_pocket17 
    set_color pcol18 = [0.702,0.702,0.278]
    select surf_pocket18, protein and id [3092,2467,2470,2471,2507,2503,2622,2599,2600,7507,3090,2652,2653,3181,2473,3154,3155,3156,3179,3180] 
    set surface_color,  pcol18, surf_pocket18 
    
            
            deselect
            
            orient
                            
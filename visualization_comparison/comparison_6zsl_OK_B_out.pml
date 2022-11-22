                  
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
        load "../fpocket_output/6zsl_OK_B_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/6zsl_OK_B_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [8318,8333,8334,8335,6216,8332,4356,4391,8780,4343,4771,4760,4768,4769,4772,4810,4762,4823,5748,6153,4390,4324,4388,4389,6166,5754,5755,5758,5759,5762,5793,6167,6168,6173,8322,8320,6213,6215,6217,6177,4411,4421,4869,4357,4392,6815,6816,6812,6810,6811,6832,6833,6836,6839,6840,8355,8356,8357,8358,4807,4809,4410,4867,4868,3997,4424] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [8663,8618,8577,8579,8580,8573,8576,8581,8565,8572,8616,2714,2716,2661,2698,6273,6343,8566,2658,2659,2660,8023,7507,8003,8005,7985,6250,6419,6420,6423,6407,8617,6416,6262,6270,6283,6287,6347,6403,6398,6408,6248,8287,6251,6233,2673,2674,2676,8256,8257,8286,8288,2672,2668,3065] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [2102,3505,3507,2087,6263,6272,6275,2038,2039,2040,2041,2042,3533,5862,5864,5860,5923,3521,3548,3552,3553,5831,2083,2100,3538,2084,2086,2088,2727,2150,2151,2152,3479,2730,2695,2707,2713,2715,6312,6274,2149,6311,6313,2131,4721,4722,4723,4724,5880,5881,5882,5553,5554,5555,5556,5550,5552,4734,4735,5761,5803,5802,5762,5806,2733,2731] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [2673,2674,8018,8021,8256,8257,8065,8297,8223,8235,8242,8298,8251,2672,2668,3063,3064,3065,3223,3224,3061,3062,8020,8226,8074,8077,8113,8114,8063,3222,2661] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [7165,4424,3994,4423,4425,4426,3992,4038,4039,4040,6815,6816,6814,4366,6786,6813,6776,6783,6787,6788,6789,6758,6740,4053,4093,6764] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [6200,6188,6454,6455,6187,4311,6637,6638,4312,8631,7007,7024,7027,7028,7026,7065,7066,7067,6633,6635,6618,6688,6700,7094,6442,6456] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [1980,5830,5832,6503,5840,2039,6482,6291,6290,5846,5844,5845,5847,1798,1801,1977,1787,1788,1729,1728,2022,1732] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [3703,3701,3733,3736,3737,4276,4277,4247,4249,6602,6600,6714,6671,6690,6673,6675,4145,4146,4208,6709,6713,6715,3735] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [2589,7494,3080,7493,2591,2495,2458,2491,7483,2641,3168,3076,3077,2455,3137,3147,2446,2447,2587] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [700,1313,1314,940,969,666,698,668,1003,1004,1337,639,640,650,662,652] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [1869,283,1870,28,50,305,318,324,326,1994,3569,259,264,1993,3582] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [5213,5190,5191,4747,4750,5556,5553,5554,5555,3507,3510] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [1797,6578,6579,6576,6577,6538,1854,1912,1809,1825,1810,6537,3653,6602,6601,6603,3650,3651,3669] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [3097,3079,3075,3076,3078,8036,7543,8032,8035,8089,8077,8034] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [228,237,243,220,1600,1609,1610,550,551,244,1624] 
set surface_color,  pcol15, surf_pocket15 
   
        
        deselect
        
        orient
        
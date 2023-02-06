                  
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
        load "../fpocket_output/7nio_OK_E_out.pdb", file
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
            load "../p2rank_output/visualizations/data/7nio_OK_E_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4721,4730,5804,4392,4769,4772,5759,4731,4734,4735,4768,4722,5761,6217,6218,8333,8781,6841,8334,8335,8336,8358,8359,4809,4810,4865,4867,4410,4411,5749,4406,4391,4343,4356,4357,4377,4378,4384,4388,4389,4331,4365,4424,4869,4723,4724,5882,5550,5553,5554,5555,5549,5537,5538,5880,5881,5922,5923,5552,5921,5805,5802,5806,6264,6276,6273,6275,3521,5831,2040,2042,2041,5860,5862,5864,3553,3552,2086,2088,2084,2087,2100,3538,2103,2038,3533,4346,6811,6812,6837,4359,6813,6815,2671,2673,2672,5213,8283,8286,8285,8295,4741,4758,4761,4762,4745,8297,8319,8341,8342,8351,8356,2693,2695,2698,6313,2713,2716,2707,2152,3479,2731,2733,3505,3507,2149,2150,2151,6311,2131,2133,2204,2715,6314,2727,3464] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.361,0.702]
select surf_pocket2, protein and id [8580,8581,8582,2661,2699,2659,7508,2638,2658,2660,8025,2625,2626,2675,2676,7986,8289,8664,8288,2674,8018,8022,8256,8257,8565,8573,8574,8577,8578,8006,8004,6263,6421,6420,6271,6284,6274,6249,6251,6252,6287,6348,6408,8566,8616,8617,8618,8619,6399,6417] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.373,0.361,0.902]
select surf_pocket3, protein and id [4750,2995,5186,5188,5191,5130,4747,5213,5187,2733,3507,3510,5553,5554,5555,5556,2042,4731,4722] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.380,0.278,0.702]
select surf_pocket4, protein and id [8021,3075,3095,8078,8075,8077,3101,3061,3184,3185,3117,3113,8127,2412,2388,8019,8022,8064,8252,8257,3062,3063,3064,3065,3224,8258,8298,8299,2674,8227,8115,8114,8223,8224,8236,8243,8024] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.600,0.361,0.902]
select surf_pocket5, protein and id [6638,6639,7027,7067,6636,8649,8632,6456,6201,6204,8648,7028,7029,7046,4311,7041,7043,7044,7094,7095,6747,6457,6444,6191,6619,4312,6700,6689,6701,6200,6455,6188,6190] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.557,0.278,0.702]
select surf_pocket6, protein and id [6291,5830,5831,5840,6292,6504,1800,5844,5846,1908,6290,1732,1969,2022,1787,1788,1968,1970,1977,1976,2088] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.831,0.361,0.902]
select surf_pocket7, protein and id [4422,4423,4424,4425,4426,4053,4038,4039,4040,3992,4377,4378,4380,4365,4366,6759,6762,6765,6813,6787,6815,6816,6817,7167,7168,6784,6788,6790,6760,6777] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.667]
select surf_pocket8, protein and id [3700,3701,3737,4276,4271,3703,4245,4247,4249,4242,4261,6676,4277,6691,6709,6713,6714,6716,6603,6604] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.741]
select surf_pocket9, protein and id [3569,283,305,324,326,1870,1994,308,1952,1993,50,28,38,1868,46,260,259,3582] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.486]
select surf_pocket10, protein and id [973,1313,1314,1337,668,669,640,698,700,1004,967,962,969] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.514]
select surf_pocket11, protein and id [1087,1088,787,792,798,810,783,1040,1072,1073,1050,778] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.310]
select surf_pocket12, protein and id [2458,2490,2491,2495,2455,2459,3147,7494,3146,3148,2589,2590,2591,2588,7493,3144,3168] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.435,0.361]
select surf_pocket13, protein and id [237,241,243,220,550,551,2006,2072,1624,1610,1600,244] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.427,0.278]
select surf_pocket14, protein and id [8954,8955,8988,8991,8564,8604,8605,8537,8539,8606,8953,8542] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.667,0.361]
select surf_pocket15, protein and id [1714,1709,1708,1719,1572,1772,1571,1625] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.608,0.278]
select surf_pocket16, protein and id [7711,7715,7709,7710,7780,9170,7729,7731,9155,9158,7805,7806,7779,7331,9209,9173,7654,7722,7723,7726] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.894,0.361]
select surf_pocket17, protein and id [7290,7292,7291,7805,7806,7732,7731,9158] 
set surface_color,  pcol17, surf_pocket17 
   
        
        deselect
        
        orient
        
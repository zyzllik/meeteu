                  
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
        load "../../fpocket_output/7nn0_OK_A_out.pdb", file_A
            select fpocket_A, hetatm and not metals and file_A
            select protein_A, not fpocket_A and not metals and file_A

            # Select single fpocket pockets
            pockets_A = []
            iterate fpocket_A, pockets_A.append(resv)
            for i in range(1, pockets_A[-1]+1): cmd.select("fpocket_A_"+str(i), "fpocket_A and resi "+str(i))
            
            hide everything, all
            load "../../fpocket_output/7nn0_OK_B_out.pdb", file_B
            select fpocket_B, hetatm and not metals and file_B
            select protein_B, not fpocket_B and not metals and file_B

            # Select single fpocket pockets
            pockets_B = []
            iterate fpocket_B, pockets_B.append(resv)
            for i in range(1, pockets_B[-1]+1): cmd.select("fpocket_B_"+str(i), "fpocket_B and resi "+str(i))
            
            hide everything, all
            load "../../fpocket_output/7nn0_OK_C_out.pdb", file_C
            select fpocket_C, hetatm and not metals and file_C
            select protein_C, not fpocket_C and not metals and file_C

            # Select single fpocket pockets
            pockets_C = []
            iterate fpocket_C, pockets_C.append(resv)
            for i in range(1, pockets_C[-1]+1): cmd.select("fpocket_C_"+str(i), "fpocket_C and resi "+str(i))
            
            hide everything, all
            load "../../fpocket_output/7nn0_OK_D_out.pdb", file_D
            select fpocket_D, hetatm and not metals and file_D
            select protein_D, not fpocket_D and not metals and file_D

            # Select single fpocket pockets
            pockets_D = []
            iterate fpocket_D, pockets_D.append(resv)
            for i in range(1, pockets_D[-1]+1): cmd.select("fpocket_D_"+str(i), "fpocket_D and resi "+str(i))
            
            hide everything, all
            
            color white, elem c
            color bluewhite, protein_A
            show surface, protein_A
            set transparency, 0.2, protein_A
            align file_A, file_B
                           hide everything, protein_Balign file_A, file_C
                           hide everything, protein_Calign file_A, file_D
                           hide everything, protein_D
# SAS points
load "../../p2rank_output/visualizations/data/7nn0_OK_A.pdb_points.pdb.gz", points_A
select A_surf_pocket1, protein_A and id [4406,4410,4411,4417,4868,4421,4869,4378,4379,4384,4357,4358,4359,6833,6836,6840,6832,6810,6812,4377,8356,8357,8358,3997,4920,4942,4944,6811,6813,4422,4424,4425,4426,5762,8333,8335,4343,4392,6216,6217,8780,4356,4388,4391] 
set surface_color, raspberry, A_surf_pocket1 
select A_surf_pocket2, protein_A and id [2038,2039,2042,5862,2087,5831,5860,5858,1979,2022,5832,2102,2152,3505,3508,2151,3479,6272,6274,2084,3509,5555,5553,6275,4722,5882,5538,5549,5550,5881] 
set surface_color, raspberry, A_surf_pocket2 
select A_surf_pocket3, protein_A and id [2022,5830,5840,1732,5845,5846,1788,1800,5844,1968,5854,1976,1977,1980,5831,6290,1969] 
set surface_color, raspberry, A_surf_pocket3 
select A_surf_pocket4, protein_A and id [2731,2732,2733,2994,5212,5213,2995,2992,2993,5177,2671,3028,5191,3509,3510,4747,4750,5130,5555,3481] 
set surface_color, raspberry, A_surf_pocket4 
select A_surf_pocket5, protein_A and id [1950,1952,259,283,305,326,50,28,318,324,1870,3582,1992,1993,1994,3569] 
set surface_color, raspberry, A_surf_pocket5 
select A_surf_pocket6, protein_A and id [2150,2151,3479,2152,3508,2699,6272,6312,6313,2084,2082,2083,2149,2695,2707,2730,3464,2727,2713,2715] 
set surface_color, raspberry, A_surf_pocket6 
select A_surf_pocket7, protein_A and id [640,666,973,1004,972,1313,1314,1325,1003,967,968,969,937,939,962,652,1337,1326,650] 
set surface_color, raspberry, A_surf_pocket7 
select A_surf_pocket8, protein_A and id [6813,6814,3992,6816,4040,4053,4052,4423,4426,4366,6764,6812,4378] 
set surface_color, raspberry, A_surf_pocket8 

# SAS points
load "../../p2rank_output/visualizations/data/7nn0_OK_B.pdb_points.pdb.gz", points_B
select B_surf_pocket1, protein_B and id [4416,4419,4420,4359,4371,4384,6869,8350,8352,6245,6246,8349,5776,5787,5790,4838,5777,4789,4797,4796,4405,4385,6861,6865,4386,4387,4391,6839,6840,6841,6843,4406,4412,4449,4438,4439,4837,4895,4434,4445,4897,8361,8362,8363,8364,8809,8385,8386,6868] 
set surface_color, marine, B_surf_pocket1 
select B_surf_pocket2, protein_B and id [8317,8604,8609,8692,6302,8602,8608,6376,6436,6445,6448,6449,6452,6312,6316,6291,6299,6277,6279,6280,8644,8645,8646,8647] 
set surface_color, marine, B_surf_pocket2 
select B_surf_pocket3, protein_B and id [667,727,999,1000,1340,1341,1364,689,696,677,1030,1031,725,1029,996,679] 
set surface_color, marine, B_surf_pocket3 

# SAS points
load "../../p2rank_output/visualizations/data/7nn0_OK_C.pdb_points.pdb.gz", points_C
select C_surf_pocket1, protein_C and id [4769,4810,5749,4388,4391,5748,4392,5758,5759,5760,5761,8324,6217,6219,6218,4343,4356,4406,4410,4417,4421,4411,4866,4867,4378,4377,4357,4358,4359,4363,4422,4869,4868,8360,8336,8337,4761,8320,8322,8334,8335,6842,8720,8721,8782,4346] 
set surface_color, limon, C_surf_pocket1 
select C_surf_pocket2, protein_C and id [8582,8664,8665,8289,6235,8583,7987,2697,2699,6275,8288,8290,6345,2660,8578,8579,8580,8581,6425,6409,6421,6348,6405,6410,6418,8619,6252,6253,8650,6272,6264,6250,6285,6288,6289,6347,6349,6400,6346] 
set surface_color, limon, C_surf_pocket2 
select C_surf_pocket3, protein_C and id [2042,2103,3505,3507,6274,6265,6277,5833,5859,5881,5882,5883,5832,2038,2039,2084,2087,2101,2083,4724,5803,4723,4722,5556,5555,2695,2152,6314,6315,2151] 
set surface_color, limon, C_surf_pocket3 
select C_surf_pocket4, protein_C and id [1947,1868,1870,1931,1946,97,1994,3569,1992,1993,3582,1952,1950,305,28,50,283,324,326,38,25,29] 
set surface_color, limon, C_surf_pocket4 
select C_surf_pocket5, protein_C and id [1313,1314,972,940,973,1325,666,698,1003,1004,969,640,650,652,1337,662] 
set surface_color, limon, C_surf_pocket5 
select C_surf_pocket6, protein_C and id [1624,550,1600,551,220,228,237,243,231,244,2006,242] 
set surface_color, limon, C_surf_pocket6 
select C_surf_pocket7, protein_C and id [3065,8076,3185,3184,8078,2676,8115,8116,8225,8228] 
set surface_color, limon, C_surf_pocket7 
select C_surf_pocket8, protein_C and id [7332,7657,9174,9158,9159,9171,7729,7731,7292,9211,7780,7783,7784,7806,7655] 
set surface_color, limon, C_surf_pocket8 

# SAS points
load "../../p2rank_output/visualizations/data/7nn0_OK_D.pdb_points.pdb.gz", points_D
select D_surf_pocket1, protein_D and id [4810,4410,4411,4388,4406,4356,4357,4358,4359,4377,6813,6833,4378,8336,8342,6840,6841,8358,6837,6811,6812,4391,5759,5761,6217,6218,4392,5749,5748,8324,4769,8321,8333,8334,8343,8781,4761] 
set surface_color, deepteal, D_surf_pocket1 
select D_surf_pocket2, protein_D and id [2699,6271,6274,6284,8577,8580,8664,8289,8618,8574,8617,8619,6408,6287,8578,8579,8581,8582,7986,2658,2659,6288,6290,6421,6251,6252,6263,6511,6420,6347,6417,6234,8287,8288,6249,8646,8647,8648] 
set surface_color, deepteal, D_surf_pocket2 
select D_surf_pocket3, protein_D and id [1337,1325,652,1313,940,1314,972,967,973,650,662,666,668,1003,1004,969,698,700,1002,640] 
set surface_color, deepteal, D_surf_pocket3 
select D_surf_pocket4, protein_D and id [2707,2713,2695,2732,2151,2152,3508,2150,6313,6273,2715,2083,2149,6314,2087,2039,2041,2103,2040,2084] 
set surface_color, deepteal, D_surf_pocket4 
select D_surf_pocket5, protein_D and id [1624,242,243,244,550,231,237,220,228,1600,551,2006] 
set surface_color, deepteal, D_surf_pocket5 

deselect
 orient
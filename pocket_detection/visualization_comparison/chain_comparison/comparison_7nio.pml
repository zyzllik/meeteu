                  
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
        load "../../fpocket_output/7nio_OK_A_out.pdb", file_A
            select fpocket_A, hetatm and not metals and file_A
            select protein_A, not fpocket_A and not metals and file_A

            # Select single fpocket pockets
            pockets_A = []
            iterate fpocket_A, pockets_A.append(resv)
            for i in range(1, pockets_A[-1]+1): cmd.select("fpocket_A_"+str(i), "fpocket_A and resi "+str(i))
            
            hide everything, all
            load "../../fpocket_output/7nio_OK_E_out.pdb", file_E
            select fpocket_E, hetatm and not metals and file_E
            select protein_E, not fpocket_E and not metals and file_E

            # Select single fpocket pockets
            pockets_E = []
            iterate fpocket_E, pockets_E.append(resv)
            for i in range(1, pockets_E[-1]+1): cmd.select("fpocket_E_"+str(i), "fpocket_E and resi "+str(i))
            
            hide everything, all
            
            color white, elem c
            color bluewhite, protein_A
            show surface, protein_A
            set transparency, 0.2, protein_A
            align file_A, file_E
                           hide everything, protein_E
# SAS points
load "../../p2rank_output/visualizations/data/7nio_OK_A.pdb_points.pdb.gz", points_A
select A_surf_pocket1, protein_A and id [2066,2067,2068,2069,2113,2114,2115,2129,3532,3533,3534,3535,3548,6291,6300,6303,6312,6317,6318,6319,6316,6313,6335,2065,5888,5886,3575,3580,5890,5892,5951,5859,5872,5882,5858,5860,5868,5910,6531,1827,2007,5873,5874,2111,2112,2048,3565,1759,2047,2049,1815,2006,2004,6340,2178,2722,2734,2740,2754,2760,2179,3506,3536,3537,2758,3507,2757,6302,2742,6341,2176,2177,4750,4761,4748,4749,4758,5580,5581,5582,5576,5577,5579,5830,5831,5832,5833,5834,5909,5564,5565,5950,5789,4762,5788,4768,4774,4789,2702,2703,8312,8346,8347] 
set surface_color, raspberry, A_surf_pocket1 
select A_surf_pocket2, protein_A and id [2725,2726,6301,2685,2686,2687,8052,8315,7548,2741,8600,8601,8604,8608,8691,8605,8606,8607,8609,8643,8032,8013,8025,8030,8593,6371,6388,6390,6336,6338,2652,2653,7534,7535,8580,6444,6448,6451,6278,6279,6447,8646,6435,8644,8645,8676,6290,6298,6299,6311,6315,6276,6375,6373,6426,6314,8314,8316,8284,2703,2700] 
set surface_color, raspberry, A_surf_pocket2 
select A_surf_pocket3, protein_A and id [4433,4444,4415,4386,4404,4405,4406,4411,4448,4437,4438,4837,4893,4894,4895,4358,4385,4383,4384,6860,6838,6840,4450,6842,4418,4419,6205,6245,8348,4370,6195,6201,4762,4788,4796,5776,5785,5786,5787,5788,5821,8349,8350,6241,8360,8361,8362,8363,8367,6868,8385,6861,6864,8346,4789] 
set surface_color, raspberry, A_surf_pocket3 
select A_surf_pocket4, protein_A and id [3090,3092,3091,3250,3251,8091,8254,8251,8248,2413,2415,2438,3211,3212,8102,8104,8140,8141,8142,8325,2699,8269,8326,8284,8235,3088,8049,3107,8105] 
set surface_color, raspberry, A_surf_pocket4 
select A_surf_pocket5, protein_A and id [4449,4450,4453,6842,6844,4451,4452,4019,4079,4066,4067,4065,6843,4023,4393,4405,4448,4407,4465,4080,6792,6816,6786,6811,6815,6817,6814] 
set surface_color, raspberry, A_surf_pocket5 
select A_surf_pocket6, protein_A and id [4173,4234,4235,3761,3763,3764,4304,6741,6742,6743,6630,4303,3730,4276,3728,6718,6703] 
set surface_color, raspberry, A_surf_pocket6 
select A_surf_pocket7, protein_A and id [6217,6665,6218,7054,7094,6661,6646,6663,7052,7122,4338,4339,6728,6666,6483,6482] 
set surface_color, raspberry, A_surf_pocket7 
select A_surf_pocket8, protein_A and id [1896,1897,78,56,3597,2020,2021,3596,310,332,345,73,55,65,351,353,286,3609] 
set surface_color, raspberry, A_surf_pocket8 
select A_surf_pocket9, protein_A and id [677,679,689,696,667,1363,1364,1365,177,178,967,1339,1341,1029,1031] 
set surface_color, raspberry, A_surf_pocket9 
select A_surf_pocket10, protein_A and id [264,269,270,577,247,2033,1651,1627,578,2099] 
set surface_color, raspberry, A_surf_pocket10 
select A_surf_pocket11, protein_A and id [6604,6605,6606,6607,1824,6565,1938,1939,1940,6567,6563,6566,1881,1836,1838,1852,3680,6631] 
set surface_color, raspberry, A_surf_pocket11 
select A_surf_pocket12, protein_A and id [3173,3175,2485,2318,2618,2486,2518,2522,3134,2482,3171,2668,3195] 
set surface_color, raspberry, A_surf_pocket12 

# SAS points
load "../../p2rank_output/visualizations/data/7nio_OK_E.pdb_points.pdb.gz", points_E
select E_surf_pocket1, protein_E and id [4721,4730,5804,4392,4769,4772,5759,4731,4734,4735,4768,4722,5761,6217,6218,8333,8781,6841,8334,8335,8336,8358,8359,4809,4810,4865,4867,4410,4411,5749,4406,4391,4343,4356,4357,4377,4378,4384,4388,4389,4331,4365,4424,4869,4723,4724,5882,5550,5553,5554,5555,5549,5537,5538,5880,5881,5922,5923,5552,5921,5805,5802,5806,6264,6276,6273,6275,3521,5831,2040,2042,2041,5860,5862,5864,3553,3552,2086,2088,2084,2087,2100,3538,2103,2038,3533,4346,6811,6812,6837,4359,6813,6815,2671,2673,2672,5213,8283,8286,8285,8295,4741,4758,4761,4762,4745,8297,8319,8341,8342,8351,8356,2693,2695,2698,6313,2713,2716,2707,2152,3479,2731,2733,3505,3507,2149,2150,2151,6311,2131,2133,2204,2715,6314,2727,3464] 
set surface_color, marine, E_surf_pocket1 
select E_surf_pocket2, protein_E and id [8580,8581,8582,2661,2699,2659,7508,2638,2658,2660,8025,2625,2626,2675,2676,7986,8289,8664,8288,2674,8018,8022,8256,8257,8565,8573,8574,8577,8578,8006,8004,6263,6421,6420,6271,6284,6274,6249,6251,6252,6287,6348,6408,8566,8616,8617,8618,8619,6399,6417] 
set surface_color, marine, E_surf_pocket2 
select E_surf_pocket3, protein_E and id [4750,2995,5186,5188,5191,5130,4747,5213,5187,2733,3507,3510,5553,5554,5555,5556,2042,4731,4722] 
set surface_color, marine, E_surf_pocket3 
select E_surf_pocket4, protein_E and id [8021,3075,3095,8078,8075,8077,3101,3061,3184,3185,3117,3113,8127,2412,2388,8019,8022,8064,8252,8257,3062,3063,3064,3065,3224,8258,8298,8299,2674,8227,8115,8114,8223,8224,8236,8243,8024] 
set surface_color, marine, E_surf_pocket4 
select E_surf_pocket5, protein_E and id [6638,6639,7027,7067,6636,8649,8632,6456,6201,6204,8648,7028,7029,7046,4311,7041,7043,7044,7094,7095,6747,6457,6444,6191,6619,4312,6700,6689,6701,6200,6455,6188,6190] 
set surface_color, marine, E_surf_pocket5 
select E_surf_pocket6, protein_E and id [6291,5830,5831,5840,6292,6504,1800,5844,5846,1908,6290,1732,1969,2022,1787,1788,1968,1970,1977,1976,2088] 
set surface_color, marine, E_surf_pocket6 
select E_surf_pocket7, protein_E and id [4422,4423,4424,4425,4426,4053,4038,4039,4040,3992,4377,4378,4380,4365,4366,6759,6762,6765,6813,6787,6815,6816,6817,7167,7168,6784,6788,6790,6760,6777] 
set surface_color, marine, E_surf_pocket7 
select E_surf_pocket8, protein_E and id [3700,3701,3737,4276,4271,3703,4245,4247,4249,4242,4261,6676,4277,6691,6709,6713,6714,6716,6603,6604] 
set surface_color, marine, E_surf_pocket8 
select E_surf_pocket9, protein_E and id [3569,283,305,324,326,1870,1994,308,1952,1993,50,28,38,1868,46,260,259,3582] 
set surface_color, marine, E_surf_pocket9 
select E_surf_pocket10, protein_E and id [973,1313,1314,1337,668,669,640,698,700,1004,967,962,969] 
set surface_color, marine, E_surf_pocket10 
select E_surf_pocket11, protein_E and id [1087,1088,787,792,798,810,783,1040,1072,1073,1050,778] 
set surface_color, marine, E_surf_pocket11 
select E_surf_pocket12, protein_E and id [2458,2490,2491,2495,2455,2459,3147,7494,3146,3148,2589,2590,2591,2588,7493,3144,3168] 
set surface_color, marine, E_surf_pocket12 
select E_surf_pocket13, protein_E and id [237,241,243,220,550,551,2006,2072,1624,1610,1600,244] 
set surface_color, marine, E_surf_pocket13 
select E_surf_pocket14, protein_E and id [8954,8955,8988,8991,8564,8604,8605,8537,8539,8606,8953,8542] 
set surface_color, marine, E_surf_pocket14 
select E_surf_pocket15, protein_E and id [1714,1709,1708,1719,1572,1772,1571,1625] 
set surface_color, marine, E_surf_pocket15 
select E_surf_pocket16, protein_E and id [7711,7715,7709,7710,7780,9170,7729,7731,9155,9158,7805,7806,7779,7331,9209,9173,7654,7722,7723,7726] 
set surface_color, marine, E_surf_pocket16 
select E_surf_pocket17, protein_E and id [7290,7292,7291,7805,7806,7732,7731,9158] 
set surface_color, marine, E_surf_pocket17 

deselect
 orient
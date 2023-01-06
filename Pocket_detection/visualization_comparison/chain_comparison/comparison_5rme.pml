                  
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
        load "../../fpocket_output/5rme_OK_A_out.pdb", file_A
            select fpocket_A, hetatm and not metals and file_A
            select protein_A, not fpocket_A and not metals and file_A

            # Select single fpocket pockets
            pockets_A = []
            iterate fpocket_A, pockets_A.append(resv)
            for i in range(1, pockets_A[-1]+1): cmd.select("fpocket_A_"+str(i), "fpocket_A and resi "+str(i))
            
            hide everything, all
            load "../../fpocket_output/5rme_OK_B_out.pdb", file_B
            select fpocket_B, hetatm and not metals and file_B
            select protein_B, not fpocket_B and not metals and file_B

            # Select single fpocket pockets
            pockets_B = []
            iterate fpocket_B, pockets_B.append(resv)
            for i in range(1, pockets_B[-1]+1): cmd.select("fpocket_B_"+str(i), "fpocket_B and resi "+str(i))
            
            hide everything, all
            
            color white, elem c
            color bluewhite, protein_A
            show surface, protein_A
            set transparency, 0.2, protein_A
            align file_A, file_B
                           hide everything, protein_B
# SAS points
load "../../p2rank_output/visualizations/data/5rme_OK_A.pdb_points.pdb.gz", points_A
select A_surf_pocket1, protein_A and id [4404,6853,4389,4390,4378,6777,4821,4418,4419,4422,4423,4835,4434,4436,4437,4438,4879,4881,4004,4435,4065,4051,4052,4008,8368,8370,4822,6229,4402,4403,6230,5766,4783,5758,5760,8331,8345,8346,8347,8348,4772,4773,4784,4774,8333,8335,4747,5773,5767,5770,5771,4369,6824,6846,6849,6850,4370,4371,6827,6828,6825,6829,6799,6796,6802,4355,8793,6852,6771,6789] 
set surface_color, raspberry, A_surf_pocket1 
select A_surf_pocket2, protein_A and id [2672,2670,2710,8034,8037,2711,2647,2726,8032,2650,3073,3084,3088,7495,3087,6263,6264,6275,6283,6286,6287,6296,6301,6433,6523,8036,8268,8270,8310,2684,2686,8033,8090,8298,8299,8300,8301,8306,2638,6299,6356,6358,6360,2634,2637,7505,7506,7507,8577,8585,8586,8589,8590,8592,8593,8594,7532,7521,7528,7533,8018,8016,7517,7492,8045,8048,8676,7998,8044,8578,8628,8629,8630,6432,6469,8631,8658,8659,8661,6419,6420,6411,6416,6429] 
set surface_color, raspberry, A_surf_pocket2 
select A_surf_pocket3, protein_A and id [2053,6285,2098,6325,2114,2163,2051,2052,3491,6286,2719,2725,3476,2742,3493,2706,2707,2708,2739,2743,6326,2160,2094,2142,2144,2112,2113,2161,2162,2727,2728,2216,2095] 
set surface_color, raspberry, A_surf_pocket3 
select A_surf_pocket4, protein_A and id [2114,3517,2051,2052,5566,5568,3518,3520,2050,5876,5872,5874,5893,2053,5843,5844,6276,6285,2098,5894,4733,4734,5203,5565,5567,4735,5814,2111,3516,3550,2112] 
set surface_color, raspberry, A_surf_pocket4 
select A_surf_pocket5, protein_A and id [5852,5856,5857,5858,5859,1798,1919,1991,5839,5842,5844,6303,6304,6495,6516,1811,2033,1799,1987,1988,1743] 
set surface_color, raspberry, A_surf_pocket5 
select A_surf_pocket6, protein_A and id [6468,6651,6650,7037,7038,7039,6631,6646,6701,7077,7080,6200,6212,6213,8660,6216,7040,7041,8644,8661,4323,4324,6757,6759,7053,7054,7055,7058,7073,7104,6760,6755,6756,6455,6469,6203,6713] 
set surface_color, raspberry, A_surf_pocket6 
select A_surf_pocket7, protein_A and id [1349,1323,1325,984,661,680,650,651,709,711,1015,980,950,973,978,161,162,1348,663] 
set surface_color, raspberry, A_surf_pocket7 
select A_surf_pocket8, protein_A and id [1940,1957,1958,1963,1878,61,39,336,1879,2003,2004,2005,271,3581,270,294,316,329,3594,1942,1944] 
set surface_color, raspberry, A_surf_pocket8 
select A_surf_pocket9, protein_A and id [6613,6616,4289,6703,6688,6615,4259,4261,3712,3713,3715,3748,3749,6728,6727] 
set surface_color, raspberry, A_surf_pocket9 
select A_surf_pocket10, protein_A and id [798,809,821,788,789,793,794,1098,1099,1051,1083,1084] 
set surface_color, raspberry, A_surf_pocket10 
select A_surf_pocket11, protein_A and id [1808,6590,6591,6592,6673,1865,1923,1924,6548,6551,6552,6550,6614,6616,1820,1821,1822,1836] 
set surface_color, raspberry, A_surf_pocket11 
select A_surf_pocket12, protein_A and id [94,1435,1436,1437,116,120,103,104,105,115,126,1407,119] 
set surface_color, raspberry, A_surf_pocket12 

# SAS points
load "../../p2rank_output/visualizations/data/5rme_OK_B.pdb_points.pdb.gz", points_B
select B_surf_pocket1, protein_B and id [4394,4414,5751,4413,4772,4774,4813,4395,4346,4359,4360,4361,4393,4812,4870,4871,4872,4362,6816,6818,4380,4381,5796,8326,6217,6220,6181,4775,5762,5765,5758,5761,5757,6177,6171,6844,8339,8361,6843,8359,8360,8321,8322,8323,8324,8336,8337,8338,8784,4764,4765,6837,6840,6814,6815,6836] 
set surface_color, marine, B_surf_pocket1 
select B_surf_pocket2, protein_B and id [8569,8620,8621,8667,8622,8577,8580,8581,8582,8583,8584,8585,6237,8291,8290,8292,6274,6277,2663,2700,2701,2674,8261,8289,8297,8298,8301,6412,8576,2716,6289,6290,6347,7511,7520,8007,8009,8028,7989,2662,2661,2660,8259,8260,6252,6254,6255,6423,8652,6266,6287,6351,6407,6411,6420,6424,6402,6291,6349] 
set surface_color, marine, B_surf_pocket2 
select B_surf_pocket3, protein_B and id [6267,2104,3508,3509,2042,2043,2044,5834,5883,5884,5885,5863,5867,5865,3524,3556,5926,3555,2089,2086,2088,2090,3541,3536,3551,4723,4724,4725,4734,5557,5558,5559,4753,4726,4737,5806,5809,5764,5765,5805,5540,5556,5553,5552,5555,2729,3482,2732,2733,3511,3512,2697,2709,6276,6278,6279,2735,2715,2085,2151,2152,2153,2154,3462,6316,2717,6317,4750] 
set surface_color, marine, B_surf_pocket3 
select B_surf_pocket4, protein_B and id [4369,6787,6791,6793,4041,4055,4056,4042,4043,3995,4383,4425,4426,4428,4429,4362,6817,6818,6819,4381,6790,6820,4000,4427,6762,6763,6780,6744,6768] 
set surface_color, marine, B_surf_pocket4 
select B_surf_pocket5, protein_B and id [2677,3224,3225,3226,2676,3066,8022,8024,8025,8255,8260,8067,8069,8078,8080,8081,8117,3186,3187,3077,8302,8245,8224,8227,8230,8239,8118,8246] 
set surface_color, marine, B_surf_pocket5 
select B_surf_pocket6, protein_B and id [1734,1728,1731,1730,1979,2024,1790,1800,1982,5833,5835,5857,5843,6295,6294,6507,6486,5847,5848,5849,5850,1801,1803,6525] 
set surface_color, marine, B_surf_pocket6 
select B_surf_pocket7, protein_B and id [4313,4314,6191,6192,6194,7030,6641,4315,7071,7031,7032,7028,6203,6204,6637,6622,6704,7098,8652,8635,6447,6459,6642,6639] 
set surface_color, marine, B_surf_pocket7 
select B_surf_pocket8, protein_B and id [3706,4210,3704,3739,3740,4279,4280,4252,6606,6604,6679,4250,6694,6717,6718,6719,6675,4149] 
set surface_color, marine, B_surf_pocket8 
select B_surf_pocket9, protein_B and id [1327,1315,1316,942,700,702,1006,1005,971,642,654,1339,664,652,670,641] 
set surface_color, marine, B_surf_pocket9 
select B_surf_pocket10, protein_B and id [2643,3074,3170,2591,2593,3078,3079,2497,7487,7497,7498,8040,2637,2641,2642,2612,7513,2640,8027,2589,3137,3139,3082] 
set surface_color, marine, B_surf_pocket10 
select B_surf_pocket11, protein_B and id [4725,4734,4744,5557,5558,5559,4753,5157,5158,5159,5133,5555,5216,5154,5155,5176,5177,5186,5180,4750] 
set surface_color, marine, B_surf_pocket11 
select B_surf_pocket12, protein_B and id [260,284,50,306,309,319,325,327,1871,1872,1996,3572,1995,3585,3573,28,183,265] 
set surface_color, marine, B_surf_pocket12 
select B_surf_pocket13, protein_B and id [3571,3583,3589,5926,3601,3606,3555,5865,5921,5925,5981,5970,5982,5983,5555] 
set surface_color, marine, B_surf_pocket13 
select B_surf_pocket14, protein_B and id [7293,7294,7264,7295,7809,7262,9160,9161,7808,7850] 
set surface_color, marine, B_surf_pocket14 
select B_surf_pocket15, protein_B and id [6542,6582,6583,6541,6581,6664,1856,1914,1915,1799,1811,1827,3656,6606,6607,3654,3672] 
set surface_color, marine, B_surf_pocket15 
select B_surf_pocket16, protein_B and id [1400,1401,1402,1399,1380,1381] 
set surface_color, marine, B_surf_pocket16 

deselect
 orient
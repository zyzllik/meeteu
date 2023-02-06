                  
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
        load "../../fpocket_output/6zsl_OK_A_out.pdb", file_A
            select fpocket_A, hetatm and not metals and file_A
            select protein_A, not fpocket_A and not metals and file_A

            # Select single fpocket pockets
            pockets_A = []
            iterate fpocket_A, pockets_A.append(resv)
            for i in range(1, pockets_A[-1]+1): cmd.select("fpocket_A_"+str(i), "fpocket_A and resi "+str(i))
            
            hide everything, all
            load "../../fpocket_output/6zsl_OK_B_out.pdb", file_B
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
load "../../p2rank_output/visualizations/data/6zsl_OK_A.pdb_points.pdb.gz", points_A
select A_surf_pocket1, protein_A and id [2708,2645,2670,2709,8031,8033,8034,2724,2648,3071,3082,7492,7493,7491,3085,3072,6258,6260,6261,6272,6280,6283,6284,6293,6297,6298,8298,6430,6433,8303,2685,8266,8267,8307,2682,3074,8087,8295,8296,8297,2635,2636,6296,6355,6357,2632,7502,7504,8582,8583,8586,8587,8589,8590,8591,8673,8015,7995,8013,7529,7530,8041,8042,8575,8625,8626,8627,8628,6243,6429,6408,6417,6413,6416,6426,7514,7516,7517,7518,7525,7489] 
set surface_color, raspberry, A_surf_pocket1 
select A_surf_pocket2, protein_A and id [8342,8343,8344,8345,4770,4771,4772,4778,4779,4781,4820,6226,4401,4402,4399,4400,4879,4420,4421,4833,5756,5758,8329,8330,8332,8328,6227,5769,5771,5765,5768,4782,5764,8790,4353] 
set surface_color, raspberry, A_surf_pocket2 
select A_surf_pocket3, protein_A and id [5892,2049,2050,2051,2052,5564,5565,5566,5891,2113,2162,3515,5872,6282,6322,5841,6270,6273,6285,6283,6284,2741,2705,2706,2737,3474,2740,3491,2717,2723,5563,4732,4733,4741,4744,5813,5812,5815,2093,6321,6323,2215,2725,2726,3473,2161,2159,2160,2141,2143,2094,2096,2097,2098] 
set surface_color, raspberry, A_surf_pocket3 
select A_surf_pocket4, protein_A and id [4431,4434,4878,4427,4428,4876,4952,4954,4401,4402,4387,4388,4394,4399,4879,4416,6850,8345,8365,6849,6820,6821,6843,6846,6847,4367,4368,4369,6822,6824,8367] 
set surface_color, raspberry, A_surf_pocket4 
select A_surf_pocket5, protein_A and id [6647,6648,4322,6628,6645,6698,6710,6197,6198,6209,6210,8657,6213,8656,8658,6464,4321,7036,6465,6466,6756,6757,7055,6751,6752,6753,7037,7038,8641,7034,7050,7051,7052,7053,7074,7077,7101,7100,6200,6707,6709] 
set surface_color, raspberry, A_surf_pocket5 
select A_surf_pocket6, protein_A and id [5840,5842,1810,5850,5854,5855,5856,6513,6300,6301,5868,1990,5864,2050,2051,6492,2097,2032,1798,1918,1978,1986,1979,1987,1742] 
set surface_color, raspberry, A_surf_pocket6 
select A_surf_pocket7, protein_A and id [4286,4287,6700,6706,6718,6685,3710,3711,3713,3745,3746,3747,6612,4257,4259,6719,6722,6723,6725,4156,4217,4218,6613] 
set surface_color, raspberry, A_surf_pocket7 
select A_surf_pocket8, protein_A and id [4431,4432,4434,4433,4436,4062,4063,4050,4002,4435,4049,4387,4388,4390,4376,6771,6774,6824,6825,6826,6793,6799,6768,6786] 
set surface_color, raspberry, A_surf_pocket8 
select A_surf_pocket9, protein_A and id [60,38,1875,1877,1878,1939,1956,1957,2002,2003,2004,1962,3579,318,269,315,328,335,1943,3592,1941] 
set surface_color, raspberry, A_surf_pocket9 
select A_surf_pocket10, protein_A and id [1335,1348,1322,1324,650,1014,660,678,679,708,710,949,977,980,1012,979,161,662,160,1346,1347,1341] 
set surface_color, raspberry, A_surf_pocket10 
select A_surf_pocket11, protein_A and id [808,797,820,1051,1082,1083,793,1097,774,792,1098,1050,1056,1078,1063,787,788] 
set surface_color, raspberry, A_surf_pocket11 
select A_surf_pocket12, protein_A and id [6545,6547,1864,1921,1922,1923,6548,1857,1861,1862,1807,6587,6588,6589,6613,6670,6612,3661,3663,6611,1835,1844] 
set surface_color, raspberry, A_surf_pocket12 
select A_surf_pocket13, protein_A and id [3152,3158,2501,2505,2468,2469,7504,2597,2598,3087,2650,2651,2471,3177,3154,3178] 
set surface_color, raspberry, A_surf_pocket13 
select A_surf_pocket14, protein_A and id [1289,1387,1408,1409,1410,1388,1389,1264,1407] 
set surface_color, raspberry, A_surf_pocket14 
select A_surf_pocket15, protein_A and id [75,94,415,1446,1447,1448,1492,1494,1495,1502,74,91] 
set surface_color, raspberry, A_surf_pocket15 

# SAS points
load "../../p2rank_output/visualizations/data/6zsl_OK_B.pdb_points.pdb.gz", points_B
select B_surf_pocket1, protein_B and id [8318,8333,8334,8335,6216,8332,4356,4391,8780,4343,4771,4760,4768,4769,4772,4810,4762,4823,5748,6153,4390,4324,4388,4389,6166,5754,5755,5758,5759,5762,5793,6167,6168,6173,8322,8320,6213,6215,6217,6177,4411,4421,4869,4357,4392,6815,6816,6812,6810,6811,6832,6833,6836,6839,6840,8355,8356,8357,8358,4807,4809,4410,4867,4868,3997,4424] 
set surface_color, marine, B_surf_pocket1 
select B_surf_pocket2, protein_B and id [8663,8618,8577,8579,8580,8573,8576,8581,8565,8572,8616,2714,2716,2661,2698,6273,6343,8566,2658,2659,2660,8023,7507,8003,8005,7985,6250,6419,6420,6423,6407,8617,6416,6262,6270,6283,6287,6347,6403,6398,6408,6248,8287,6251,6233,2673,2674,2676,8256,8257,8286,8288,2672,2668,3065] 
set surface_color, marine, B_surf_pocket2 
select B_surf_pocket3, protein_B and id [2102,3505,3507,2087,6263,6272,6275,2038,2039,2040,2041,2042,3533,5862,5864,5860,5923,3521,3548,3552,3553,5831,2083,2100,3538,2084,2086,2088,2727,2150,2151,2152,3479,2730,2695,2707,2713,2715,6312,6274,2149,6311,6313,2131,4721,4722,4723,4724,5880,5881,5882,5553,5554,5555,5556,5550,5552,4734,4735,5761,5803,5802,5762,5806,2733,2731] 
set surface_color, marine, B_surf_pocket3 
select B_surf_pocket4, protein_B and id [2673,2674,8018,8021,8256,8257,8065,8297,8223,8235,8242,8298,8251,2672,2668,3063,3064,3065,3223,3224,3061,3062,8020,8226,8074,8077,8113,8114,8063,3222,2661] 
set surface_color, marine, B_surf_pocket4 
select B_surf_pocket5, protein_B and id [7165,4424,3994,4423,4425,4426,3992,4038,4039,4040,6815,6816,6814,4366,6786,6813,6776,6783,6787,6788,6789,6758,6740,4053,4093,6764] 
set surface_color, marine, B_surf_pocket5 
select B_surf_pocket6, protein_B and id [6200,6188,6454,6455,6187,4311,6637,6638,4312,8631,7007,7024,7027,7028,7026,7065,7066,7067,6633,6635,6618,6688,6700,7094,6442,6456] 
set surface_color, marine, B_surf_pocket6 
select B_surf_pocket7, protein_B and id [1980,5830,5832,6503,5840,2039,6482,6291,6290,5846,5844,5845,5847,1798,1801,1977,1787,1788,1729,1728,2022,1732] 
set surface_color, marine, B_surf_pocket7 
select B_surf_pocket8, protein_B and id [3703,3701,3733,3736,3737,4276,4277,4247,4249,6602,6600,6714,6671,6690,6673,6675,4145,4146,4208,6709,6713,6715,3735] 
set surface_color, marine, B_surf_pocket8 
select B_surf_pocket9, protein_B and id [2589,7494,3080,7493,2591,2495,2458,2491,7483,2641,3168,3076,3077,2455,3137,3147,2446,2447,2587] 
set surface_color, marine, B_surf_pocket9 
select B_surf_pocket10, protein_B and id [700,1313,1314,940,969,666,698,668,1003,1004,1337,639,640,650,662,652] 
set surface_color, marine, B_surf_pocket10 
select B_surf_pocket11, protein_B and id [1869,283,1870,28,50,305,318,324,326,1994,3569,259,264,1993,3582] 
set surface_color, marine, B_surf_pocket11 
select B_surf_pocket12, protein_B and id [5213,5190,5191,4747,4750,5556,5553,5554,5555,3507,3510] 
set surface_color, marine, B_surf_pocket12 
select B_surf_pocket13, protein_B and id [1797,6578,6579,6576,6577,6538,1854,1912,1809,1825,1810,6537,3653,6602,6601,6603,3650,3651,3669] 
set surface_color, marine, B_surf_pocket13 
select B_surf_pocket14, protein_B and id [3097,3079,3075,3076,3078,8036,7543,8032,8035,8089,8077,8034] 
set surface_color, marine, B_surf_pocket14 
select B_surf_pocket15, protein_B and id [228,237,243,220,1600,1609,1610,550,551,244,1624] 
set surface_color, marine, B_surf_pocket15 

deselect
 orient
                  
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
        load "../../fpocket_output/5rm2_OK_A_out.pdb", file_A
            select fpocket_A, hetatm and not metals and file_A
            select protein_A, not fpocket_A and not metals and file_A

            # Select single fpocket pockets
            pockets_A = []
            iterate fpocket_A, pockets_A.append(resv)
            for i in range(1, pockets_A[-1]+1): cmd.select("fpocket_A_"+str(i), "fpocket_A and resi "+str(i))
            
            hide everything, all
            load "../../fpocket_output/5rm2_OK_B_out.pdb", file_B
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
load "../../p2rank_output/visualizations/data/5rm2_OK_A.pdb_points.pdb.gz", points_A
select A_surf_pocket1, protein_A and id [4402,4403,4404,4355,4368,4369,4370,4371,6825,6849,4389,4390,6827,6828,6829,4881,4783,4422,4821,4835,4423,4400,5760,4879,4880,4433,4434,4436,4437,4438,6853,8347,8348,8368,8369,6852,8370,4819,4822,6230,8331,8333,8335,8345,8346,8793,5805,6226,6228,6229,6189,6180,6181,6186,6190,5770,5771,5758,5766,5767,5773,4772,4773,4781,4784,4774,6846] 
set surface_color, raspberry, A_surf_pocket1 
select A_surf_pocket2, protein_A and id [6275,8592,6263,8593,8594,6416,6429,6433,6432,6436,6521,6283,2710,6286,6296,6302,2637,2670,2672,7528,7529,7533,2711,8037,7532,2709,2647,3091,7495,7492,8045,8048,2650,3089,3084,3085,3088,3090,2651,8298,8299,8268,8269,8270,8301,7998,2684,8034,8030,8032,8044,2686,6261,6264,8300,8676,6523,8306,8307,8310,2638,7519,7521,7522,7506,7517,2634,6360,6411,8589,7520,8016,8018,8590,6419,6420,6421,8577,8578,8585,8586,8628,8629,8630,8631,8625] 
set surface_color, raspberry, A_surf_pocket2 
select A_surf_pocket3, protein_A and id [2115,3517,3518,3519,3520,3521,2052,5872,5874,5893,2053,2054,5843,6285,2099,6276,2051,5565,5566,5567,5568,5818,4735,5814,5894,5202,5203,4733,4742,4743,4746,4734,2112,2100] 
set surface_color, raspberry, A_surf_pocket3 
select A_surf_pocket4, protein_A and id [5852,6516,1812,5856,5857,5858,1920,2053,5842,5843,5844,6303,6304,2099,6495,2034,1744,1800,1980,1981,1988,1989] 
set surface_color, raspberry, A_surf_pocket4 
select A_surf_pocket5, protein_A and id [6325,2115,2164,3491,2053,6285,2099,2051,2052,2719,2725,3476,2707,2739,2742,2743,3493,2708,2745,2161,2162,2163,2096,2095,2113,2112,6326,6324,2143,3475,3473,2727,2098,2100] 
set surface_color, raspberry, A_surf_pocket5 
select A_surf_pocket6, protein_A and id [6216,7040,7041,7058,7039,7053,7054,7055,7073,7077,7080,6651,6760,6756,7103,7104,4323,4324,6203,6757,6759,6631,6701,6713,6212,6213,6754,6755,6468,6201,6467,6650,6646,6648] 
set surface_color, raspberry, A_surf_pocket6 
select A_surf_pocket7, protein_A and id [4289,6703,6728,4259,3712,3715,4219,3713,3746,3748,3749,4220,4288,4158,4157,6615,6616,4261,6688] 
set surface_color, raspberry, A_surf_pocket7 
select A_surf_pocket8, protein_A and id [162,1343,1348,1349,1350,1337,652,664,681,710,712,985,1322,1324,1326,951,1016,1014,981] 
set surface_color, raspberry, A_surf_pocket8 
select A_surf_pocket9, protein_A and id [6827,6828,6829,4004,4052,4065,4051,4390,4378,6777,4435,4436,4437,4438,4392,6802] 
set surface_color, raspberry, A_surf_pocket9 
select A_surf_pocket10, protein_A and id [1941,1958,1959,1962,2004,2005,2006,3581,1880,49,57,1877,1878,1879,59,274,275,60,61,39,329,333,336,1964,270,316,1943,1945,3594] 
set surface_color, raspberry, A_surf_pocket10 
select A_surf_pocket11, protein_A and id [8236,8238,8126,8127,8264,8255,8036,8076,2687,2688,3077,3076,8090,8087,3073,3236,3197,3196,8269] 
set surface_color, raspberry, A_surf_pocket11 
select A_surf_pocket12, protein_A and id [5565,5566,5567,5568,5563,5564,5202,5203,5199,5201,5164,5537,5141,5142,4734,4759,4762,5195] 
set surface_color, raspberry, A_surf_pocket12 
select A_surf_pocket13, protein_A and id [5818,4743,4746,4747,4753,5773,4770,4774,4734,8297,4757,4759,5225,8296,8306,8307,6288] 
set surface_color, raspberry, A_surf_pocket13 
select A_surf_pocket14, protein_A and id [1809,1859,1866,1923,1924,1925,1837,1863,6590,6591,6592,6548,6550,6614,6616,6551,3663,3665,3662] 
set surface_color, raspberry, A_surf_pocket14 
select A_surf_pocket15, protein_A and id [799,1052,1084,1085,1099,798,1100,822,810,790,794,795] 
set surface_color, raspberry, A_surf_pocket15 
select A_surf_pocket16, protein_A and id [5935,3580,5874,5876,3564,3565,5934,5979,5990,5991,5992,5993] 
set surface_color, raspberry, A_surf_pocket16 
select A_surf_pocket17, protein_A and id [1731,1784,1637,1638,1582,1583,1584,1726] 
set surface_color, raspberry, A_surf_pocket17 
select A_surf_pocket18, protein_A and id [3092,2467,2470,2471,2507,2503,2622,2599,2600,7507,3090,2652,2653,3181,2473,3154,3155,3156,3179,3180] 
set surface_color, raspberry, A_surf_pocket18 

# SAS points
load "../../p2rank_output/visualizations/data/5rm2_OK_B.pdb_points.pdb.gz", points_B
select B_surf_pocket1, protein_B and id [8568,8576,8578,8582,8618,8619,8621,8666,8580,8581,8583,8584,8290,6273,6276,2662,2698,2699,2700,6236,8288,8291,8260,8567,8575,8579,8569,2715,6289,6311,6346,8027,7988,8008,8006,7510,2659,2660,2661,8024,8258,8259,2669,2674,6253,6410,6422,6423,8620,6251,6254,8651,6459,6265,6272,6286,6348,6350,6406,6419,6401,6411,6290] 
set surface_color, marine, B_surf_pocket1 
select B_surf_pocket2, protein_B and id [4392,4393,4394,4390,5749,5750,6156,4773,4774,4771,4812,4825,5748,4345,4413,4871,6819,4811,4412,4869,5760,5761,5764,5795,8325,5756,5757,6170,6169,6216,6218,6219,6220,6171,6176,6180,6843,8338,8358,8360,8323,8335,8321,8783,8336,8337,4764] 
set surface_color, marine, B_surf_pocket2 
select B_surf_pocket3, protein_B and id [2040,5555,2103,3510,3523,3507,2042,5833,5804,6266,6275,5808,2101,3540,2102,2104,2085,2087,2088,2089,5882,5883,5884,5552,5554,5924,5925,2041,2043,5862,3550,5864,5866,3554,3555,2039,3535,3539,4722,4724,4725,4736,5763,4737,5557,5556,5558,5539,5764,5805,2708,2728,2734,3481,2731,2732,2696,6277,6278,2714,2151,2153,6315,2716,6316] 
set surface_color, marine, B_surf_pocket3 
select B_surf_pocket4, protein_B and id [6446,6640,6641,6636,6638,7010,8634,6458,6459,6203,6206,4313,4314,6193,7029,7068,7070,7069,7031,7027,7030,6621,6691,6703] 
set surface_color, marine, B_surf_pocket4 
select B_surf_pocket5, protein_B and id [4424,4425,4426,4427,4428,3994,4041,4042,6789,6817,6815,4367,4368,6767,6786,6790,4380,4382,4053,4054,4055,6761,6764] 
set surface_color, marine, B_surf_pocket5 
select B_surf_pocket6, protein_B and id [4870,4871,6819,4380,4869,6817,6818,6815,4368,4424,4426,4427,4428,8360] 
set surface_color, marine, B_surf_pocket6 
select B_surf_pocket7, protein_B and id [5832,1981,5856,5834,5842,6506,5846,5847,5849,6485,1802,1799,5848,1969,1977,1978,2023,1788,1789,1729,1730,1787,6293,6294,1733] 
set surface_color, marine, B_surf_pocket7 
select B_surf_pocket8, protein_B and id [7728,7332,7731,7733,7849,7293,7807,7808,9159,7292,9160,7294,7656,7725,7724,7784,7785,7261,7333,9212,9211] 
set surface_color, marine, B_surf_pocket8 
select B_surf_pocket9, protein_B and id [3702,4251,3703,3705,3739,6678,6716,6718,3738,4278,4279,6693,6674,6717,6603,6605] 
set surface_color, marine, B_surf_pocket9 
select B_surf_pocket10, protein_B and id [5552,5554,5924,5925,5864,3588,3554,3555,3570,5920,5969,3605,5981,5980,5982,5983] 
set surface_color, marine, B_surf_pocket10 
select B_surf_pocket11, protein_B and id [1326,1314,1338,1315,940,701,1003,1005,970,651,641,653] 
set surface_color, marine, B_surf_pocket11 
select B_surf_pocket12, protein_B and id [1871,1995,3571,284,306,309,28,50,319,325,327,265,264,1994,260,3572,3584] 
set surface_color, marine, B_surf_pocket12 
select B_surf_pocket13, protein_B and id [1855,3655,1914,6580,6581,1798,6540,6606,6582,6663,6541,6542,1913,1810,1812] 
set surface_color, marine, B_surf_pocket13 
select B_surf_pocket14, protein_B and id [6712,4145,4147,4148,4210,3750,4188,4189,3705,3739,6678,6718,3735,3736,3737,3738] 
set surface_color, marine, B_surf_pocket14 
select B_surf_pocket15, protein_B and id [2587,2588,2590,7495,7496,2592,2496,2642,3169,3077,3078,3079,7497,2641,2611,3138,3143,3146,3145,2459] 
set surface_color, marine, B_surf_pocket15 
select B_surf_pocket16, protein_B and id [784,800,788,811,1073,1074,1088,779,1089,1041] 
set surface_color, marine, B_surf_pocket16 

deselect
 orient